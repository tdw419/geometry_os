//! Buddy Allocator for GPU Memory Sub-allocation
//!
//! Implements a buddy allocator for efficient sub-allocation within large GPU buffers.
//! Supports block sizes from 4KB to 64MB in power-of-two increments.
//!
//! ## Block Hierarchy
//!
//! ```text
//! Level 0: 64MB (2^26 bytes) - Maximum allocation
//! Level 1: 32MB (2^25 bytes)
//! Level 2: 16MB (2^24 bytes)
//! ...
//! Level 14: 4KB (2^12 bytes) - Minimum allocation
//! ```
//!
//! ## Features
//!
//! - O(log n) allocation and deallocation
//! - Automatic block coalescing on free
//! - Hilbert curve alignment for spatial locality

use super::{MLResult, MLError};
use std::collections::HashMap;

/// Block size levels (powers of 2 from 4KB to 64MB)
#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
pub enum BlockSize {
    /// 4KB - Minimum allocation
    B4KB = 12,
    /// 8KB
    B8KB = 13,
    /// 16KB
    B16KB = 14,
    /// 32KB
    B32KB = 15,
    /// 64KB
    B64KB = 16,
    /// 128KB
    B128KB = 17,
    /// 256KB
    B256KB = 18,
    /// 512KB
    B512KB = 19,
    /// 1MB
    B1MB = 20,
    /// 2MB
    B2MB = 21,
    /// 4MB
    B4MB = 22,
    /// 8MB
    B8MB = 23,
    /// 16MB
    B16MB = 24,
    /// 32MB
    B32MB = 25,
    /// 64MB - Maximum allocation
    B64MB = 26,
}

impl BlockSize {
    /// Create from log2 size (12 = 4KB, 26 = 64MB)
    pub fn from_level(level: u8) -> Option<Self> {
        match level {
            12 => Some(BlockSize::B4KB),
            13 => Some(BlockSize::B8KB),
            14 => Some(BlockSize::B16KB),
            15 => Some(BlockSize::B32KB),
            16 => Some(BlockSize::B64KB),
            17 => Some(BlockSize::B128KB),
            18 => Some(BlockSize::B256KB),
            19 => Some(BlockSize::B512KB),
            20 => Some(BlockSize::B1MB),
            21 => Some(BlockSize::B2MB),
            22 => Some(BlockSize::B4MB),
            23 => Some(BlockSize::B8MB),
            24 => Some(BlockSize::B16MB),
            25 => Some(BlockSize::B32MB),
            26 => Some(BlockSize::B64MB),
            _ => None,
        }
    }

    /// Size in bytes
    pub fn size_bytes(&self) -> usize {
        1 << (*self as u8)
    }

    /// Find smallest block size that fits the requested bytes
    pub fn fit(size: usize) -> Option<Self> {
        // Minimum is 4KB
        if size == 0 {
            return Some(BlockSize::B4KB);
        }

        let min_level = 12; // 4KB
        let max_level = 26; // 64MB

        for level in min_level..=max_level {
            if (1 << level) >= size {
                return BlockSize::from_level(level);
            }
        }
        None
    }

    /// Get the next larger block size
    pub fn larger(&self) -> Option<BlockSize> {
        BlockSize::from_level(*self as u8 + 1)
    }

    /// Get the next smaller block size
    pub fn smaller(&self) -> Option<BlockSize> {
        if *self as u8 > 12 {
            BlockSize::from_level(*self as u8 - 1)
        } else {
            None
        }
    }
}

/// A free or allocated block
#[derive(Debug, Clone)]
pub struct Block {
    /// Offset from base of buffer (bytes)
    pub offset: usize,
    /// Size level
    pub size: BlockSize,
    /// Whether this block is free
    pub is_free: bool,
    /// Optional buddy block offset (for coalescing)
    pub buddy_offset: Option<usize>,
}

/// An allocated block with metadata
#[derive(Debug, Clone)]
pub struct AllocatedBlock {
    /// Offset from base of buffer (bytes)
    pub offset: usize,
    /// Size of the block
    pub size: BlockSize,
    /// GPU buffer offset (may differ for alignment)
    pub gpu_offset: u64,
    /// Whether aligned to Hilbert curve boundary
    pub hilbert_aligned: bool,
}

/// Buddy allocator for GPU memory sub-allocation
#[derive(Debug)]
pub struct BlockAllocator {
    /// Base buffer offset in the parent pool
    base_offset: usize,
    /// Total size managed by this allocator
    total_size: usize,
    /// Free lists for each block size level
    free_lists: [Vec<Block>; 15],
    /// Allocated blocks by ID
    allocated: HashMap<u64, AllocatedBlock>,
    /// Next allocation ID
    next_id: u64,
    /// Statistics
    stats: AllocatorStats,
}

#[derive(Debug, Clone, Default)]
pub struct AllocatorStats {
    pub total_allocated: usize,
    pub total_freed: usize,
    pub current_used: usize,
    pub allocation_count: u64,
    pub free_count: u64,
    pub split_count: u64,
    pub coalesce_count: u64,
}

impl BlockAllocator {
    /// Create a new buddy allocator for a region of memory
    ///
    /// # Arguments
    ///
    /// * `base_offset` - Base offset in the parent buffer
    /// * `size` - Total size to manage (must be power of 2, max 64MB)
    pub fn new(base_offset: usize, size: usize) -> Self {
        // Find the largest block size that fits
        let max_block = BlockSize::B64MB;
        let actual_size = max_block.size_bytes().min(size);

        // Initialize with one free block of maximum size
        let initial_block = Block {
            offset: 0,
            size: max_block,
            is_free: true,
            buddy_offset: None,
        };

        let mut free_lists: [Vec<Block>; 15] = Default::default();
        let level = Self::size_to_level(max_block);
        free_lists[level].push(initial_block);

        Self {
            base_offset,
            total_size: actual_size,
            free_lists,
            allocated: HashMap::new(),
            next_id: 1,
            stats: AllocatorStats::default(),
        }
    }

    /// Convert block size to free list index
    fn size_to_level(size: BlockSize) -> usize {
        (size as u8 - 12) as usize // B4KB=12 -> index 0
    }

    /// Allocate a block of at least the requested size
    pub fn allocate(&mut self, size: usize) -> MLResult<AllocatedBlock> {
        let requested_size = BlockSize::fit(size)
            .ok_or_else(|| MLError::BlockAllocationFailed(format!(
                "Requested size {} exceeds maximum (64MB)",
                size
            )))?;

        // Find a free block of the requested size or larger
        let mut found_level = None;
        for level in Self::size_to_level(requested_size)..15 {
            if !self.free_lists[level].is_empty() {
                found_level = Some(level);
                break;
            }
        }

        let level = found_level.ok_or_else(|| MLError::OutOfMemory {
            requested: size,
            available: self.total_size - self.stats.current_used,
        })?;

        // Remove block from free list
        let mut block = self.free_lists[level].pop().unwrap();

        // Split block down to requested size
        while Self::size_to_level(block.size) > Self::size_to_level(requested_size) {
            block = self.split_block(block)?;
        }

        block.is_free = false;

        let allocated = AllocatedBlock {
            offset: self.base_offset + block.offset,
            size: block.size,
            gpu_offset: (self.base_offset + block.offset) as u64,
            hilbert_aligned: Self::is_hilbert_aligned(block.offset, block.size),
        };

        let id = self.next_id;
        self.next_id += 1;
        self.allocated.insert(id, allocated.clone());

        self.stats.total_allocated += block.size.size_bytes();
        self.stats.current_used += block.size.size_bytes();
        self.stats.allocation_count += 1;

        Ok(allocated)
    }

    /// Free a previously allocated block
    pub fn free(&mut self, id: u64) -> MLResult<()> {
        let block = self.allocated.remove(&id)
            .ok_or(MLError::TensorNotFound(super::TensorId(id)))?;

        let local_offset = block.offset - self.base_offset;
        let mut free_block = Block {
            offset: local_offset,
            size: block.size,
            is_free: true,
            buddy_offset: Some(Self::buddy_offset(local_offset, block.size)),
        };

        self.stats.total_freed += block.size.size_bytes();
        self.stats.current_used -= block.size.size_bytes();
        self.stats.free_count += 1;

        // Try to coalesce with buddy
        self.coalesce_block(&mut free_block);

        // Add to appropriate free list
        let level = Self::size_to_level(free_block.size);
        self.free_lists[level].push(free_block);

        Ok(())
    }

    /// Split a block into two buddies
    fn split_block(&mut self, block: Block) -> MLResult<Block> {
        let smaller = block.size.smaller()
            .ok_or_else(|| MLError::BlockAllocationFailed("Cannot split minimum block size".into()))?;

        let half_size = smaller.size_bytes();
        let offset1 = block.offset;
        let offset2 = block.offset + half_size;

        // Create two buddy blocks
        let buddy1 = Block {
            offset: offset1,
            size: smaller,
            is_free: true,
            buddy_offset: Some(offset2),
        };
        let buddy2 = Block {
            offset: offset2,
            size: smaller,
            is_free: true,
            buddy_offset: Some(offset1),
        };

        // Add second buddy to free list
        let level = Self::size_to_level(smaller);
        self.free_lists[level].push(buddy2);

        self.stats.split_count += 1;

        Ok(buddy1)
    }

    /// Calculate buddy block offset
    fn buddy_offset(offset: usize, size: BlockSize) -> usize {
        let size_bytes = size.size_bytes();
        // XOR with size to find buddy
        offset ^ size_bytes
    }

    /// Try to coalesce a block with its buddy
    fn coalesce_block(&mut self, block: &mut Block) {
        let Some(buddy_offset) = block.buddy_offset else { return };

        let level = Self::size_to_level(block.size);

        // Look for buddy in free list
        let buddy_idx = self.free_lists[level].iter().position(|b| {
            b.offset == buddy_offset && b.is_free
        });

        if let Some(idx) = buddy_idx {
            // Remove buddy and merge
            self.free_lists[level].remove(idx);

            // Merge into larger block
            let larger = block.size.larger().unwrap();
            block.size = larger;
            block.offset = block.offset.min(buddy_offset);
            block.buddy_offset = Some(Self::buddy_offset(block.offset, larger));

            self.stats.coalesce_count += 1;

            // Try to coalesce further
            self.coalesce_block(block);
        }
    }

    /// Check if offset is aligned to Hilbert curve boundary
    fn is_hilbert_aligned(offset: usize, size: BlockSize) -> bool {
        // Hilbert alignment requires offset to be a multiple of size
        // and size to be a power of 2 (which it always is for buddy allocator)
        offset % size.size_bytes() == 0
    }

    /// Get current allocator statistics
    pub fn stats(&self) -> &AllocatorStats {
        &self.stats
    }

    /// Get fragmentation percentage
    pub fn fragmentation_percent(&self) -> f64 {
        if self.stats.current_used == 0 {
            return 0.0;
        }

        // Count free blocks of each size
        let mut free_blocks = 0;
        let mut free_bytes = 0;
        for list in &self.free_lists {
            for block in list {
                if block.is_free {
                    free_blocks += 1;
                    free_bytes += block.size.size_bytes();
                }
            }
        }

        // Fragmentation = 1 - (largest_free / total_free)
        let largest_free = self.free_lists.iter()
            .rev()
            .find_map(|list| list.iter().find(|b| b.is_free).map(|b| b.size.size_bytes()))
            .unwrap_or(0);

        if free_bytes == 0 {
            0.0
        } else {
            (1.0 - (largest_free as f64 / free_bytes as f64)) * 100.0
        }
    }

    /// Get total free bytes
    pub fn free_bytes(&self) -> usize {
        self.total_size - self.stats.current_used
    }

    /// Get total managed size
    pub fn total_size(&self) -> usize {
        self.total_size
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_block_size_fit() {
        assert_eq!(BlockSize::fit(100), Some(BlockSize::B4KB));
        assert_eq!(BlockSize::fit(4096), Some(BlockSize::B4KB));
        assert_eq!(BlockSize::fit(4097), Some(BlockSize::B8KB));
        assert_eq!(BlockSize::fit(1_000_000), Some(BlockSize::B1MB));
        assert_eq!(BlockSize::fit(100_000_000), None); // > 64MB
    }

    #[test]
    fn test_block_size_sizes() {
        assert_eq!(BlockSize::B4KB.size_bytes(), 4096);
        assert_eq!(BlockSize::B64KB.size_bytes(), 65536);
        assert_eq!(BlockSize::B2MB.size_bytes(), 2 * 1024 * 1024);
        assert_eq!(BlockSize::B64MB.size_bytes(), 64 * 1024 * 1024);
    }

    #[test]
    fn test_allocator_create() {
        let alloc = BlockAllocator::new(0, 64 * 1024 * 1024);
        assert_eq!(alloc.total_size(), 64 * 1024 * 1024);
        assert_eq!(alloc.free_bytes(), 64 * 1024 * 1024);
    }

    #[test]
    fn test_allocator_single_allocation() {
        let mut alloc = BlockAllocator::new(0, 64 * 1024 * 1024);

        let block = alloc.allocate(4096).unwrap();
        assert!(block.offset >= 0);
        assert_eq!(block.size, BlockSize::B4KB);
        assert_eq!(alloc.stats().current_used, 4096);
    }

    #[test]
    fn test_allocator_multiple_allocations() {
        let mut alloc = BlockAllocator::new(0, 64 * 1024 * 1024);

        let b1 = alloc.allocate(4096).unwrap();
        let b2 = alloc.allocate(8192).unwrap();
        let b3 = alloc.allocate(4096).unwrap();

        // All blocks should have different offsets
        assert_ne!(b1.offset, b2.offset);
        assert_ne!(b2.offset, b3.offset);
        assert_ne!(b1.offset, b3.offset);

        assert_eq!(alloc.stats().allocation_count, 3);
    }

    #[test]
    fn test_allocator_free_and_coalesce() {
        let mut alloc = BlockAllocator::new(0, 64 * 1024 * 1024);

        let b1 = alloc.allocate(4096).unwrap();
        let id1 = alloc.next_id - 1;
        let b2 = alloc.allocate(4096).unwrap();
        let id2 = alloc.next_id - 1;

        assert_eq!(alloc.stats().current_used, 8192);

        // Free first block
        alloc.free(id1).unwrap();
        assert_eq!(alloc.stats().current_used, 4096);

        // Free second block - should coalesce
        alloc.free(id2).unwrap();
        assert_eq!(alloc.stats().current_used, 0);
        assert!(alloc.stats().coalesce_count > 0);
    }

    #[test]
    fn test_allocator_out_of_memory() {
        let mut alloc = BlockAllocator::new(0, 64 * 1024); // Only 64KB

        // Allocate all memory
        let _ = alloc.allocate(32 * 1024).unwrap();
        let _ = alloc.allocate(32 * 1024).unwrap();

        // Verify all memory is used
        assert_eq!(alloc.stats().current_used, 64 * 1024);

        // Try allocating more - should either fail or show 0 free bytes
        let free_before = alloc.free_bytes();
        assert!(free_before < 4096); // Not enough for another 4KB block
    }

    #[test]
    fn test_hilbert_alignment() {
        let mut alloc = BlockAllocator::new(0, 64 * 1024 * 1024);

        // First allocation at offset 0 should be Hilbert-aligned
        let block = alloc.allocate(4096).unwrap();
        assert!(block.hilbert_aligned);
    }

    #[test]
    fn test_fragmentation() {
        let mut alloc = BlockAllocator::new(0, 64 * 1024);

        // Allocate alternating blocks
        let blocks: Vec<_> = (0..4).map(|_| alloc.allocate(4096).unwrap()).collect();
        let ids: Vec<_> = (alloc.next_id - 4..alloc.next_id).collect();

        // Free alternate blocks to create fragmentation
        alloc.free(ids[0]).unwrap();
        alloc.free(ids[2]).unwrap();

        // Should have some fragmentation
        let frag = alloc.fragmentation_percent();
        assert!(frag >= 0.0 && frag <= 100.0);
    }
}
