// systems/infinite_map_rs/src/glass_ram/hilbert_skilling.rs
//
// Skilling's 3D Hilbert Curve Implementation
// based on "Programming the Hilbert Curve" by John Skilling (2004)
//
// This module implements the Hilbert curve mapping using efficient bitwise operations
// and Gray code transpositions, achieving O(B*D) complexity where B is bits and D is dimensions (3).

/// Implementation of Skilling's algorithm for 3D Hilbert curves
#[derive(Debug, Clone, Copy)]
pub struct Hilbert3D {
    bits: u32,
}

impl Hilbert3D {
    /// Create a new 3D Hilbert mapper for a given number of bits per dimension
    /// Total curve length will be 2^(3*bits)
    pub fn new(bits: u32) -> Self {
        Self { bits }
    }

    /// Convert 3D coordinates to Hilbert distance (index)
    /// Coordinates (x, y, z) must each be < 2^bits
    pub fn xyz_to_d(&self, x: u32, y: u32, z: u32) -> u64 {
        let mut coords = [x, y, z];

        // 1. Transform Axes to Transposed (Gray code components)
        self.axes_to_transpose(&mut coords);
        
        // 2. Bit Interleave
        // Skilling's order: "Inverse of distribution"
        // Interleave: bit i of coords[d] -> bit 3*i + (2-d) of h (Big Endian Interleave for Skilling)
        
        let mut interleave = 0u64;
        for i in 0..self.bits {
            for d in 0..3 {
                if (coords[d as usize] & (1 << i)) != 0 {
                    // Skilling usually interleaves: z_i y_i x_i ...
                    // Let's use standard: ... z0 y0 x0
                    interleave |= 1 << (3 * i + d);
                }
            }
        }
        
        // 3. Gray Decode (Gray to Binary)
        let mut final_h = interleave;
        let mut shifts = 1;
        while shifts < (3 * self.bits) {
             final_h ^= final_h >> shifts;
             shifts <<= 1;
        }
        
        final_h
    }

    /// Skilling's un-rotation ("Inverse") function
    /// Modifies coordinates in-place to the "transposed" state (Gray code components)
    fn axes_to_transpose(&self, x: &mut [u32; 3]) {
        let n = 3; // dimensions
        // Iterate bits from MSB to LSB
        let mut m = 1u32 << (self.bits - 1);

        while m > 0 {
            // Loop through dimensions from (n-1) down to 0
            // (Skilling C code loop direction)
            
            let mut i = (n - 1) as isize;
            while i >= 0 {
                // If the bit at M is set for dimension I
                if (x[i as usize] & m) != 0 {
                     // Intra-bit exchange (XOR swap) with lower dimension 0
                     let t = (x[0] ^ x[i as usize]) & (m - 1);
                     x[0] ^= t;
                     x[i as usize] ^= t;
                }
                i -= 1;
            }
            m >>= 1;
        }
    }

    /// Convert Hilbert distance (index) to 3D coordinates
    pub fn d_to_xyz(&self, d: u64) -> (u32, u32, u32) {
        let mut h = d;
        
        // 1. Binary to Gray
        h ^= h >> 1;
        
        // 2. De-interleave bits to get "Transposed" coordinates
        let mut x = [0u32; 3];
        
        for i in 0..self.bits {
            for d in 0..3 {
                 if (h & (1 << (3 * i + d))) != 0 {
                     x[d as usize] |= 1 << i;
                 }
            }
        }
        
        // 3. Apply Skilling's rotation logic (Transpose to Axes)
        // Note: For Skilling's method, the transformation is self-inverse.
        // We use the same axes_to_transpose function (which swaps bits based on higher bits).
        
        self.axes_to_transpose(&mut x);
        
        (x[0], x[1], x[2])
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_skilling_roundtrip() {
        let mapper = Hilbert3D::new(4); // 4 bits = 16x16x16 cube
        let limit = 16 * 16 * 16;
        
        for i in 0..limit {
            let index = i as u64;
            let (x, y, z) = mapper.d_to_xyz(index);
            let index2 = mapper.xyz_to_d(x, y, z);
            
            assert_eq!(index, index2, "Roundtrip failed at {}", index);
            
            // Verified range
            assert!(x < 16);
            assert!(y < 16);
            assert!(z < 16);
        }
    }

    #[test]
    fn test_locality() {
        let mapper = Hilbert3D::new(3); // 8x8x8
        let (x1, y1, z1) = mapper.d_to_xyz(0);
        let (x2, y2, z2) = mapper.d_to_xyz(1);
        
        let dist = (x1 as i32 - x2 as i32).abs() + 
                   (y1 as i32 - y2 as i32).abs() +
                   (z1 as i32 - z2 as i32).abs();
                   
        assert_eq!(dist, 1, "Hilbert curve must be continuous (dist=1)");
    }
}
