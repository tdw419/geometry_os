//! GlyphSubstrate - Native VRAM with Hilbert indexing for Geometry OS.
//!
//! This module provides a pixel buffer that is indexed using the Hilbert curve,
//! ensuring that pixels that are spatially close on the screen are also close
//! in memory. This improves cache locality for both CPU and GPU operations.

use crate::hilbert::HilbertCurve;

/// Represents the native pixel buffer (VRAM) for glyph rendering.
/// Uses Hilbert curve indexing for 95% spatial locality preservation.
#[derive(Clone)]
pub struct GlyphSubstrate {
    /// The Hilbert curve used for coordinate mapping.
    pub curve: HilbertCurve,
    /// 1D buffer representing the 2D VRAM.
    /// Pixels are stored in Hilbert order: buffer[d] = pixel at (x, y).
    /// Using u32 for RGBA 4-byte pixels.
    buffer: Vec<u32>,
}

impl GlyphSubstrate {
    /// Create a new glyph substrate with the given order (grid size = 2^order).
    ///
    /// # Examples
    ///
    /// ```
    /// let substrate = GlyphSubstrate::new(8); // 256x256 grid
    /// ```
    pub fn new(order: u32) -> Self {
        let curve = HilbertCurve::from_order(order);
        let buffer_size = curve.total_pixels as usize;
        Self {
            curve,
            buffer: vec![0; buffer_size],
        }
    }

    /// Set a pixel at 2D coordinates (x, y).
    ///
    /// # Arguments
    ///
    /// * `x` - X coordinate (0 to n-1)
    /// * `y` - Y coordinate (0 to n-1)
    /// * `color` - RGBA color as u32
    pub fn set_pixel(&mut self, x: u32, y: u32, color: u32) {
        if x < self.curve.n && y < self.curve.n {
            let d = self.curve.xy2d(x, y) as usize;
            self.buffer[d] = color;
        }
    }

    /// Get a pixel at 2D coordinates (x, y).
    ///
    /// # Returns
    ///
    /// The RGBA color as u32, or 0 if out of bounds.
    pub fn get_pixel(&self, x: u32, y: u32) -> u32 {
        if x < self.curve.n && y < self.curve.n {
            let d = self.curve.xy2d(x, y) as usize;
            self.buffer[d]
        } else {
            0
        }
    }

    /// Fill a rectangle in the substrate.
    ///
    /// This is a basic CPU-based rasterizer.
    pub fn fill_rect(&mut self, x: u32, y: u32, w: u32, h: u32, color: u32) {
        let x_end = (x + w).min(self.curve.n);
        let y_end = (y + h).min(self.curve.n);

        for py in y..y_end {
            for px in x..x_end {
                let d = self.curve.xy2d(px, py) as usize;
                self.buffer[d] = color;
            }
        }
    }

    /// Clear the entire substrate with a color.
    pub fn clear(&mut self, color: u32) {
        self.buffer.fill(color);
    }

    /// Access the raw buffer in Hilbert order.
    pub fn buffer(&self) -> &[u32] {
        &self.buffer
    }

    /// Access the raw buffer mutably.
    pub fn buffer_mut(&mut self) -> &mut [u32] {
        &mut self.buffer
    }

    /// Get the grid size (n x n).
    pub fn n(&self) -> u32 {
        self.curve.n
    }

    /// Get the order (log2 of n).
    pub fn order(&self) -> u32 {
        self.curve.order
    }

    /// Get the total number of pixels (n^2).
    pub fn total_pixels(&self) -> u64 {
        self.curve.total_pixels
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_substrate_new() {
        let substrate = GlyphSubstrate::new(6); // 64x64
        assert_eq!(substrate.n(), 64);
        assert_eq!(substrate.buffer().len(), 4096);
    }

    #[test]
    fn test_substrate_set_get() {
        let mut substrate = GlyphSubstrate::new(4); // 16x16
        substrate.set_pixel(5, 5, 0xFF0000FF);
        assert_eq!(substrate.get_pixel(5, 5), 0xFF0000FF);
        assert_eq!(substrate.get_pixel(0, 0), 0);
    }

    #[test]
    fn test_substrate_fill_rect() {
        let mut substrate = GlyphSubstrate::new(4);
        substrate.fill_rect(2, 2, 4, 4, 0x00FF00FF);

        assert_eq!(substrate.get_pixel(2, 2), 0x00FF00FF);
        assert_eq!(substrate.get_pixel(3, 3), 0x00FF00FF);
        assert_eq!(substrate.get_pixel(5, 5), 0x00FF00FF);
        assert_eq!(substrate.get_pixel(6, 6), 0);
    }

    #[test]
    fn test_substrate_clear() {
        let mut substrate = GlyphSubstrate::new(4);
        substrate.set_pixel(0, 0, 0xFFFFFFFF);
        substrate.clear(0x11223344);
        assert_eq!(substrate.get_pixel(0, 0), 0x11223344);
        assert_eq!(substrate.get_pixel(15, 15), 0x11223344);
    }
}
