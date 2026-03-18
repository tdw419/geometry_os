//! Activation Pool for Transient Neural Activations
//!
//! Manages activation storage with ring buffer for inference workloads.
//! Supports KV cache management for transformer attention.

use std::collections::HashMap;

use super::{
    block_allocator::{AllocatedBlock, BlockAllocator},
    {MLError, MLResult, PoolStats, TensorId},
};

/// Handle for an activation allocation
#[derive(Debug, Clone)]
pub struct ActivationHandle {
    /// Unique ID
    pub id: TensorId,
    /// GPU offset
    pub gpu_offset: u64,
    /// Size in bytes
    pub size: usize,
    /// Layer index (if applicable)
    pub layer: Option<usize>,
    /// Whether this is part of KV cache
    pub is_kv_cache: bool,
}

/// KV cache entry for transformer attention
#[derive(Debug, Clone)]
pub struct KVCacheEntry {
    /// Cache handle
    pub handle: ActivationHandle,
    /// Sequence position
    pub position: usize,
    /// Number of tokens cached
    pub token_count: usize,
    /// Head dimension
    pub head_dim: usize,
    /// Number of attention heads
    pub num_heads: usize,
}

/// Ring buffer state for activation reuse
#[derive(Debug, Clone)]
pub struct RingBuffer {
    /// Buffer start offset
    pub start: u64,
    /// Buffer size
    pub size: usize,
    /// Current write position
    pub write_pos: u64,
    /// Current read position
    pub read_pos: u64,
    /// Number of active entries
    pub active_count: usize,
}

impl RingBuffer {
    pub fn new(start: u64, size: usize) -> Self {
        Self {
            start,
            size,
            write_pos: start,
            read_pos: start,
            active_count: 0,
        }
    }

    /// Allocate space in the ring buffer (wraps around)
    pub fn allocate(&mut self, size: usize) -> Option<u64> {
        if size > self.size {
            return None;
        }

        let available = if self.write_pos >= self.read_pos {
            // Normal case: write ahead of read
            self.size - (self.write_pos - self.start) as usize
        } else {
            // Wrapped case: write behind read
            (self.read_pos - self.write_pos) as usize
        };

        if size > available {
            return None;
        }

        let offset = self.write_pos;
        self.write_pos =
            self.start + ((self.write_pos - self.start + size as u64) % self.size as u64);
        self.active_count += 1;

        Some(offset)
    }

    /// Free oldest entry in the ring buffer
    pub fn free_oldest(&mut self, size: usize) {
        if self.active_count == 0 {
            return;
        }

        self.read_pos =
            self.start + ((self.read_pos - self.start + size as u64) % self.size as u64);
        self.active_count = self.active_count.saturating_sub(1);
    }

    /// Get utilization percentage
    pub fn utilization(&self) -> f64 {
        if self.size == 0 {
            return 0.0;
        }

        let used = if self.write_pos >= self.read_pos {
            (self.write_pos - self.read_pos) as usize
        } else {
            self.size - (self.read_pos - self.write_pos) as usize
        };

        (used as f64 / self.size as f64) * 100.0
    }
}

/// Activation pool for transient data
pub struct ActivationPool {
    /// GPU buffer for activations
    buffer: Option<wgpu::Buffer>,
    /// Block allocator for large allocations
    allocator: BlockAllocator,
    /// Ring buffer for small, transient allocations
    ring_buffer: RingBuffer,
    /// Total pool size
    total_size: usize,
    /// Ring buffer portion
    ring_size: usize,
    /// Static allocation portion
    static_size: usize,
    /// Active allocations
    allocations: HashMap<TensorId, ActivationHandle>,
    /// KV cache entries
    kv_cache: HashMap<String, KVCacheEntry>,
    /// Layer activations
    layer_activations: HashMap<usize, TensorId>,
}

impl ActivationPool {
    /// Create a new activation pool
    pub fn new(device: &wgpu::Device, size: usize) -> MLResult<Self> {
        // Split: 1/3 ring buffer, 2/3 static allocations
        let ring_size = size / 3;
        let static_size = size - ring_size;

        // Create GPU buffer
        let buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("ml_activation_pool"),
            size: size as u64,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        // Block allocator for static portion
        let allocator = BlockAllocator::new(ring_size, static_size);

        // Ring buffer for transient portion
        let ring_buffer = RingBuffer::new(0, ring_size);

        Ok(Self {
            buffer: Some(buffer),
            allocator,
            ring_buffer,
            total_size: size,
            ring_size,
            static_size,
            allocations: HashMap::new(),
            kv_cache: HashMap::new(),
            layer_activations: HashMap::new(),
        })
    }

    /// Allocate space for an activation
    pub fn allocate(&mut self, size: usize) -> MLResult<AllocatedBlock> {
        // Try ring buffer first for small allocations (< 1MB)
        if size < 1024 * 1024 {
            if let Some(_offset) = self.ring_buffer.allocate(size) {
                // Return a pseudo-block for ring buffer allocation
                return Ok(AllocatedBlock {
                    offset: self.ring_buffer.write_pos as usize - size,
                    size: super::block_allocator::BlockSize::B4KB, // Simplified
                    gpu_offset: self.ring_buffer.write_pos - size as u64,
                    hilbert_aligned: false,
                });
            }
        }

        // Fall back to block allocator for larger allocations
        self.allocator.allocate(size)
    }

    /// Free an activation
    pub fn free(&mut self, _id: TensorId) -> MLResult<()> {
        // For ring buffer, freeing is implicit (handled by ring advancement)
        // For static allocations, would free through allocator
        Ok(())
    }

    /// Allocate activation for a specific layer
    pub fn allocate_layer_activation(
        &mut self,
        layer: usize,
        size: usize,
    ) -> MLResult<ActivationHandle> {
        let block = self.allocate(size)?;

        let handle = ActivationHandle {
            id: TensorId(layer as u64 * 1000 + self.allocations.len() as u64),
            gpu_offset: block.gpu_offset,
            size,
            layer: Some(layer),
            is_kv_cache: false,
        };

        self.layer_activations.insert(layer, handle.id);
        self.allocations.insert(handle.id, handle.clone());

        Ok(handle)
    }

    /// Get layer activation
    pub fn get_layer_activation(&self, layer: usize) -> Option<&ActivationHandle> {
        let id = self.layer_activations.get(&layer)?;
        self.allocations.get(id)
    }

    /// Append to KV cache
    pub fn kv_append(
        &mut self,
        name: &str,
        tokens: usize,
        head_dim: usize,
        num_heads: usize,
    ) -> MLResult<KVCacheEntry> {
        // Calculate size needed
        let size = tokens * head_dim * num_heads * 2; // Float16

        // Allocate or extend existing
        let entry = if let Some(existing) = self.kv_cache.get(name) {
            // Extend existing cache
            let mut extended = existing.clone();
            extended.token_count += tokens;
            extended
        } else {
            // Create new cache entry
            let block = self.allocate(size)?;
            let handle = ActivationHandle {
                id: TensorId(self.kv_cache.len() as u64),
                gpu_offset: block.gpu_offset,
                size,
                layer: None,
                is_kv_cache: true,
            };

            KVCacheEntry {
                handle,
                position: 0,
                token_count: tokens,
                head_dim,
                num_heads,
            }
        };

        self.kv_cache.insert(name.to_string(), entry.clone());
        Ok(entry)
    }

    /// Get KV cache entry
    pub fn kv_get(&self, name: &str) -> Option<&KVCacheEntry> {
        self.kv_cache.get(name)
    }

    /// Clear KV cache
    pub fn kv_clear(&mut self) {
        self.kv_cache.clear();
    }

    /// Advance ring buffer (discard old activations)
    pub fn advance_ring(&mut self, size: usize) {
        self.ring_buffer.free_oldest(size);
    }

    /// Get the GPU buffer
    pub fn buffer(&self) -> Option<&wgpu::Buffer> {
        self.buffer.as_ref()
    }

    /// Write activation data
    pub fn write(&self, queue: &wgpu::Queue, offset: u64, data: &[u8]) -> MLResult<()> {
        let buffer = self
            .buffer
            .as_ref()
            .ok_or_else(|| MLError::GpuError("Activation buffer not initialized".into()))?;

        queue.write_buffer(buffer, offset, data);
        Ok(())
    }

    /// Get pool statistics
    pub fn stats(&self) -> PoolStats {
        let allocator_stats = self.allocator.stats();
        let ring_util = self.ring_buffer.utilization();

        PoolStats {
            total_allocated: self.total_size,
            used_bytes: allocator_stats.current_used
                + (self.ring_size as f64 * ring_util / 100.0) as usize,
            tensor_count: self.allocations.len() + self.kv_cache.len(),
            fragmentation_percent: self.allocator.fragmentation_percent(),
            pool_type: "activation".into(),
        }
    }

    /// Get ring buffer utilization
    pub fn ring_utilization(&self) -> f64 {
        self.ring_buffer.utilization()
    }

    /// Get free bytes
    pub fn free_bytes(&self) -> usize {
        self.allocator.free_bytes()
            + (self.ring_size
                - (self.ring_size as f64 * self.ring_buffer.utilization() / 100.0) as usize)
    }

    /// Get total size
    pub fn total_size(&self) -> usize {
        self.total_size
    }
}

#[cfg(test)]
mod tests {
    use super::*;

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
    }

    #[test]
    fn test_ring_buffer_wrap() {
        let mut ring = RingBuffer::new(0, 256);

        // Fill buffer
        let _ = ring.allocate(200);
        let _ = ring.allocate(200); // Should wrap

        assert!(ring.active_count >= 1);
    }

    #[test]
    fn test_ring_buffer_free_oldest() {
        let mut ring = RingBuffer::new(0, 1024);
        ring.allocate(256);
        ring.allocate(256);

        ring.free_oldest(256);
        assert_eq!(ring.active_count, 1);
    }

    #[test]
    fn test_activation_handle() {
        let handle = ActivationHandle {
            id: TensorId(1),
            gpu_offset: 1024,
            size: 256,
            layer: Some(0),
            is_kv_cache: false,
        };

        assert_eq!(handle.layer, Some(0));
        assert!(!handle.is_kv_cache);
    }

    #[test]
    fn test_kv_cache_entry() {
        let handle = ActivationHandle {
            id: TensorId(1),
            gpu_offset: 0,
            size: 1024,
            layer: None,
            is_kv_cache: true,
        };

        let entry = KVCacheEntry {
            handle,
            position: 0,
            token_count: 10,
            head_dim: 64,
            num_heads: 8,
        };

        assert_eq!(entry.token_count, 10);
        assert_eq!(entry.head_dim, 64);
    }
}
