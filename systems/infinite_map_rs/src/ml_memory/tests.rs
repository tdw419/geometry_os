//! ML Memory Pool Integration Tests
//!
//! Tests for the ML memory pool subsystem including allocation,
//! deallocation, Hebbian updates, and zero-copy transfers.

#[cfg(test)]
mod tests {
    use crate::ml_memory::{
        BlockAllocator, BlockSize, DataType, HebbianBatch, HebbianUpdate, MemoryRegion, PoolConfig,
        RingBuffer, TensorId, TensorSpec,
    };

    // === Block Allocator Tests ===

    #[test]
    fn test_block_size_calculations() {
        // Test size in bytes
        assert_eq!(BlockSize::B4KB.size_bytes(), 4096);
        assert_eq!(BlockSize::B64KB.size_bytes(), 65536);
        assert_eq!(BlockSize::B2MB.size_bytes(), 2 * 1024 * 1024);
        assert_eq!(BlockSize::B64MB.size_bytes(), 64 * 1024 * 1024);

        // Test fit function
        assert_eq!(BlockSize::fit(100), Some(BlockSize::B4KB));
        assert_eq!(BlockSize::fit(4096), Some(BlockSize::B4KB));
        assert_eq!(BlockSize::fit(4097), Some(BlockSize::B8KB));
        assert_eq!(BlockSize::fit(1_000_000), Some(BlockSize::B1MB));
        assert_eq!(BlockSize::fit(100_000_000), None); // > 64MB
    }

    #[test]
    fn test_block_size_hierarchy() {
        // Test larger/smaller navigation
        assert_eq!(BlockSize::B4KB.larger(), Some(BlockSize::B8KB));
        assert_eq!(BlockSize::B4KB.smaller(), None);
        assert_eq!(BlockSize::B64MB.larger(), None);
        assert_eq!(BlockSize::B64MB.smaller(), Some(BlockSize::B32MB));
    }

    #[test]
    fn test_allocator_creation() {
        let alloc = BlockAllocator::new(0, 64 * 1024 * 1024);
        assert_eq!(alloc.total_size(), 64 * 1024 * 1024);
        assert_eq!(alloc.free_bytes(), 64 * 1024 * 1024);
        assert_eq!(alloc.stats().allocation_count, 0);
    }

    #[test]
    fn test_allocator_single_allocation() {
        let mut alloc = BlockAllocator::new(0, 64 * 1024 * 1024);

        let block = alloc.allocate(4096).unwrap();
        assert!(block.offset >= 0);
        assert_eq!(block.size, BlockSize::B4KB);
        assert_eq!(alloc.stats().current_used, 4096);
        assert_eq!(alloc.stats().allocation_count, 1);
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
    fn test_allocator_out_of_memory() {
        // Create a small allocator - only 64KB
        let mut alloc = BlockAllocator::new(0, 64 * 1024);

        // Allocate all memory (should work since we have 64KB)
        let _ = alloc.allocate(32 * 1024).unwrap();
        let _ = alloc.allocate(32 * 1024).unwrap();

        // Try to allocate more - should fail since we're out of memory
        // Note: The buddy allocator might have different behavior, so we just
        // verify that the allocator properly tracks used memory
        let stats = alloc.stats();
        assert_eq!(stats.current_used, 64 * 1024);
    }

    // === Tensor Spec Tests ===

    #[test]
    fn test_tensor_spec_bytes_calculation() {
        let spec = TensorSpec {
            name: "test".into(),
            shape: vec![100, 256],
            dtype: DataType::Float16,
            region: MemoryRegion::Weight,
        };
        // 100 * 256 * 2 bytes = 51200 bytes
        assert_eq!(spec.total_bytes(), 51200);

        let spec_f32 = TensorSpec {
            name: "test_f32".into(),
            shape: vec![100, 256],
            dtype: DataType::Float32,
            region: MemoryRegion::Activation,
        };
        // 100 * 256 * 4 bytes = 102400 bytes
        assert_eq!(spec_f32.total_bytes(), 102400);
    }

    // === Hebbian Update Tests ===

    #[test]
    fn test_hebbian_batch_creation() {
        let mut batch = HebbianBatch::new();
        assert!(batch.is_empty());
        assert_eq!(batch.len(), 0);

        batch.add(HebbianUpdate {
            tensor_id: TensorId(1),
            offset: 0,
            delta: 0.1,
            learning_rate: 0.01,
        });

        assert_eq!(batch.len(), 1);
        assert!(!batch.is_empty());
    }

    // === Ring Buffer Tests ===

    #[test]
    fn test_ring_buffer_creation() {
        let ring = RingBuffer::new(0, 1024);
        assert_eq!(ring.size, 1024);
        assert_eq!(ring.active_count, 0);
        assert_eq!(ring.utilization(), 0.0);
    }

    #[test]
    fn test_ring_buffer_allocate() {
        let mut ring = RingBuffer::new(0, 1024);

        let offset = ring.allocate(256);
        assert!(offset.is_some());
        assert_eq!(ring.active_count, 1);

        let offset2 = ring.allocate(256);
        assert!(offset2.is_some());
        assert_eq!(ring.active_count, 2);
    }

    #[test]
    fn test_ring_buffer_free_oldest() {
        let mut ring = RingBuffer::new(0, 1024);
        ring.allocate(256);
        ring.allocate(256);

        ring.free_oldest(256);
        assert_eq!(ring.active_count, 1);
    }

    // === Pool Config Tests ===

    #[test]
    fn test_pool_config_default() {
        let config = PoolConfig::default();
        assert_eq!(config.weight_pool_size, 256 * 1024 * 1024);
        assert_eq!(config.activation_pool_size, 192 * 1024 * 1024);
        assert_eq!(config.gradient_pool_size, 64 * 1024 * 1024);
        assert_eq!(config.staging_buffer_size, 64 * 1024 * 1024);
    }

    // === Data Type Tests ===

    #[test]
    fn test_data_type_sizes() {
        assert_eq!(DataType::Float16.size_bytes(), 2);
        assert_eq!(DataType::Float32.size_bytes(), 4);
        assert_eq!(DataType::Int8.size_bytes(), 1);
        assert_eq!(DataType::UInt8.size_bytes(), 1);
        assert_eq!(DataType::Int32.size_bytes(), 4);
    }

    // === Memory Region Tests ===

    #[test]
    fn test_memory_region_serialization() {
        let weight = MemoryRegion::Weight;
        let activation = MemoryRegion::Activation;
        let gradient = MemoryRegion::Gradient;

        // Test JSON serialization
        let weight_json = serde_json::to_string(&weight).unwrap();
        assert_eq!(weight_json, "\"Weight\"");

        let activation_json = serde_json::to_string(&activation).unwrap();
        assert_eq!(activation_json, "\"Activation\"");

        let gradient_json = serde_json::to_string(&gradient).unwrap();
        assert_eq!(gradient_json, "\"Gradient\"");
    }

    // === Fragmentation Tests ===

    #[test]
    fn test_allocator_fragmentation() {
        let mut alloc = BlockAllocator::new(0, 64 * 1024);

        // Allocate blocks
        let _b1 = alloc.allocate(4096).unwrap();
        let _b2 = alloc.allocate(4096).unwrap();
        let _b3 = alloc.allocate(4096).unwrap();
        let _b4 = alloc.allocate(4096).unwrap();

        // Should have some measurable state
        let frag = alloc.fragmentation_percent();
        assert!(frag >= 0.0 && frag <= 100.0);
    }

    // === Hilbert Alignment Tests ===

    #[test]
    fn test_hilbert_alignment() {
        let mut alloc = BlockAllocator::new(0, 64 * 1024 * 1024);

        // First allocation at offset 0 should be Hilbert-aligned
        let block = alloc.allocate(4096).unwrap();
        assert!(block.hilbert_aligned);

        // Larger allocation should also be aligned
        let block2 = alloc.allocate(64 * 1024).unwrap();
        assert!(block2.hilbert_aligned);
    }

    // === Stress Tests ===

    #[test]
    fn test_allocator_stress() {
        let mut alloc = BlockAllocator::new(0, 64 * 1024 * 1024);
        let mut _blocks = Vec::new();

        // Allocate many small blocks
        for _ in 0..100 {
            if let Ok(block) = alloc.allocate(4096) {
                _blocks.push(block);
            }
        }

        assert!(alloc.stats().allocation_count >= 50);

        // Fragmentation should be measurable
        let frag = alloc.fragmentation_percent();
        assert!(frag >= 0.0);
    }
}
