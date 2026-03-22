//! Mirror Engine — AI-Native Framebuffer Mapping for Geometry OS
//!
//! Level 2: Direct State Logic via Pixel-Value Mapping
//!
//! This module implements the paradigm shift from symbolic abstraction (ASCII)
//! to state-direct reality where pixel values ARE the state. The AI writes
//! 32-bit hex codes (0xFF0000 = Red) directly to a mapped buffer.
//!
//! Key concepts:
//! - Pixel-Value Mapping: 32-bit hex addressing of VRAM
//! - Direct DMA Sync: GPU-local pointer updates (no CPU round-trip)
//! - Spatial Tiling: "Active Quads" for efficient updates
//! - Unified Memory: Thinking and Displaying in same space
//! - Zero-Latency Feedback: State changes trigger immediate logic
//!
//! Hardware target: NVIDIA Blackwell RTX 5090 with:
//! - 32GB GDDR7 (1,792 GB/sec bandwidth)
//! - AI Management Processor (AMP)
//! - Tensor Memory (TMEM)

pub mod matrix;
pub mod quad;
pub mod dma;
pub mod state;

pub use matrix::PixelStateMatrix;
pub use quad::ActiveQuad;
pub use dma::DmaSync;
pub use state::DirectState;

/// Memory addressing constants
pub mod consts {
    /// Default grid width (4K)
    pub const GRID_WIDTH: u32 = 4096;
    /// Default grid height (4K)
    pub const GRID_HEIGHT: u32 = 4096;
    /// Pixel depth in bytes (RGBA8 = 4 bytes)
    pub const PIXEL_DEPTH: u32 = 4;
    /// Active Quad size (1° geometric block)
    pub const QUAD_SIZE: u32 = 64;
    /// Maximum number of active quads tracked
    pub const MAX_ACTIVE_QUADS: usize = 256;
}

/// Coordinate in the pixel state matrix
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq, Hash)]
pub struct Coord {
    pub x: u32,
    pub y: u32,
}

impl Coord {
    pub fn new(x: u32, y: u32) -> Self {
        Self { x, y }
    }

    /// Convert to linear memory address
    /// Formula: Addr = Base + (y * Stride + x) * Depth
    pub fn to_address(&self, base: u64, stride: u32, depth: u32) -> u64 {
        base + (self.y as u64 * stride as u64 + self.x as u64) * depth as u64
    }

    /// Which quad does this coordinate belong to?
    pub fn quad_index(&self, quad_size: u32) -> QuadCoord {
        QuadCoord {
            qx: self.x / quad_size,
            qy: self.y / quad_size,
        }
    }
}

/// Quad coordinate (which 64x64 block)
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq, Hash)]
pub struct QuadCoord {
    pub qx: u32,
    pub qy: u32,
}

impl QuadCoord {
    pub fn new(qx: u32, qy: u32) -> Self {
        Self { qx, qy }
    }

    /// Top-left pixel coordinate of this quad
    pub fn to_coord(&self, quad_size: u32) -> Coord {
        Coord::new(self.qx * quad_size, self.qy * quad_size)
    }

    /// Linear quad index for array storage
    pub fn to_linear(&self, quads_per_row: u32) -> usize {
        (self.qy * quads_per_row + self.qx) as usize
    }
}

/// 32-bit pixel value (RGBA8)
///
/// Direct state encoding where color IS meaning:
/// - 0xFF0000 = Red = "active intent"
/// - 0x00FF00 = Green = "confirmed state"
/// - 0x0000FF = Blue = "processing"
/// - 0xFF5500 = Burnt Orange = "boundary"
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct PixelValue(pub u32);

impl PixelValue {
    /// Transparent (no state)
    pub const TRANSPARENT: Self = Self(0x00000000);
    /// Red - active intent
    pub const RED: Self = Self(0x00FF0000); // ARGB: A=0, R=255
    /// Green - confirmed state
    pub const GREEN: Self = Self(0x0000FF00);
    /// Blue - processing
    pub const BLUE: Self = Self(0x000000FF);
    /// White - neutral/empty
    pub const WHITE: Self = Self(0x00FFFFFF);
    /// Black - void/uninitialized
    pub const BLACK: Self = Self(0x00000000);

    /// Create from RGBA components
    pub fn from_rgba(r: u8, g: u8, b: u8, a: u8) -> Self {
        Self((a as u32) << 24 | (r as u32) << 16 | (g as u32) << 8 | (b as u32))
    }

    /// Create from hex string (e.g., "FF0000" or "0xFF0000")
    pub fn from_hex(s: &str) -> Option<Self> {
        let s = s.trim_start_matches("0x").trim_start_matches("0X");
        u32::from_str_radix(s, 16).ok().map(Self)
    }

    /// Get RGBA components
    pub fn to_rgba(&self) -> (u8, u8, u8, u8) {
        (
            ((self.0 >> 16) & 0xFF) as u8,
            ((self.0 >> 8) & 0xFF) as u8,
            (self.0 & 0xFF) as u8,
            ((self.0 >> 24) & 0xFF) as u8,
        )
    }

    /// Raw 32-bit value for GPU
    pub fn raw(&self) -> u32 {
        self.0
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_coord_to_address() {
        let coord = Coord::new(100, 200);
        let addr = coord.to_address(0x1000, 4096, 4);
        // (200 * 4096 + 100) * 4 = 3276900 + 400 = 3277300
        assert_eq!(addr, 0x1000 + (200 * 4096 + 100) as u64 * 4);
    }

    #[test]
    fn test_quad_coord() {
        let coord = Coord::new(150, 200);
        let quad = coord.quad_index(64);
        assert_eq!(quad.qx, 2); // 150 / 64 = 2
        assert_eq!(quad.qy, 3); // 200 / 64 = 3
    }

    #[test]
    fn test_pixel_value_from_hex() {
        let red = PixelValue::from_hex("FF0000").unwrap();
        assert_eq!(red.to_rgba().0, 255); // R
        assert_eq!(red.to_rgba().1, 0);   // G
        assert_eq!(red.to_rgba().2, 0);   // B

        let with_prefix = PixelValue::from_hex("0x00FF00").unwrap();
        assert_eq!(with_prefix.to_rgba().1, 255); // G
    }
}
