// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


//Exercise 2 - Binary to Decimal Converter

//Part A - String Conversion (5 points)

//What should I do to solve this question:
//Step 1: Create a function that can accept a string representing a binary number as input.
//Step 2: Process the input string into individual characters 
//so that each character is checked for "1" or "0" one by one .
//Step 3: For each character in the string, determine its binary weight (power of 2) based on the positions, 
//and add it to the sum to get the decimal value.



contract BinaryToDecimal {
    // This function can convert binary string to decimal integer
    //This function receives a "string memory binaryStr" as a parameter 
    //and returns a decimal number of uint type.
    
    //The memory keyword indicates that binaryStr is a temporary string 
    //that only exists during the function call.

    function binaryToDecimal(string memory binaryStr) public pure returns (uint) {
        bytes memory bStr = bytes(binaryStr); //Convert a string to a byte array so it can be accessed one by one.
        uint decimal = 0;
        
        for(uint i = 0; i < bStr.length; i++) {
            // Check each character, if it is '1', then calculate the corresponding power of 2
            if(bStr[i] == bytes1('1')) {
                decimal += 2 ** (bStr.length - i - 1);//Calculate the binary weight represented by i 
                                                      //and accumulate the result into the decimal variable.
            }
        }
        
        return decimal;// The function finally returns the accumulated decimal value.
    }
}




//Part B - Masking and Bitwise Operations (10 points)

//What should I do to solve this question:

//Step 1: Create a function that can accept a uint8 type parameter and returns an integer array. 
//This array contains the decimal values corresponding to the binary digits of input value.

//Step 2: The value of each bit is extracted by left-shifting the mask one by one in a loop 
//and by calculating it with the original value using the "AND" way.

//Step 3: Store the result of each loop into the array 
//if the bit is 1, then get the corresponding decimal value; if the bit is 0, then get 0.   



contract BitwiseDecomposer {
    //This function receives a "uint8 type parameter x" 
    //and returns a "uint[ ] memory type" array "bitsDecomposed",
    //this array is used to store the decimal representation of each bit.
    function decompose(uint8 x) public pure returns (uint[] memory) {
        uint[] memory bitsDecomposed = new uint[](8); // Because it is uint8, the array size is 8.
        uint mask = 1; // The initial mask is set to 1 (0001)

        for(uint i = 0; i < 8; ++i) {
            // Extract each bit by left shifting the mask and by calculating it with x using "AND" way.
            if((x & (mask << i)) != 0) {
                bitsDecomposed[i] = 2 ** i; // If the i-th bit is 1, then calculate 2 raised to the i power
            } else {
                bitsDecomposed[i] = 0; // If the i-th bit is 0, then the array element remains 0.
            }
        }

        return bitsDecomposed; // Returns the decomposed array, 
         //which contains the decimal value corresponding to the binary digit of the input number x.
    }
}

