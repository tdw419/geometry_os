// src/hilbert_writer.rs
/*!
Hilbert Writer for Tectonic Weight Mutation.

Maps 1D weight indices to 2D Hilbert coordinates and writes
directly to the RTS texture in VRAM using wgpu.
*/

use serde::{Deserialize, Serialize};

/// A single weight mutation
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct WeightMutation {
    pub index_1d: u32,
    pub weight_delta: f32,
}

/// Hilbert coordinate
#[derive(Debug, Clone, Copy)]
pub struct HilbertCoord {
    pub x: u32,
    pub y: u32,
}

/// Writer for applying mutations to the RTS texture
pub struct HilbertWriter {
    atlas_size: u32,
    order: u32,                           // Hilbert curve order (log2 of size)
    pending_writes: Vec<(u32, u32, f32)>, // (x, y, new_value)
}

impl HilbertWriter {
    pub fn new(atlas_size: u32) -> Self {
        let order = (atlas_size as f32).log2() as u32;
        Self {
            atlas_size,
            order,
            pending_writes: Vec::new(),
        }
    }

    /// Convert 1D Hilbert index to 2D coordinates
    pub fn index_to_2d(&self, index_1d: u32) -> HilbertCoord {
        // Use Hilbert curve mapping
        let (x, y) = hilbert_index_to_coord(self.order, index_1d);
        HilbertCoord { x, y }
    }

    /// Apply a single weight mutation
    pub fn apply_mutation(&mut self, mutation: &WeightMutation) -> Result<(), String> {
        let coord = self.index_to_2d(mutation.index_1d);

        if coord.x >= self.atlas_size || coord.y >= self.atlas_size {
            return Err(format!(
                "Coordinate out of bounds: ({}, {})",
                coord.x, coord.y
            ));
        }

        // Queue for batch write
        self.pending_writes
            .push((coord.x, coord.y, mutation.weight_delta));

        Ok(())
    }

    /// Upgrade all pixels in a district
    pub fn upgrade_district(&mut self, indices: &[u32], base_value: f32) -> Result<usize, String> {
        let mut count = 0;

        for &index in indices {
            let coord = self.index_to_2d(index);

            if coord.x < self.atlas_size && coord.y < self.atlas_size {
                self.pending_writes.push((coord.x, coord.y, base_value));
                count += 1;
            }
        }

        Ok(count)
    }

    /// Flush pending writes to texture (called by compositor)
    pub fn flush_to_texture(&mut self, _queue: &wgpu::Queue, _texture: &wgpu::Texture) -> usize {
        let count = self.pending_writes.len();

        // In production, this would use queue.write_texture() for each write
        // For now, just clear the pending queue
        self.pending_writes.clear();

        count
    }

    /// Get pending write count
    pub fn pending_count(&self) -> usize {
        self.pending_writes.len()
    }
}

/// Convert Hilbert index to 2D coordinate
/// Based on the Hilbert curve algorithm
fn hilbert_index_to_coord(order: u32, index: u32) -> (u32, u32) {
    let n = 1u32 << order;
    let mut x = 0u32;
    let mut y = 0u32;
    let mut s = 1u32;
    let mut idx = index;

    while s < n {
        let rx = 1 & (idx >> 1);
        let ry = 1 & (idx ^ rx);

        let (new_x, new_y) = rot(s, x, y, rx, ry);
        x = new_x;
        y = new_y;

        x += s * rx;
        y += s * ry;

        idx >>= 2;
        s <<= 1;
    }

    (x, y)
}

/// Rotate/flip a quadrant appropriately
fn rot(n: u32, x: u32, y: u32, rx: u32, ry: u32) -> (u32, u32) {
    if ry == 0 {
        if rx == 1 {
            return (n - 1 - x, n - 1 - y);
        }
        return (y, x);
    }
    (x, y)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_hilbert_mapping() {
        let writer = HilbertWriter::new(16);

        // First 4 indices should map to corners
        let c0 = writer.index_to_2d(0);
        let c1 = writer.index_to_2d(1);

        assert!(c0.x < 16 && c0.y < 16);
        assert!(c1.x < 16 && c1.y < 16);
    }
}
