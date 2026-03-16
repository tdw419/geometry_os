//! Weight Pool for Neural Network Weights
//!
//! Manages persistent weight storage with Hebbian update support.
//! Optimized for read-heavy workloads with occasional updates.

use std::collections::HashMap;

use super::{
    block_allocator::{BlockAllocator, AllocatedBlock},
    {TensorId, MLError, MLResult, PoolStats},
};

/// Weight memory regions
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum WeightRegion {
    /// Token embeddings
    TokenEmbedding,
    /// Positional embeddings
    PositionalEmbedding,
    /// Attention weights (Q, K, V, O)
    Attention,
    /// Feed-forward network weights
    FFN,
    /// Layer normalization
    LayerNorm,
    /// Output projection
    Output,
    /// Custom/other
    Custom,
}

/// Hebbian update entry
#[derive(Debug, Clone)]
pub struct HebbianUpdate {
    /// Tensor ID to update
    pub tensor_id: TensorId,
    /// Offset within tensor (bytes)
    pub offset: usize,
    /// Weight delta (Float16 encoded as u16)
    pub delta: f32,
    /// Learning rate multiplier
    pub learning_rate: f32,
}

/// Batch of Hebbian updates
#[derive(Debug, Clone, Default)]
pub struct HebbianBatch {
    pub updates: Vec<HebbianUpdate>,
}

impl HebbianBatch {
    pub fn new() -> Self {
        Self { updates: Vec::new() }
    }

    pub fn add(&mut self, update: HebbianUpdate) {
        self.updates.push(update);
    }

    pub fn len(&self) -> usize {
        self.updates.len()
    }

    pub fn is_empty(&self) -> bool {
        self.updates.is_empty()
    }
}

/// Weight pool for persistent weight storage
pub struct WeightPool {
    /// GPU buffer for weights
    buffer: Option<wgpu::Buffer>,
    /// Block allocator
    allocator: BlockAllocator,
    /// Total pool size
    total_size: usize,
    /// Allocated blocks by tensor ID
    allocations: HashMap<TensorId, AllocatedBlock>,
    /// Region assignments
    regions: HashMap<TensorId, WeightRegion>,
}

impl WeightPool {
    /// Create a new weight pool
    pub fn new(device: &wgpu::Device, size: usize) -> MLResult<Self> {
        // Create GPU buffer (read-only from shader perspective, but COPY_DST for updates)
        let buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("ml_weight_pool"),
            size: size as u64,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        let allocator = BlockAllocator::new(0, size);

        Ok(Self {
            buffer: Some(buffer),
            allocator,
            total_size: size,
            allocations: HashMap::new(),
            regions: HashMap::new(),
        })
    }

    /// Allocate space for a weight tensor
    pub fn allocate(&mut self, size: usize) -> MLResult<AllocatedBlock> {
        let block = self.allocator.allocate(size)?;
        Ok(block)
    }

    /// Free a weight tensor
    pub fn free(&mut self, id: TensorId) -> MLResult<()> {
        let block = self.allocations.remove(&id)
            .ok_or(MLError::TensorNotFound(id))?;
        self.regions.remove(&id);

        // For block allocator, we need the internal ID
        // This is a simplification - in practice we'd need to track the allocator ID
        Ok(())
    }

    /// Assign a weight region to a tensor
    pub fn assign_region(&mut self, id: TensorId, region: WeightRegion) {
        self.regions.insert(id, region);
    }

    /// Get region for a tensor
    pub fn get_region(&self, id: TensorId) -> Option<WeightRegion> {
        self.regions.get(&id).copied()
    }

    /// Get the GPU buffer
    pub fn buffer(&self) -> Option<&wgpu::Buffer> {
        self.buffer.as_ref()
    }

    /// Write weights to the pool
    pub fn write_weights(
        &self,
        queue: &wgpu::Queue,
        offset: u64,
        data: &[u8],
    ) -> MLResult<()> {
        let buffer = self.buffer.as_ref()
            .ok_or_else(|| MLError::GpuError("Weight buffer not initialized".into()))?;

        queue.write_buffer(buffer, offset, data);
        Ok(())
    }

    /// Write Float16 weights
    pub fn write_f16_weights(
        &self,
        queue: &wgpu::Queue,
        offset: u64,
        weights: &[f32],
    ) -> MLResult<()> {
        let mut data = Vec::with_capacity(weights.len() * 2);
        for w in weights {
            let bits = half::f16::from_f32(*w).to_bits();
            data.push(bits as u8);
            data.push((bits >> 8) as u8);
        }
        self.write_weights(queue, offset, &data)
    }

    /// Load weights from PNG atlas
    pub fn load_from_png(
        &mut self,
        device: &wgpu::Device,
        queue: &wgpu::Queue,
        png_data: &[u8],
        offset: u64,
    ) -> MLResult<usize> {
        // Decode PNG
        let img = image::load_from_memory(png_data)
            .map_err(|e| MLError::GpuError(format!("PNG decode error: {}", e)))?;
        let rgba = img.to_rgba8();

        // Convert to Float16 weights
        let mut weights = Vec::with_capacity((rgba.width() * rgba.height()) as usize);
        for pixel in rgba.pixels() {
            let bits = pixel.0[0] as u16 | ((pixel.0[1] as u16) << 8);
            weights.push(half::f16::from_bits(bits).to_f32());
        }

        // Write to buffer
        self.write_f16_weights(queue, offset, &weights)?;

        Ok(weights.len())
    }

    /// Get pool statistics
    pub fn stats(&self) -> PoolStats {
        let allocator_stats = self.allocator.stats();
        PoolStats {
            total_allocated: self.total_size,
            used_bytes: allocator_stats.current_used,
            tensor_count: self.allocations.len(),
            fragmentation_percent: self.allocator.fragmentation_percent(),
            pool_type: "weight".into(),
        }
    }

    /// Get free bytes
    pub fn free_bytes(&self) -> usize {
        self.allocator.free_bytes()
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
    fn test_hebbian_batch() {
        let mut batch = HebbianBatch::new();
        assert!(batch.is_empty());

        batch.add(HebbianUpdate {
            tensor_id: TensorId(1),
            offset: 0,
            delta: 0.1,
            learning_rate: 0.01,
        });

        assert_eq!(batch.len(), 1);
        assert!(!batch.is_empty());
    }

    #[test]
    fn test_weight_region() {
        let regions = [
            WeightRegion::TokenEmbedding,
            WeightRegion::Attention,
            WeightRegion::FFN,
            WeightRegion::LayerNorm,
        ];

        for region in regions {
            let display = format!("{:?}", region);
            assert!(!display.is_empty());
        }
    }
}
