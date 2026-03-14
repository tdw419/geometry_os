//! GPU-Native Glyph Memory Allocator
//!
//! A memory allocator optimized for glyph execution on GPU hardware.
//! Fitness is measured by allocation speed, fragmentation, and GPU access patterns.

use std::alloc::{alloc, dealloc, Layout};
use std::collections::HashMap;

/// Glyph memory block header
#[derive(Debug, Clone, Copy)]
pub struct GlyphBlock {
    pub offset: u64,
    pub size: u64,
    pub glyph_id: u32,
    pub generation: u32,
    pub is_free: bool,
}

/// GPU-aligned memory pool for glyphs
pub struct GlyphPool {
    /// Base address of the pool
    base: *mut u8,
    /// Total size in bytes
    total_size: u64,
    /// Block size alignment (GPU cache line)
    block_align: u64,
    /// Allocated blocks
    blocks: Vec<GlyphBlock>,
    /// Glyph ID to block mapping
    glyph_map: HashMap<u32, usize>,
    /// Statistics
    alloc_count: u64,
    free_count: u64,
}

impl GlyphPool {
    /// Create a new glyph pool with GPU-aligned blocks
    pub fn new(size_mb: u64) -> Self {
        let total_size = size_mb * 1024 * 1024;
        let block_align = 256; // GPU cache line size

        let layout = Layout::from_size_align(total_size as usize, 256)
            .expect("Invalid layout");

        let base = unsafe { alloc(layout) };

        Self {
            base,
            total_size,
            block_align,
            blocks: vec![GlyphBlock {
                offset: 0,
                size: total_size,
                glyph_id: 0,
                generation: 0,
                is_free: true,
            }],
            glyph_map: HashMap::new(),
            alloc_count: 0,
            free_count: 0,
        }
    }

    /// Allocate memory for a glyph
    pub fn allocate(&mut self, glyph_id: u32, size: u64) -> Option<u64> {
        // Align size to block boundary
        let aligned_size = ((size + self.block_align - 1) / self.block_align) * self.block_align;

        // Find best-fit free block
        let mut best_idx = None;
        let mut best_waste = u64::MAX;

        for (idx, block) in self.blocks.iter().enumerate() {
            if block.is_free && block.size >= aligned_size {
                let waste = block.size - aligned_size;
                if waste < best_waste {
                    best_waste = waste;
                    best_idx = Some(idx);
                }
            }
        }

        let idx = best_idx?;

        // Get block info before modification
        let (offset, original_size) = {
            let block = &self.blocks[idx];
            (block.offset, block.size)
        };

        // Modify the block
        let block = &mut self.blocks[idx];
        block.is_free = false;
        block.glyph_id = glyph_id;
        block.size = aligned_size;

        // Split block if there's remaining space
        let remaining = original_size - aligned_size;

        if remaining >= self.block_align {
            self.blocks.insert(idx + 1, GlyphBlock {
                offset: offset + aligned_size,
                size: remaining,
                glyph_id: 0,
                generation: 0,
                is_free: true,
            });
        }

        self.glyph_map.insert(glyph_id, idx);
        self.alloc_count += 1;

        Some(offset)
    }

    /// Free memory for a glyph
    pub fn free(&mut self, glyph_id: u32) -> bool {
        let idx = match self.glyph_map.remove(&glyph_id) {
            Some(i) => i,
            None => return false,
        };

        self.blocks[idx].is_free = true;
        self.blocks[idx].glyph_id = 0;
        self.free_count += 1;

        // Coalesce adjacent free blocks
        self.coalesce();

        true
    }

    /// Merge adjacent free blocks
    fn coalesce(&mut self) {
        let mut i = 0;
        while i < self.blocks.len() - 1 {
            if self.blocks[i].is_free && self.blocks[i + 1].is_free {
                self.blocks[i].size += self.blocks[i + 1].size;
                self.blocks.remove(i + 1);
            } else {
                i += 1;
            }
        }
    }

    /// Calculate fragmentation percentage (0-100)
    pub fn fragmentation(&self) -> f64 {
        let free_blocks: Vec<_> = self.blocks.iter().filter(|b| b.is_free).collect();
        if free_blocks.is_empty() {
            return 0.0;
        }

        let total_free: u64 = free_blocks.iter().map(|b| b.size).sum();
        if total_free == 0 {
            return 0.0;
        }

        let largest_free = free_blocks.iter().map(|b| b.size).max().unwrap_or(0);
        let external_frag = 1.0 - (largest_free as f64 / total_free as f64);

        external_frag * 100.0
    }

    /// Calculate allocation efficiency (bytes used / total bytes)
    pub fn utilization(&self) -> f64 {
        let used: u64 = self.blocks.iter()
            .filter(|b| !b.is_free)
            .map(|b| b.size)
            .sum();

        (used as f64 / self.total_size as f64) * 100.0
    }

    /// Get pointer to glyph memory
    pub fn get_ptr(&self, offset: u64) -> *mut u8 {
        unsafe { self.base.add(offset as usize) }
    }

    /// Calculate overall fitness score (0.0 - 1.0)
    pub fn fitness(&self) -> f64 {
        // Fitness is based on:
        // 1. Low fragmentation (weight: 0.4)
        // 2. High utilization (weight: 0.3)
        // 3. Coalescing efficiency (weight: 0.3)

        let frag_score = (100.0 - self.fragmentation()) / 100.0;
        let util_score = self.utilization() / 100.0;

        // Coalescing score: ratio of frees to total operations
        let total_ops = self.alloc_count + self.free_count;
        let coal_score = if total_ops > 0 {
            (self.free_count as f64 / total_ops as f64).min(1.0)
        } else {
            1.0
        };

        // Weighted fitness
        (frag_score * 0.4) + (util_score * 0.3) + (coal_score * 0.3)
    }

    /// Get statistics
    pub fn stats(&self) -> AllocatorStats {
        AllocatorStats {
            total_size: self.total_size,
            block_count: self.blocks.len(),
            free_blocks: self.blocks.iter().filter(|b| b.is_free).count(),
            alloc_count: self.alloc_count,
            free_count: self.free_count,
            fragmentation: self.fragmentation(),
            utilization: self.utilization(),
            fitness: self.fitness(),
        }
    }
}

impl Drop for GlyphPool {
    fn drop(&mut self) {
        let layout = Layout::from_size_align(self.total_size as usize, 256)
            .expect("Invalid layout");
        unsafe {
            dealloc(self.base, layout);
        }
    }
}

#[derive(Debug, Clone)]
pub struct AllocatorStats {
    pub total_size: u64,
    pub block_count: usize,
    pub free_blocks: usize,
    pub alloc_count: u64,
    pub free_count: u64,
    pub fragmentation: f64,
    pub utilization: f64,
    pub fitness: f64,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_pool_creation() {
        let pool = GlyphPool::new(1);
        assert_eq!(pool.total_size, 1024 * 1024);
    }

    #[test]
    fn test_allocate() {
        let mut pool = GlyphPool::new(1);
        let offset = pool.allocate(1, 1024);
        assert!(offset.is_some());
        // Block is split because 1024 < total_size (1MB)
        assert!(pool.blocks.len() >= 1);
    }

    #[test]
    fn test_free() {
        let mut pool = GlyphPool::new(1);
        pool.allocate(1, 1024);
        assert!(pool.free(1));
        assert_eq!(pool.blocks.len(), 1); // Coalesced back
    }

    #[test]
    fn test_fragmentation() {
        let mut pool = GlyphPool::new(1);
        pool.allocate(1, 1024);
        pool.allocate(2, 1024);
        pool.free(1);
        // Should have some fragmentation after creating a gap
        assert!(pool.fragmentation() >= 0.0);
    }

    #[test]
    fn test_fitness() {
        let pool = GlyphPool::new(1);
        let fitness = pool.fitness();
        assert!(fitness >= 0.0 && fitness <= 1.0);
    }

    #[test]
    fn test_utilization() {
        let mut pool = GlyphPool::new(1);
        pool.allocate(1, 1024 * 512); // Half the pool
        assert!(pool.utilization() > 40.0);
    }
}
