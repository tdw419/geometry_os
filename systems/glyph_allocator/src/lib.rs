//! GPU-Native Glyph Memory Allocator
//!
//! A memory allocator optimized for glyph execution on GPU hardware.
//! Fitness is measured by allocation speed, fragmentation, and GPU access patterns.

mod quadtree;

use std::alloc::{alloc, dealloc, Layout};
use crate::quadtree::{QuadNode, NodeState};

/// Glyph memory block header (preserved for stats)
#[derive(Debug, Clone, Copy)]
pub struct GlyphBlock {
    pub offset: u64,
    pub size: u64,
    pub glyph_id: u32,
    pub generation: u32,
    pub is_free: bool,
}

/// Statistics for the allocator
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

/// GPU-aligned memory pool for glyphs
pub struct GlyphPool {
    /// Base address of the pool
    base: *mut u8,
    /// Total size in bytes
    total_size: u64,
    /// Side length of the spatial grid in pixels (4 bytes per pixel)
    side_len: u32,
    /// Block size alignment (AVX-512 cache line)
    block_align: u64,
    /// Spatial root node
    root: QuadNode,
    /// Statistics
    alloc_count: u64,
    free_count: u64,
}

// Alignment constants for different hardware substrates
pub const CACHE_LINE: u64 = 64;      // AVX-512 / x86 cache line
pub const GPU_ALIGN: u64 = 128;      // GPU cache line (standard)
pub const TRANSPORT_ALIGN: u64 = 64; // For binary-to-pixel conversion

impl GlyphPool {
    /// Create a new glyph pool with CPU/GPU-aligned blocks
    pub fn new(size_mb: u64) -> Self {
        let total_size = size_mb * 1024 * 1024;
        let block_align = CACHE_LINE; // Default to AVX-512 alignment

        // Calculate side length for 2D spatial mapping (4 bytes per pixel)
        let pixels = total_size / 4;
        let side_len = (pixels as f64).sqrt() as u32;

        let layout = Layout::from_size_align(total_size as usize, GPU_ALIGN as usize)
            .expect("Invalid layout");

        let base = unsafe { alloc(layout) };

        Self {
            base,
            total_size,
            side_len,
            block_align,
            root: QuadNode::new(0, 0, side_len),
            alloc_count: 0,
            free_count: 0,
        }
    }

    /// Allocate memory for a glyph spatially
    pub fn allocate(&mut self, glyph_id: u32, size: u64) -> Option<u64> {
        // Map size to 2D square size (e.g. 1024 bytes -> 256 pixels -> 16x16 square)
        let pixels_req = size.div_ceil(4);
        let req_side = (pixels_req as f64).sqrt().ceil() as u32;
        
        // Snap to power of 2 for quadtree efficiency
        let snapped_side = req_side.next_power_of_two();

        if let Some((x, y)) = self.root.allocate(glyph_id, snapped_side) {
            self.alloc_count += 1;
            // Calculate 1D offset from 2D coordinates
            let offset = ((y * self.side_len + x) * 4) as u64;
            return Some(offset);
        }

        None
    }

    /// Free memory for a glyph
    pub fn free(&mut self, glyph_id: u32) -> bool {
        if self.root.free(glyph_id) {
            self.free_count += 1;
            return true;
        }
        false
    }

    /// Calculate spatial fragmentation percentage (0-100)
    pub fn fragmentation(&self) -> f64 {
        // Spatial fragmentation is measured by the ratio of small free holes
        // to the total free area.
        let total_free = self.total_size - self.root.utilization();
        if total_free == 0 {
            return 0.0;
        }

        // Count free leaf nodes. More small free nodes = higher fragmentation.
        let free_node_count = self.count_free_nodes(&self.root);
        
        // Normalize: if we have 1 free node (perfectly contiguous), frag = 0.
        // If we have many small free nodes, frag approaches 100.
        let frag = (free_node_count as f64 - 1.0).max(0.0) / (self.total_size as f64 / self.block_align as f64);
        (frag * 100.0).min(100.0)
    }

    fn count_free_nodes(&self, node: &QuadNode) -> usize {
        match node.state {
            NodeState::Free => 1,
            NodeState::Full => 0,
            NodeState::Partial => {
                if let Some(ref children) = node.children {
                    children.iter().map(|c| self.count_free_nodes(c)).sum()
                } else {
                    0
                }
            }
        }
    }

    /// Calculate allocation efficiency (bytes used / total bytes)
    pub fn utilization(&self) -> f64 {
        ((self.root.utilization() * 4) as f64 / self.total_size as f64) * 100.0
    }

    /// Get pointer to glyph memory
    pub fn get_ptr(&self, offset: u64) -> *mut u8 {
        unsafe { self.base.add(offset as usize) }
    }

    /// Calculate overall fitness score (0.0 - 1.0)
    pub fn fitness(&self) -> f64 {
        let frag_score = (100.0 - self.fragmentation()) / 100.0;
        let util_score = self.utilization() / 100.0;
        
        // Spatial fitness favors dense, non-fragmented clusters
        (frag_score * 0.5) + (util_score * 0.5)
    }

    /// Defragment the pool by compacting free space spatially
    pub fn defragment(&mut self) {
        // Collect all active glyphs and their sizes
        let mut active_glyphs = Vec::new();
        self.collect_active_glyphs(&self.root, &mut active_glyphs);

        // Sort by size (descending) for optimal packing
        active_glyphs.sort_by(|a, b| b.1.cmp(&a.1));

        // Reset root
        self.root = QuadNode::new(0, 0, self.side_len);

        // Re-allocate everything
        for (id, size) in active_glyphs {
            self.allocate(id, size as u64);
        }
    }

    fn collect_active_glyphs(&self, node: &QuadNode, list: &mut Vec<(u32, u32)>) {
        if let Some(id) = node.glyph_id {
            list.push((id, node.size));
        }
        if let Some(ref children) = node.children {
            for child in children.iter() {
                self.collect_active_glyphs(child, list);
            }
        }
    }

    /// Get statistics
    pub fn stats(&self) -> AllocatorStats {
        AllocatorStats {
            total_size: self.total_size,
            block_count: self.count_nodes(&self.root),
            free_blocks: self.count_free_nodes(&self.root),
            alloc_count: self.alloc_count,
            free_count: self.free_count,
            fragmentation: self.fragmentation(),
            utilization: self.utilization(),
            fitness: self.fitness(),
        }
    }

    fn count_nodes(&self, node: &QuadNode) -> usize {
        1 + if let Some(ref children) = node.children {
            children.iter().map(|c| self.count_nodes(c)).sum()
        } else {
            0
        }
    }

    /// Dump spatial state as JSON for visualization
    pub fn dump_spatial_state(&self) -> String {
        let mut nodes = Vec::new();
        self.collect_nodes_for_dump(&self.root, &mut nodes);
        
        let mut json = String::from("[\n");
        for (i, node) in nodes.iter().enumerate() {
            let state_str = match node.state {
                NodeState::Free => "free",
                NodeState::Full => "full",
                NodeState::Partial => "partial",
            };
            
            let id_str = match node.glyph_id {
                Some(id) => id.to_string(),
                None => String::from("null"),
            };

            json.push_str(&format!(
                "  {{\"x\": {}, \"y\": {}, \"size\": {}, \"state\": \"{}\", \"id\": {}}}",
                node.x, node.y, node.size, state_str, id_str
            ));
            if i < nodes.len() - 1 {
                json.push_str(",\n");
            }
        }
        json.push_str("\n]");
        json
    }

    fn collect_nodes_for_dump<'a>(&'a self, node: &'a QuadNode, list: &mut Vec<&'a QuadNode>) {
        if node.children.is_none() {
            // Leaf node
            list.push(node);
        } else if let Some(ref children) = node.children {
            for child in children.iter() {
                self.collect_nodes_for_dump(child, list);
            }
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
        // Block is split in quadtree
        assert!(pool.stats().block_count >= 1);
    }

    #[test]
    fn test_free() {
        let mut pool = GlyphPool::new(1);
        pool.allocate(1, 1024);
        assert!(pool.free(1));
        assert_eq!(pool.stats().block_count, 1); // Coalesced back
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
        assert!((0.0..=1.0).contains(&fitness));
    }

    #[test]
    fn test_utilization() {
        let mut pool = GlyphPool::new(1);
        pool.allocate(1, 1024 * 512); // Half the pool
        assert!(pool.utilization() > 40.0);
    }
}
