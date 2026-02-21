//! Unified Hilbert Curve Reference Implementation
//!
//! This module provides the canonical implementation of Hilbert curve
//! coordinate transformations for all Geometry OS components.
//!
//! All implementations in Python, Rust, and WGSL MUST produce identical
//! results for the same inputs. Use the test vectors to verify compliance.
//!
//! ## Reference Algorithm
//!
//! The Hilbert curve is a space-filling curve that preserves spatial locality.
//! It maps 1D indices to 2D coordinates on an n×n grid (where n is a power of 2).
//!
//! ## Test Vectors
//!
//! | n | d | (x, y) |
//! |---|---|--------|
//! | 4 | 0 | (0, 0) |
//! | 4 | 1 | (1, 0) |
//! | 4 | 2 | (1, 1) |
//! | 4 | 3 | (0, 1) |
//! | 8 | 0 | (0, 0) |
//! | 8 | 7 | (0, 1) |
//!
//! ## Usage
//!
//! ```rust
//! use hilbert::{d2xy, xy2d, HilbertCurve};
//!
//! // Convert distance to coordinates
//! let (x, y) = d2xy(8, 7);  // Returns (0, 1)
//!
//! // Convert coordinates to distance
//! let d = xy2d(8, 0, 1);  // Returns 7
//!
//! // Using the struct (for grid_size caching)
//! let curve = HilbertCurve::new(8);
//! let (x, y) = curve.d2xy(7);
//! ```

/// Convert Hilbert distance to (x, y) coordinates.
///
/// This is the canonical implementation. All other implementations
/// (Python, WGSL, external crates) MUST match these results exactly.
///
/// # Arguments
///
/// * `n` - Grid size (must be power of 2, e.g., 4, 8, 16, 32, 64, 128...)
/// * `d` - Distance along the curve (0 to n²-1)
///
/// # Returns
///
/// (x, y) coordinates where 0 ≤ x, y < n
///
/// # Algorithm
///
/// ```text
/// x, y = 0, 0
/// s = 1
/// while s < n:
///     rx = 1 & (d / 2)
///     ry = 1 & (d ^ rx)
///     if ry == 0:
///         if rx == 1:
///             x = s - 1 - x
///             y = s - 1 - y
///         swap(x, y)
///     x += s * rx
///     y += s * ry
///     d /= 4
///     s *= 2
/// ```
///
/// # Examples
///
/// ```
/// assert_eq!(d2xy(4, 0), (0, 0));
/// assert_eq!(d2xy(4, 1), (1, 0));
/// assert_eq!(d2xy(4, 2), (1, 1));
/// assert_eq!(d2xy(4, 3), (0, 1));
/// ```
#[inline]
pub fn d2xy(n: u32, d: u64) -> (u32, u32) {
    let mut x = 0u32;
    let mut y = 0u32;
    let mut s = 1u32;
    let mut d = d;

    while s < n {
        let rx = (1 & (d / 2)) as u32;
        let ry = (1 & (d ^ rx as u64)) as u32;

        // Rotate/flip quadrant
        if ry == 0 {
            if rx == 1 {
                x = s - 1 - x;
                y = s - 1 - y;
            }
            // Swap x and y
            std::mem::swap(&mut x, &mut y);
        }

        x += s * rx as u32;
        y += s * ry as u32;

        d /= 4;
        s *= 2;
    }

    (x, y)
}

/// Convert (x, y) coordinates to Hilbert distance.
///
/// This is the inverse of `d2xy`. The round-trip property must hold:
/// `xy2d(n, d2xy(n, d)) == d` for all valid inputs.
///
/// # Arguments
///
/// * `n` - Grid size (must be power of 2)
/// * `x` - X coordinate (0 ≤ x < n)
/// * `y` - Y coordinate (0 ≤ y < n)
///
/// # Returns
///
/// Distance d along the curve (0 to n²-1)
///
/// # Algorithm
///
/// ```text
/// d = 0
/// s = n / 2
/// while s > 0:
///     rx = (x & s) > 0
///     ry = (y & s) > 0
///     d += s * s * ((3 * rx) ^ ry)
///     if ry == 0:
///         if rx == 1:
///             x = s - 1 - x
///             y = s - 1 - y
///         swap(x, y)
///     s /= 2
/// ```
///
/// # Examples
///
/// ```
/// assert_eq!(xy2d(4, 0, 0), 0);
/// assert_eq!(xy2d(4, 1, 0), 1);
/// assert_eq!(xy2d(4, 1, 1), 2);
/// assert_eq!(xy2d(4, 0, 1), 3);
/// ```
#[inline]
pub fn xy2d(n: u32, x: u32, y: u32) -> u64 {
    let mut d = 0u64;
    let mut s = n / 2;
    let mut x = x;
    let mut y = y;

    while s > 0 {
        let rx = (x & s) > 0;
        let ry = (y & s) > 0;
        d += (s * s) as u64 * (((3 * rx as u64) ^ ry as u64) as u64);

        // Rotate/flip quadrant
        if !ry {
            if rx {
                x = (s - 1).wrapping_sub(x);
                y = (s - 1).wrapping_sub(y);
            }
            // Swap x and y
            std::mem::swap(&mut x, &mut y);
        }

        s /= 2;
    }

    d
}

/// Hilbert curve with cached grid size.
///
/// Useful when performing multiple conversions on the same grid size,
/// as it validates the grid size once and provides a cleaner API.
pub struct HilbertCurve {
    /// Grid size (must be power of 2)
    pub n: u32,
    /// Order (log2 of n)
    pub order: u32,
    /// Total number of pixels (n²)
    pub total_pixels: u64,
}

impl HilbertCurve {
    /// Create a new Hilbert curve for the given grid size.
    ///
    /// # Panics
    ///
    /// Panics if `n` is not a power of 2.
    ///
    /// # Examples
    ///
    /// ```
    /// let curve = HilbertCurve::new(64);
    /// assert_eq!(curve.n, 64);
    /// assert_eq!(curve.order, 6);
    /// ```
    pub fn new(n: u32) -> Self {
        assert!(n.is_power_of_two(), "Grid size must be power of 2");
        let order = n.trailing_zeros();
        let total_pixels = (n * n) as u64;

        Self {
            n,
            order,
            total_pixels,
        }
    }

    /// Create from order (grid size = 2^order).
    ///
    /// # Examples
    ///
    /// ```
    /// let curve = HilbertCurve::from_order(6);  // 64x64 grid
    /// assert_eq!(curve.n, 64);
    /// ```
    pub fn from_order(order: u32) -> Self {
        let n = 1u32 << order;
        Self::new(n)
    }

    /// Convert distance to (x, y) coordinates.
    ///
    /// # Examples
    ///
    /// ```
    /// let curve = HilbertCurve::new(8);
    /// assert_eq!(curve.d2xy(7), (2, 1));
    /// ```
    #[inline]
    pub fn d2xy(&self, d: u64) -> (u32, u32) {
        d2xy(self.n, d)
    }

    /// Convert (x, y) coordinates to distance.
    ///
    /// # Examples
    ///
    /// ```
    /// let curve = HilbertCurve::new(8);
    /// assert_eq!(curve.xy2d(2, 1), 7);
    /// ```
    #[inline]
    pub fn xy2d(&self, x: u32, y: u32) -> u64 {
        xy2d(self.n, x, y)
    }

    /// Generate a lookup table for all coordinates.
    ///
    /// Returns a Vec where index d contains (x, y) coordinates.
    /// Useful for batch conversions or GPU uploads.
    ///
    /// # Examples
    ///
    /// ```
    /// let curve = HilbertCurve::new(4);
    /// let lut = curve.generate_lut();
    /// assert_eq!(lut[0], (0, 0));
    /// assert_eq!(lut[1], (1, 0));
    /// ```
    pub fn generate_lut(&self) -> Vec<(u32, u32)> {
        let total = (self.n * self.n) as usize;
        let mut lut = Vec::with_capacity(total);

        for d in 0..total {
            lut.push(self.d2xy(d as u64));
        }

        lut
    }

    /// Generate a flat LUT for GPU upload.
    ///
    /// Returns a Vec<u32> where each pair of u32 values represents (x, y).
    /// Suitable for direct upload to GPU via WGPU.
    pub fn generate_gpu_lut(&self) -> Vec<u32> {
        let total = (self.n * self.n) as usize;
        let mut lut = Vec::with_capacity(total * 2);

        for d in 0..total {
            let (x, y) = self.d2xy(d as u64);
            lut.push(x);
            lut.push(y);
        }

        lut
    }
}

/// Validate grid size is power of 2.
///
/// # Examples
///
/// ```
/// assert!(validate_grid_size(64));
/// assert!(!validate_grid_size(100));
/// ```
#[inline]
pub fn validate_grid_size(n: u32) -> bool {
    n.is_power_of_two()
}

/// Calculate the order (log2) of a grid size.
///
/// # Panics
///
/// Panics if n is not a power of 2.
///
/// # Examples
///
/// ```
/// assert_eq!(grid_order(64), 6);
/// assert_eq!(grid_order(256), 8);
/// ```
#[inline]
pub fn grid_order(n: u32) -> u32 {
    assert!(n.is_power_of_two(), "Grid size must be power of 2");
    n.trailing_zeros()
}

/// Calculate maximum data capacity for a grid.
///
/// Returns the number of bytes that can be stored when using
/// 4 bytes per pixel (RGBA encoding).
///
/// # Examples
///
/// ```
/// assert_eq!(grid_capacity(64), 16384);  // 64*64*4
/// assert_eq!(grid_capacity(256), 262144); // 256*256*4
/// ```
#[inline]
pub fn grid_capacity(n: u32) -> usize {
    (n * n * 4) as usize
}

#[cfg(test)]
mod tests {
    use super::*;

    // Test vectors from HilbertEngine.py (reference implementation)
    const TEST_VECTORS: &[(u32, u64, (u32, u32))] = &[
        (4, 0, (0, 0)),
        (4, 1, (1, 0)),
        (4, 2, (1, 1)),
        (4, 3, (0, 1)),
        (8, 0, (0, 0)),
        (8, 7, (2, 1)),
    ];

    #[test]
    fn test_d2xy_test_vectors() {
        for &(n, d, expected) in TEST_VECTORS {
            assert_eq!(d2xy(n, d), expected, "d2xy({}, {}) failed", n, d);
        }
    }

    #[test]
    fn test_xy2d_test_vectors() {
        for &(n, d, (x, y)) in TEST_VECTORS {
            assert_eq!(xy2d(n, x, y), d, "xy2d({}, {}, {}) failed", n, x, y);
        }
    }

    #[test]
    fn test_round_trip() {
        for n in [4, 8, 16, 32, 64, 128] {
            for d in 0..(n * n) {
                let (x, y) = d2xy(n, d as u64);
                let d2 = xy2d(n, x, y);
                assert_eq!(d2, d as u64, "Round trip failed for n={}, d={}", n, d);
            }
        }
    }

    #[test]
    fn test_hilbert_curve_struct() {
        let curve = HilbertCurve::new(8);
        assert_eq!(curve.n, 8);
        assert_eq!(curve.order, 3);
        assert_eq!(curve.total_pixels, 64);

        assert_eq!(curve.d2xy(7), (2, 1));
        assert_eq!(curve.xy2d(2, 1), 7);
    }

    #[test]
    fn test_from_order() {
        assert_eq!(HilbertCurve::from_order(6).n, 64);
        assert_eq!(HilbertCurve::from_order(8).n, 256);
    }

    #[test]
    fn test_generate_lut() {
        let curve = HilbertCurve::new(4);
        let lut = curve.generate_lut();

        assert_eq!(lut.len(), 16);
        assert_eq!(lut[0], (0, 0));
        assert_eq!(lut[1], (1, 0));
        assert_eq!(lut[2], (1, 1));
        assert_eq!(lut[3], (0, 1));
    }

    #[test]
    fn test_validate_grid_size() {
        assert!(validate_grid_size(4));
        assert!(validate_grid_size(64));
        assert!(validate_grid_size(1024));
        assert!(!validate_grid_size(100));
        assert!(!validate_grid_size(0));
    }

    #[test]
    fn test_grid_order() {
        assert_eq!(grid_order(4), 2);
        assert_eq!(grid_order(64), 6);
        assert_eq!(grid_order(256), 8);
    }

    #[test]
    fn test_grid_capacity() {
        assert_eq!(grid_capacity(64), 16384);
        assert_eq!(grid_capacity(256), 262144);
    }

    #[test]
    fn test_continuity() {
        // Verify that consecutive indices are spatially adjacent
        for n in [4, 8, 16, 32, 64, 128] {
            for d in 0..(n * n - 1) {
                let (x1, y1) = d2xy(n, d as u64);
                let (x2, y2) = d2xy(n, (d + 1) as u64);

                // Manhattan distance should be 1 for adjacent points
                let dist = (x1 as i32 - x2 as i32).abs() + (y1 as i32 - y2 as i32).abs();
                assert_eq!(dist, 1, "Non-adjacent points at n={}, d={}", n, d);
            }
        }
    }
}
