//! Main ML Memory Pool
//!
//! Top-level pool manager that coordinates weight, activation, and gradient pools
//! with zero-copy staging for efficient CPU↔GPU transfers.

use std::sync::{Arc, Mutex};
use std::collections::HashMap;

use super::{
    block_allocator::BlockAllocator,
    weight_pool::WeightPool,
    activation_pool::ActivationPool,
    gradient_pool::GradientPool,
    zero_copy::ZeroCopyManager,
    {TensorSpec, TensorId, MemoryRegion, MLError, MLResult, DataType},
};
use crate::hilbert;

/// Pool size configuration
pub struct PoolConfig {
    /// Weight pool size (default: 256MB)
    pub weight_pool_size: usize,
    /// Activation pool size (default: 192MB)
    pub activation_pool_size: usize,
    /// Gradient pool size (default: 64MB)
    pub gradient_pool_size: usize,
    /// Staging buffer size for zero-copy (default: 64MB)
    pub staging_buffer_size: usize,
}

impl Default for PoolConfig {
    fn default() -> Self {
        Self {
            weight_pool_size: 256 * 1024 * 1024,      // 256MB
            activation_pool_size: 192 * 1024 * 1024,  // 192MB
            gradient_pool_size: 64 * 1024 * 1024,     // 64MB
            staging_buffer_size: 64 * 1024 * 1024,    // 64MB
        }
    }
}

/// Statistics for a memory pool
#[derive(Debug, Clone, Default, serde::Serialize, serde::Deserialize)]
pub struct PoolStats {
    /// Total bytes allocated
    pub total_allocated: usize,
    /// Currently used bytes
    pub used_bytes: usize,
    /// Number of active tensors
    pub tensor_count: usize,
    /// Fragmentation percentage
    pub fragmentation_percent: f64,
    /// Pool type name
    pub pool_type: String,
}

/// Handle to an allocated tensor
#[derive(Debug, Clone)]
pub struct TensorHandle {
    /// Unique tensor ID
    pub id: TensorId,
    /// Tensor name
    pub name: String,
    /// Shape dimensions
    pub shape: Vec<usize>,
    /// Data type
    pub dtype: DataType,
    /// Memory region
    pub region: MemoryRegion,
    /// GPU buffer offset (bytes)
    pub gpu_offset: u64,
    /// Total bytes allocated
    pub bytes: usize,
    /// Whether Hilbert-aligned
    pub hilbert_aligned: bool,
}

/// Main ML Memory Pool
///
/// Coordinates multiple memory pools for ML workloads:
/// - WeightPool: Persistent weights with Hebbian update support
/// - ActivationPool: Transient activations with ring buffer
/// - GradientPool: Training gradients
pub struct MLMemoryPool {
    device: Arc<wgpu::Device>,
    queue: Arc<wgpu::Queue>,
    config: PoolConfig,
    weight_pool: Mutex<WeightPool>,
    activation_pool: Mutex<ActivationPool>,
    gradient_pool: Mutex<GradientPool>,
    zero_copy: Mutex<ZeroCopyManager>,
    tensors: Mutex<HashMap<TensorId, TensorHandle>>,
    name_index: Mutex<HashMap<String, TensorId>>,
    next_tensor_id: Mutex<u64>,
}

impl MLMemoryPool {
    /// Create a new ML memory pool
    pub fn new(
        device: Arc<wgpu::Device>,
        queue: Arc<wgpu::Queue>,
        config: PoolConfig,
    ) -> MLResult<Self> {
        let weight_pool = WeightPool::new(
            &device,
            config.weight_pool_size,
        )?;

        let activation_pool = ActivationPool::new(
            &device,
            config.activation_pool_size,
        )?;

        let gradient_pool = GradientPool::new(
            &device,
            config.gradient_pool_size,
        )?;

        let zero_copy = ZeroCopyManager::new(
            &device,
            config.staging_buffer_size,
        )?;

        Ok(Self {
            device,
            queue,
            config,
            weight_pool: Mutex::new(weight_pool),
            activation_pool: Mutex::new(activation_pool),
            gradient_pool: Mutex::new(gradient_pool),
            zero_copy: Mutex::new(zero_copy),
            tensors: Mutex::new(HashMap::new()),
            name_index: Mutex::new(HashMap::new()),
            next_tensor_id: Mutex::new(1),
        })
    }

    /// Create with default configuration
    pub fn with_defaults(
        device: Arc<wgpu::Device>,
        queue: Arc<wgpu::Queue>,
    ) -> MLResult<Self> {
        Self::new(device, queue, PoolConfig::default())
    }

    /// Allocate a tensor
    pub fn allocate(&self, spec: &TensorSpec) -> MLResult<TensorHandle> {
        let bytes = spec.total_bytes();

        // Allocate from appropriate pool
        let (gpu_offset, hilbert_aligned) = match spec.region {
            MemoryRegion::Weight => {
                let mut pool = self.weight_pool.lock().unwrap();
                let block = pool.allocate(bytes)?;
                (block.gpu_offset, block.hilbert_aligned)
            }
            MemoryRegion::Activation => {
                let mut pool = self.activation_pool.lock().unwrap();
                let block = pool.allocate(bytes)?;
                (block.gpu_offset, block.hilbert_aligned)
            }
            MemoryRegion::Gradient => {
                let mut pool = self.gradient_pool.lock().unwrap();
                let block = pool.allocate(bytes)?;
                (block.gpu_offset, block.hilbert_aligned)
            }
        };

        // Generate tensor ID
        let id = {
            let mut next_id = self.next_tensor_id.lock().unwrap();
            let id = *next_id;
            *next_id += 1;
            TensorId(id)
        };

        let handle = TensorHandle {
            id,
            name: spec.name.clone(),
            shape: spec.shape.clone(),
            dtype: spec.dtype,
            region: spec.region,
            gpu_offset,
            bytes,
            hilbert_aligned,
        };

        // Store handle
        {
            let mut tensors = self.tensors.lock().unwrap();
            tensors.insert(id, handle.clone());
        }
        {
            let mut name_index = self.name_index.lock().unwrap();
            name_index.insert(spec.name.clone(), id);
        }

        Ok(handle)
    }

    /// Free a tensor
    pub fn free(&self, id: TensorId) -> MLResult<()> {
        let handle = {
            let mut tensors = self.tensors.lock().unwrap();
            tensors.remove(&id).ok_or(MLError::TensorNotFound(id))?
        };

        // Remove from name index
        {
            let mut name_index = self.name_index.lock().unwrap();
            name_index.remove(&handle.name);
        }

        // Free from appropriate pool
        match handle.region {
            MemoryRegion::Weight => {
                let mut pool = self.weight_pool.lock().unwrap();
                pool.free(id)?;
            }
            MemoryRegion::Activation => {
                let mut pool = self.activation_pool.lock().unwrap();
                pool.free(id)?;
            }
            MemoryRegion::Gradient => {
                let mut pool = self.gradient_pool.lock().unwrap();
                pool.free(id)?;
            }
        }

        Ok(())
    }

    /// Free tensor by name
    pub fn free_by_name(&self, name: &str) -> MLResult<()> {
        let id = {
            let name_index = self.name_index.lock().unwrap();
            name_index.get(name).copied().ok_or_else(|| {
                MLError::TensorNotFound(TensorId(0))
            })?
        };
        self.free(id)
    }

    /// Get tensor handle by ID
    pub fn get_tensor(&self, id: TensorId) -> MLResult<TensorHandle> {
        let tensors = self.tensors.lock().unwrap();
        tensors.get(&id).cloned().ok_or(MLError::TensorNotFound(id))
    }

    /// Get tensor handle by name
    pub fn get_tensor_by_name(&self, name: &str) -> MLResult<TensorHandle> {
        let id = {
            let name_index = self.name_index.lock().unwrap();
            name_index.get(name).copied().ok_or_else(|| {
                MLError::TensorNotFound(TensorId(0))
            })?
        };
        self.get_tensor(id)
    }

    /// Write data to a tensor (zero-copy staging)
    pub fn write_tensor(&self, id: TensorId, data: &[u8]) -> MLResult<()> {
        let handle = self.get_tensor(id)?;

        if data.len() > handle.bytes {
            return Err(MLError::InvalidShape(format!(
                "Data size {} exceeds tensor size {}",
                data.len(),
                handle.bytes
            )));
        }

        let mut zero_copy = self.zero_copy.lock().unwrap();
        zero_copy.write_to_gpu(
            &self.device,
            &self.queue,
            handle.gpu_offset,
            data,
        )?;

        Ok(())
    }

    /// Read data from a tensor (zero-copy staging)
    pub fn read_tensor(&self, id: TensorId) -> MLResult<Vec<u8>> {
        let handle = self.get_tensor(id)?;

        let mut zero_copy = self.zero_copy.lock().unwrap();
        let data = zero_copy.read_from_gpu(
            &self.device,
            &self.queue,
            handle.gpu_offset,
            handle.bytes,
        )?;

        Ok(data)
    }

    /// Write Float16 weights to a tensor
    pub fn write_f16_weights(&self, id: TensorId, weights: &[f32]) -> MLResult<()> {
        let handle = self.get_tensor(id)?;

        // Encode weights as Float16
        let mut data = Vec::with_capacity(weights.len() * 2);
        for w in weights {
            let bits = half::f16::from_f32(*w).to_bits();
            data.push(bits as u8);
            data.push((bits >> 8) as u8);
        }

        self.write_tensor(id, &data)
    }

    /// Read Float16 weights from a tensor
    pub fn read_f16_weights(&self, id: TensorId) -> MLResult<Vec<f32>> {
        let data = self.read_tensor(id)?;

        // Decode Float16 weights
        let mut weights = Vec::with_capacity(data.len() / 2);
        for chunk in data.chunks(2) {
            let bits = chunk[0] as u16 | ((chunk[1] as u16) << 8);
            weights.push(half::f16::from_bits(bits).to_f32());
        }

        Ok(weights)
    }

    /// Get statistics for all pools
    pub fn stats(&self) -> HashMap<String, PoolStats> {
        let mut stats = HashMap::new();

        {
            let pool = self.weight_pool.lock().unwrap();
            stats.insert("weight".into(), pool.stats());
        }
        {
            let pool = self.activation_pool.lock().unwrap();
            stats.insert("activation".into(), pool.stats());
        }
        {
            let pool = self.gradient_pool.lock().unwrap();
            stats.insert("gradient".into(), pool.stats());
        }

        stats
    }

    /// Get total memory usage
    pub fn total_used(&self) -> usize {
        let stats = self.stats();
        stats.values().map(|s| s.used_bytes).sum()
    }

    /// Get total pool capacity
    pub fn total_capacity(&self) -> usize {
        self.config.weight_pool_size
            + self.config.activation_pool_size
            + self.config.gradient_pool_size
    }

    /// Convert Hilbert distance to GPU offset
    pub fn hilbert_to_offset(&self, d: u64, texture_size: u32) -> u64 {
        Self::calc_hilbert_offset(d, texture_size)
    }

    /// Convert GPU offset to Hilbert distance
    pub fn offset_to_hilbert(&self, offset: u64, texture_size: u32) -> u64 {
        Self::calc_hilbert_distance(offset, texture_size)
    }

    /// Convert Hilbert distance to GPU offset (standalone static method)
    pub fn calc_hilbert_offset(d: u64, texture_size: u32) -> u64 {
        let (x, y) = hilbert::d2xy(texture_size, d);
        (y as u64 * texture_size as u64 * 4) + (x as u64 * 4)
    }

    /// Convert GPU offset to Hilbert distance (standalone static method)
    pub fn calc_hilbert_distance(offset: u64, texture_size: u32) -> u64 {
        let x = (offset / 4) % texture_size as u64;
        let y = (offset / 4) / texture_size as u64;
        hilbert::xy2d(texture_size, x as u32, y as u32)
    }

    /// Sync all pending operations
    pub fn sync(&self) -> MLResult<()> {
        let mut zero_copy = self.zero_copy.lock().unwrap();
        zero_copy.sync(&self.device)?;
        Ok(())
    }

    /// List all tensors
    pub fn list_tensors(&self) -> Vec<TensorHandle> {
        let tensors = self.tensors.lock().unwrap();
        tensors.values().cloned().collect()
    }

    /// Get reference to device
    pub fn device(&self) -> &Arc<wgpu::Device> {
        &self.device
    }

    /// Get reference to queue
    pub fn queue(&self) -> &Arc<wgpu::Queue> {
        &self.queue
    }
}

/// Global ML memory pool handle for daemon access
static mut GLOBAL_ML_POOL: Option<Arc<MLMemoryPool>> = None;

/// Initialize global ML pool
pub fn init_global_pool(device: Arc<wgpu::Device>, queue: Arc<wgpu::Queue>) -> MLResult<()> {
    let pool = MLMemoryPool::with_defaults(device, queue)?;
    unsafe {
        GLOBAL_ML_POOL = Some(Arc::new(pool));
    }
    Ok(())
}

/// Get global ML pool (must be initialized first)
pub fn get_global_pool() -> Option<Arc<MLMemoryPool>> {
    unsafe { GLOBAL_ML_POOL.clone() }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_pool_config_default() {
        let config = PoolConfig::default();
        assert_eq!(config.weight_pool_size, 256 * 1024 * 1024);
        assert_eq!(config.activation_pool_size, 192 * 1024 * 1024);
        assert_eq!(config.gradient_pool_size, 64 * 1024 * 1024);
    }

    #[test]
    fn test_tensor_spec_bytes() {
        let spec = TensorSpec {
            name: "test".into(),
            shape: vec![100, 256],
            dtype: DataType::Float16,
            region: MemoryRegion::Weight,
        };
        // 100 * 256 * 2 bytes = 51200 bytes
        assert_eq!(spec.total_bytes(), 51200);
    }

    #[test]
    fn test_hilbert_offset_conversion() {
        let pool_size = 4096u32;
        let d = 1000u64;
        let offset = MLMemoryPool::calc_hilbert_offset(d, pool_size);
        let recovered = MLMemoryPool::calc_hilbert_distance(offset, pool_size);
        assert_eq!(d, recovered);
    }
}
