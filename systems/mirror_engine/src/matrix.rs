//! Pixel State Matrix — The AI IS the territory
//!
//! Level 2 Direct State Logic: pixel values ARE the state.
//! The AI writes 32-bit hex codes directly, no translation layer.

use crate::{Coord, PixelValue, QuadCoord, consts};
use std::collections::HashSet;

/// Pixel State Matrix — direct state access via pixel values
pub struct PixelStateMatrix {
    buffer: Vec<u32>,
    width: u32,
    height: u32,
    stride: u32,
    base_addr: u64,
    active_quads: HashSet<QuadCoord>,
    z_buffer: Vec<f32>,
    frame: u32,
}

impl PixelStateMatrix {
    pub fn new(width: u32, height: u32) -> Self {
        let size = (width * height) as usize;
        Self {
            buffer: vec![0; size],
            width,
            height,
            stride: width * consts::PIXEL_DEPTH,
            base_addr: 0,
            active_quads: HashSet::new(),
            z_buffer: vec![0.0; size],
            frame: 0,
        }
    }

    pub fn new_4k() -> Self {
        Self::new(consts::GRID_WIDTH, consts::GRID_HEIGHT)
    }

    /// Read pixel value at coordinate (Direct State Read)
    pub fn read(&self, coord: Coord) -> Option<PixelValue> {
        if coord.x >= self.width || coord.y >= self.height {
            return None;
        }
        Some(PixelValue(self.buffer[(coord.y * self.width + coord.x) as usize]))
    }

    /// Write pixel value at coordinate (Direct State Write)
    pub fn write(&mut self, coord: Coord, value: PixelValue) {
        if coord.x >= self.width || coord.y >= self.height {
            return;
        }
        let idx = (coord.y * self.width + coord.x) as usize;
        self.buffer[idx] = value.raw();
        self.active_quads.insert(coord.quad_index(consts::QUAD_SIZE));
    }

    /// Memory address: Addr = Base + (y * Stride + x) * Depth
    pub fn address_of(&self, coord: Coord) -> u64 {
        coord.to_address(self.base_addr, self.stride, consts::PIXEL_DEPTH)
    }

    /// Block Memory Transfer (MEMCPY) — Move a window/region
    pub fn memcpy_block(&mut self, src: Coord, dst: Coord, w: u32, h: u32) {
        if src.x + w > self.width || src.y + h > self.height
            || dst.x + w > self.width || dst.y + h > self.height
        {
            return;
        }

        let (y_start, y_end, y_step) = if src.y < dst.y {
            (h as i32 - 1, -1, -1)
        } else {
            (0, h as i32, 1)
        };

        let mut y = y_start;
        while y != y_end {
            let row_src = ((src.y as i32 + y) as u32 * self.width + src.x) as usize;
            let row_dst = ((dst.y as i32 + y) as u32 * self.width + dst.x) as usize;
            self.buffer.copy_within(row_src..row_src + w as usize, row_dst);
            self.z_buffer.copy_within(row_src..row_src + w as usize, row_dst);
            y += y_step;
        }

        for dy in 0..h {
            for dx in 0..w {
                self.active_quads.insert(Coord::new(src.x + dx, src.y + dy).quad_index(consts::QUAD_SIZE));
                self.active_quads.insert(Coord::new(dst.x + dx, dst.y + dy).quad_index(consts::QUAD_SIZE));
            }
        }
    }

    /// Fill a rectangular region
    pub fn fill_rect(&mut self, origin: Coord, w: u32, h: u32, value: PixelValue) {
        for dy in 0..h {
            for dx in 0..w {
                self.write(Coord::new(origin.x + dx, origin.y + dy), value);
            }
        }
    }

    /// Z-buffer write (software-defined hidden surface removal)
    pub fn write_with_z(&mut self, coord: Coord, value: PixelValue, z: f32) -> bool {
        if coord.x >= self.width || coord.y >= self.height {
            return false;
        }
        let idx = (coord.y * self.width + coord.x) as usize;
        if z < self.z_buffer[idx] {
            self.buffer[idx] = value.raw();
            self.z_buffer[idx] = z;
            self.active_quads.insert(coord.quad_index(consts::QUAD_SIZE));
            true
        } else {
            false
        }
    }

    /// Alpha blending (software-defined transparency)
    pub fn blend(&mut self, coord: Coord, value: PixelValue) {
        if coord.x >= self.width || coord.y >= self.height {
            return;
        }
        let existing = self.read(coord).unwrap_or(PixelValue::TRANSPARENT);
        let (r1, g1, b1, _) = existing.to_rgba();
        let (r2, g2, b2, a2) = value.to_rgba();
        let alpha = a2 as f32 / 255.0;
        let inv = 1.0 - alpha;
        self.write(coord, PixelValue::from_rgba(
            (r1 as f32 * inv + r2 as f32 * alpha) as u8,
            (g1 as f32 * inv + g2 as f32 * alpha) as u8,
            (b1 as f32 * inv + b2 as f32 * alpha) as u8,
            255,
        ));
    }

    pub fn active_quads(&self) -> &HashSet<QuadCoord> { &self.active_quads }
    pub fn flush_active_quads(&mut self) { self.active_quads.clear(); self.frame += 1; }
    pub fn frame(&self) -> u32 { self.frame }
    pub fn as_ptr(&self) -> *const u32 { self.buffer.as_ptr() }
    pub fn size_bytes(&self) -> usize { self.buffer.len() * 4 }
}

impl Default for PixelStateMatrix {
    fn default() -> Self { Self::new_4k() }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn read_write() {
        let mut m = PixelStateMatrix::new(100, 100);
        m.write(Coord::new(10, 20), PixelValue::RED);
        assert_eq!(m.read(Coord::new(10, 20)), Some(PixelValue::RED));
    }

    #[test]
    fn memcpy() {
        let mut m = PixelStateMatrix::new(100, 100);
        m.fill_rect(Coord::new(10, 10), 10, 10, PixelValue::RED);
        m.memcpy_block(Coord::new(10, 10), Coord::new(50, 50), 10, 10);
        assert_eq!(m.read(Coord::new(50, 50)), Some(PixelValue::RED));
    }

    #[test]
    fn z_buffer() {
        let mut m = PixelStateMatrix::new(100, 100);
        let c = Coord::new(10, 10);
        assert!(m.write_with_z(c, PixelValue::BLUE, 0.5));
        assert!(m.write_with_z(c, PixelValue::RED, 0.3));
        assert!(!m.write_with_z(c, PixelValue::GREEN, 0.7));
        assert_eq!(m.read(c), Some(PixelValue::RED));
    }
}
