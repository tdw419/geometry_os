/// Simple memory allocator for glyph data
/// This is the target for evolution by the autoresearch system
pub struct GlyphAllocator {
    size: usize,
    allocated: Vec<(usize, usize)>, // (offset, size) tuples
    free_list: Vec<(usize, usize)>, // (offset, size) tuples
}

impl GlyphAllocator {
    /// Create a new allocator with the specified size in bytes
    pub fn new(size_in_bytes: usize) -> Self {
        let mut free_list = Vec::new();
        free_list.push((0, size_in_bytes));

        Self {
            size: size_in_bytes,
            allocated: Vec::new(),
            free_list,
        }
    }

    /// Allocate a block of memory with the specified size in bytes
    /// Returns Some(offset) if successful, None if out of memory
    pub fn allocate(&mut self, size_in_bytes: usize) -> Option<usize> {
        // Simple first-fit allocation algorithm
        // In the autoresearch system, this would be evolved to be more efficient

        // Align to 256-byte boundary for GPU efficiency
        let aligned_size = ((size_in_bytes + 255) / 256) * 256;

        // Find first free block that fits
        if let Some(pos) = self
            .free_list
            .iter()
            .position(|&(_, free_size)| free_size >= aligned_size)
        {
            let (offset, free_size) = self.free_list.remove(pos);

            // If there's leftover space, put it back in the free list
            if free_size > aligned_size {
                self.free_list
                    .push((offset + aligned_size, free_size - aligned_size));
            }

            self.allocated.push((offset, aligned_size));
            Some(offset)
        } else {
            None
        }
    }

    /// Deallocate a previously allocated block
    pub fn deallocate(&mut self, offset: usize) {
        // Find the allocated block
        if let Some(pos) = self
            .allocated
            .iter()
            .position(|&(alloc_offset, _)| alloc_offset == offset)
        {
            let (_, size) = self.allocated.remove(pos);

            // Add to free list and coalesce adjacent blocks
            self.free_list.push((offset, size));
            self.coalesce_free_list();
        }
    }

    /// Coalesce adjacent free blocks to reduce fragmentation
    fn coalesce_free_list(&mut self) {
        // Sort by offset
        self.free_list.sort_by_key(|&(offset, _)| offset);

        // Merge adjacent blocks
        let mut merged = Vec::new();
        if let Some((first_offset, first_size)) = self.free_list.first() {
            let mut current_offset = *first_offset;
            let mut current_size = *first_size;

            for &(offset, size) in self.free_list.iter().skip(1) {
                if offset == current_offset + current_size {
                    // Adjacent blocks, merge them
                    current_size += size;
                } else {
                    // Not adjacent, push current and start new
                    merged.push((current_offset, current_size));
                    current_offset = offset;
                    current_size = size;
                }
            }

            // Don't forget the last block
            merged.push((current_offset, current_size));
        }

        self.free_list = merged;
    }

    /// Get the amount of free space remaining
    pub fn get_free_space(&self) -> usize {
        self.free_list.iter().map(|&(_, size)| size).sum()
    }

    /// Get current fragmentation score (0.0 = no fragmentation, 1.0 = fully fragmented)
    pub fn get_fragmentation(&self) -> f32 {
        if self.free_list.is_empty() {
            return 0.0;
        }

        let free_space = self.get_free_space();
        if free_space == 0 {
            return 0.0;
        }

        // Count number of free blocks
        let block_count = self.free_list.len();

        // Ideal case: one big free block
        // Worst case: many small free blocks
        let avg_block_size = free_space as f32 / block_count as f32;
        let ideal_block_size = free_space as f32; // One big block

        // Fragmentation increases as average block size decreases
        let fragmentation = 1.0 - (avg_block_size / ideal_block_size).min(1.0);
        fragmentation
    }

    /// Reset the allocator (free all memory)
    pub fn reset(&mut self) {
        self.allocated.clear();
        self.free_list.clear();
        self.free_list.push((0, self.size));
    }

    /// Fitness function for the GPU-native glyph memory allocator
    /// Measures: allocation speed, deallocation speed, fragmentation, and correctness
    /// Returns a score between 0.0 and 1.0 (higher is better)
    pub fn evaluate_fitness() -> f32 {
        let mut total_score = 0.0;
        let mut test_count = 0;

        // Test 1: Basic allocation/deallocation correctness
        test_count += 1;
        let mut allocator = GlyphAllocator::new(1024 * 1024); // 1MB

        // Allocate and deallocate some blocks
        let ptr1 = allocator.allocate(256).expect("Failed to allocate");
        let ptr2 = allocator.allocate(512).expect("Failed to allocate");
        let ptr3 = allocator.allocate(128).expect("Failed to allocate");

        // Verify we can read/write to allocated memory (would need GPU access in real implementation)
        // For now, just check that allocator state is consistent

        allocator.deallocate(ptr1);
        allocator.deallocate(ptr2);
        allocator.deallocate(ptr3);

        // If we get here without panic, basic correctness passes
        total_score += 1.0;

        // Test 2: Allocation speed benchmark
        test_count += 1;
        let start = std::time::Instant::now();
        let mut pointers = Vec::new();

        // Allocate many small blocks
        for _ in 0..1000 {
            if let Some(ptr) = allocator.allocate(64) {
                pointers.push(ptr);
            }
        }

        let alloc_time = start.elapsed();
        let alloc_rate = pointers.len() as f32 / alloc_time.as_secs_f32();

        // Normalize score (higher is better) - target: >100K allocations/sec
        let speed_score = (alloc_rate / 100000.0).min(1.0);
        total_score += speed_score;

        // Test 3: Deallocation speed benchmark
        test_count += 1;
        let start = std::time::Instant::now();
        for ptr in pointers.drain(..) {
            allocator.deallocate(ptr);
        }
        let dealloc_time = start.elapsed();
        let dealloc_rate = 1000 as f32 / dealloc_time.as_secs_f32();

        // Normalize score - target: >100K deallocations/sec
        let dealloc_speed_score = (dealloc_rate / 100000.0).min(1.0);
        total_score += dealloc_speed_score;

        // Test 4: Fragmentation test
        test_count += 1;
        // Allocate alternating large/small blocks to create fragmentation
        let mut large_ptrs = Vec::new();
        let mut small_ptrs = Vec::new();

        for i in 0..100 {
            if let Some(ptr) = allocator.allocate(1024) {
                // 1KB blocks
                large_ptrs.push(ptr);
            }
            if let Some(ptr) = allocator.allocate(64) {
                // 64B blocks
                small_ptrs.push(ptr);
            }
        }

        // Free every other large block to create holes
        for i in (0..large_ptrs.len()).step_by(2) {
            allocator.deallocate(large_ptrs[i]);
        }

        // Try to allocate medium-sized blocks in the holes
        let mut medium_allocations = 0;
        for _ in 0..50 {
            if allocator.allocate(512).is_some() {
                medium_allocations += 1;
            }
        }

        // Cleanup
        for ptr in large_ptrs.drain(..) {
            allocator.deallocate(ptr);
        }
        for ptr in small_ptrs.drain(..) {
            allocator.deallocate(ptr);
        }

        // Fragmentation score: percentage of medium allocations that succeeded
        let frag_score = medium_allocations as f32 / 50.0;
        total_score += frag_score;

        // Test 5: Memory reuse efficiency
        test_count += 1;
        let initial_free = allocator.get_free_space();

        // Allocate and deallocate in a pattern that should reuse memory efficiently
        let mut reuse_ptrs = Vec::new();
        for _ in 0..100 {
            if let Some(ptr) = allocator.allocate(128) {
                reuse_ptrs.push(ptr);
            }
        }

        for ptr in reuse_ptrs.drain(..) {
            allocator.deallocate(ptr);
        }

        let final_free = allocator.get_free_space();
        let reuse_efficiency = if initial_free > 0 {
            (final_free as f32 / initial_free as f32).min(1.0)
        } else {
            1.0
        };
        total_score += reuse_efficiency;

        // Test 6: Fragmentation measurement
        test_count += 1;
        let mut allocator2 = GlyphAllocator::new(1024 * 1024); // 1MB

        // Create fragmentation pattern
        let mut fragments = Vec::new();
        for i in 0..100 {
            if let Some(ptr) = allocator2.allocate(1024) {
                // 1KB blocks
                fragments.push(ptr);
            }
        }

        // Free every other block
        for i in (0..fragments.len()).step_by(2) {
            allocator2.deallocate(fragments[i]);
        }

        // Measure fragmentation (lower is better)
        let fragmentation = allocator2.get_fragmentation();
        let frag_score = 1.0 - fragmentation; // Invert so higher is better
        total_score += frag_score;

        // Return average score (0.0 to 1.0, higher is better)
        total_score / test_count as f32
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_basic_allocation() {
        let mut allocator = GlyphAllocator::new(1024);

        // Allocate some blocks
        let ptr1 = allocator.allocate(128).expect("Failed to allocate");
        let ptr2 = allocator.allocate(256).expect("Failed to allocate");
        let ptr3 = allocator.allocate(64).expect("Failed to allocate");

        // Verify they're different offsets
        assert_ne!(ptr1, ptr2);
        assert_ne!(ptr2, ptr3);
        assert_ne!(ptr1, ptr3);

        // Deallocate
        allocator.deallocate(ptr1);
        allocator.deallocate(ptr2);
        allocator.deallocate(ptr3);

        // Should be able to allocate again
        let ptr4 = allocator.allocate(512).expect("Failed to reallocate");
        assert_eq!(ptr4, 0); // Should start at beginning after reset
    }

    #[test]
    fn test_out_of_memory() {
        let mut allocator = GlyphAllocator::new(256);

        // Fill up the allocator with one block (any size 1-256 bytes aligns to 256)
        let ptr1 = allocator.allocate(128).expect("Failed to allocate");

        // Next allocation should fail (no space left)
        let result = allocator.allocate(1);
        assert!(result.is_none(), "Expected allocation to fail");

        // Free the block and try again
        allocator.deallocate(ptr1);
        let ptr2 = allocator
            .allocate(64)
            .expect("Failed to allocate after free");
    }

    #[test]
    fn test_fragmentation() {
        let mut allocator = GlyphAllocator::new(1024);

        // Allocate and deallocate to create fragmentation
        let ptr1 = allocator.allocate(128).unwrap();
        let ptr2 = allocator.allocate(128).unwrap();
        let ptr3 = allocator.allocate(128).unwrap();

        // Free the middle block
        allocator.deallocate(ptr2);

        // Should have some fragmentation now
        let frag = allocator.get_fragmentation();
        assert!(frag > 0.0 && frag < 1.0);

        // Allocate a block that fits in the hole
        let ptr4 = allocator.allocate(128).unwrap();

        // Fragmentation should decrease
        let frag_after = allocator.get_fragmentation();
        assert!(frag_after < frag);
    }

    #[test]
    fn test_coalescing() {
        let mut allocator = GlyphAllocator::new(1024);

        // Allocate three blocks
        let ptr1 = allocator.allocate(200).unwrap();
        let ptr2 = allocator.allocate(200).unwrap();
        let ptr3 = allocator.allocate(200).unwrap();

        // Free the first and third blocks
        allocator.deallocate(ptr1);
        allocator.deallocate(ptr3);

        // Should be able to allocate a large block now
        let ptr4 = allocator.allocate(500).unwrap();

        // Should have low fragmentation
        let frag = allocator.get_fragmentation();
        assert!(frag < 0.5);
    }
}
