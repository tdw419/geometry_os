//! Gradient Pool for Training Gradients
//!
//! Manages gradient storage during backpropagation with optimizer state support.

use std::collections::HashMap;

use super::{
    block_allocator::{AllocatedBlock, BlockAllocator},
    {MLError, MLResult, PoolStats, TensorId},
};

/// Handle for a gradient allocation
#[derive(Debug, Clone)]
pub struct GradientHandle {
    /// Unique ID
    pub id: TensorId,
    /// Corresponding weight tensor ID
    pub weight_id: TensorId,
    /// GPU offset
    pub gpu_offset: u64,
    /// Size in bytes
    pub size: usize,
    /// Gradient accumulation count
    pub accumulation_count: u32,
    /// Whether gradients are ready for update
    pub ready: bool,
}

/// Optimizer state (Adam-style)
#[derive(Debug, Clone)]
pub struct OptimizerState {
    /// First moment estimate (m)
    pub first_moment_offset: u64,
    /// Second moment estimate (v)
    pub second_moment_offset: u64,
    /// Step count
    pub step: u64,
    /// Beta1 value
    pub beta1: f32,
    /// Beta2 value
    pub beta2: f32,
    /// Epsilon
    pub epsilon: f32,
}

impl Default for OptimizerState {
    fn default() -> Self {
        Self {
            first_moment_offset: 0,
            second_moment_offset: 0,
            step: 0,
            beta1: 0.9,
            beta2: 0.999,
            epsilon: 1e-8,
        }
    }
}

/// Gradient pool for training
pub struct GradientPool {
    /// GPU buffer for gradients
    buffer: Option<wgpu::Buffer>,
    /// Block allocator
    allocator: BlockAllocator,
    /// Total pool size
    total_size: usize,
    /// Active gradient allocations
    gradients: HashMap<TensorId, GradientHandle>,
    /// Optimizer states by weight tensor ID
    optimizer_states: HashMap<TensorId, OptimizerState>,
    /// Gradient to weight mapping
    gradient_to_weight: HashMap<TensorId, TensorId>,
}

impl GradientPool {
    /// Create a new gradient pool
    pub fn new(device: &wgpu::Device, size: usize) -> MLResult<Self> {
        // Create GPU buffer
        let buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("ml_gradient_pool"),
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
            gradients: HashMap::new(),
            optimizer_states: HashMap::new(),
            gradient_to_weight: HashMap::new(),
        })
    }

    /// Allocate space for a gradient tensor
    pub fn allocate(&mut self, size: usize) -> MLResult<AllocatedBlock> {
        self.allocator.allocate(size)
    }

    /// Allocate gradient for a weight tensor
    pub fn allocate_gradient(
        &mut self,
        weight_id: TensorId,
        size: usize,
    ) -> MLResult<GradientHandle> {
        let block = self.allocate(size)?;

        let id = TensorId(self.gradients.len() as u64 + 1);

        let handle = GradientHandle {
            id,
            weight_id,
            gpu_offset: block.gpu_offset,
            size,
            accumulation_count: 0,
            ready: false,
        };

        self.gradients.insert(id, handle.clone());
        self.gradient_to_weight.insert(id, weight_id);

        // Allocate optimizer state
        let optimizer_state = OptimizerState::default();
        self.optimizer_states.insert(weight_id, optimizer_state);

        Ok(handle)
    }

    /// Free a gradient
    pub fn free(&mut self, id: TensorId) -> MLResult<()> {
        let handle = self
            .gradients
            .remove(&id)
            .ok_or(MLError::TensorNotFound(id))?;

        self.gradient_to_weight.remove(&id);
        self.optimizer_states.remove(&handle.weight_id);

        Ok(())
    }

    /// Get gradient by ID
    pub fn get_gradient(&self, id: TensorId) -> Option<&GradientHandle> {
        self.gradients.get(&id)
    }

    /// Get gradient for weight tensor
    pub fn get_gradient_for_weight(&self, weight_id: TensorId) -> Option<&GradientHandle> {
        self.gradients.values().find(|g| g.weight_id == weight_id)
    }

    /// Get optimizer state for weight tensor
    pub fn get_optimizer_state(&self, weight_id: TensorId) -> Option<&OptimizerState> {
        self.optimizer_states.get(&weight_id)
    }

    /// Mark gradient as accumulated (for gradient accumulation)
    pub fn accumulate(&mut self, id: TensorId) -> MLResult<()> {
        let handle = self
            .gradients
            .get_mut(&id)
            .ok_or(MLError::TensorNotFound(id))?;

        handle.accumulation_count += 1;
        Ok(())
    }

    /// Mark gradient as ready for update
    pub fn mark_ready(&mut self, id: TensorId) -> MLResult<()> {
        let handle = self
            .gradients
            .get_mut(&id)
            .ok_or(MLError::TensorNotFound(id))?;

        handle.ready = true;
        Ok(())
    }

    /// Reset gradient after update
    pub fn reset(&mut self, id: TensorId) -> MLResult<()> {
        let handle = self
            .gradients
            .get_mut(&id)
            .ok_or(MLError::TensorNotFound(id))?;

        handle.accumulation_count = 0;
        handle.ready = false;
        Ok(())
    }

    /// Increment optimizer step
    pub fn increment_step(&mut self, weight_id: TensorId) {
        if let Some(state) = self.optimizer_states.get_mut(&weight_id) {
            state.step += 1;
        }
    }

    /// Get all ready gradients
    pub fn get_ready_gradients(&self) -> Vec<&GradientHandle> {
        self.gradients.values().filter(|g| g.ready).collect()
    }

    /// Get the GPU buffer
    pub fn buffer(&self) -> Option<&wgpu::Buffer> {
        self.buffer.as_ref()
    }

    /// Write gradient data
    pub fn write(&self, queue: &wgpu::Queue, offset: u64, data: &[u8]) -> MLResult<()> {
        let buffer = self
            .buffer
            .as_ref()
            .ok_or_else(|| MLError::GpuError("Gradient buffer not initialized".into()))?;

        queue.write_buffer(buffer, offset, data);
        Ok(())
    }

    /// Write Float16 gradients
    pub fn write_f16_gradients(
        &self,
        queue: &wgpu::Queue,
        offset: u64,
        gradients: &[f32],
    ) -> MLResult<()> {
        let mut data = Vec::with_capacity(gradients.len() * 2);
        for g in gradients {
            let bits = half::f16::from_f32(*g).to_bits();
            data.push(bits as u8);
            data.push((bits >> 8) as u8);
        }
        self.write(queue, offset, &data)
    }

    /// Get pool statistics
    pub fn stats(&self) -> PoolStats {
        let allocator_stats = self.allocator.stats();
        PoolStats {
            total_allocated: self.total_size,
            used_bytes: allocator_stats.current_used,
            tensor_count: self.gradients.len(),
            fragmentation_percent: self.allocator.fragmentation_percent(),
            pool_type: "gradient".into(),
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

    /// Clear all gradients
    pub fn clear(&mut self) {
        self.gradients.clear();
        self.gradient_to_weight.clear();
        // Keep optimizer states for next iteration
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_optimizer_state_default() {
        let state = OptimizerState::default();
        assert_eq!(state.step, 0);
        assert!((state.beta1 - 0.9).abs() < 0.001);
        assert!((state.beta2 - 0.999).abs() < 0.001);
    }

    #[test]
    fn test_gradient_handle() {
        let handle = GradientHandle {
            id: TensorId(1),
            weight_id: TensorId(100),
            gpu_offset: 1024,
            size: 256,
            accumulation_count: 0,
            ready: false,
        };

        assert_eq!(handle.weight_id, TensorId(100));
        assert!(!handle.ready);
    }

    #[test]
    fn test_gradient_accumulation() {
        let mut pool = GradientPool {
            buffer: None,
            allocator: BlockAllocator::new(0, 1024 * 1024),
            total_size: 1024 * 1024,
            gradients: HashMap::new(),
            optimizer_states: HashMap::new(),
            gradient_to_weight: HashMap::new(),
        };

        // Create a gradient handle manually for testing
        let handle = GradientHandle {
            id: TensorId(1),
            weight_id: TensorId(100),
            gpu_offset: 0,
            size: 256,
            accumulation_count: 0,
            ready: false,
        };
        pool.gradients.insert(TensorId(1), handle);
        pool.gradient_to_weight.insert(TensorId(1), TensorId(100));

        // Accumulate
        pool.accumulate(TensorId(1)).unwrap();
        pool.accumulate(TensorId(1)).unwrap();

        let grad = pool.get_gradient(TensorId(1)).unwrap();
        assert_eq!(grad.accumulation_count, 2);
    }

    #[test]
    fn test_gradient_ready() {
        let mut pool = GradientPool {
            buffer: None,
            allocator: BlockAllocator::new(0, 1024 * 1024),
            total_size: 1024 * 1024,
            gradients: HashMap::new(),
            optimizer_states: HashMap::new(),
            gradient_to_weight: HashMap::new(),
        };

        let handle = GradientHandle {
            id: TensorId(1),
            weight_id: TensorId(100),
            gpu_offset: 0,
            size: 256,
            accumulation_count: 4,
            ready: false,
        };
        pool.gradients.insert(TensorId(1), handle);

        // Mark ready
        pool.mark_ready(TensorId(1)).unwrap();

        let ready = pool.get_ready_gradients();
        assert_eq!(ready.len(), 1);

        // Reset
        pool.reset(TensorId(1)).unwrap();

        let ready = pool.get_ready_gradients();
        assert_eq!(ready.len(), 0);
    }
}
