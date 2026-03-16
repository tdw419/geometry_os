//! ML Memory Pool Subsystem
//!
//! Dedicated memory management for PixelBrain neural operations with arena-based
//! allocation, zero-copy transfers, and sub-allocation within GPU buffers.
//!
//! ## Architecture
//!
//! ```text
//! MLMemoryPool (512MB total)
//! ├── WeightPool (256MB) - Token embeddings, attention weights, FFN
//! ├── ActivationPool (192MB) - KV cache, layer activations, scratch
//! └── GradientPool (64MB) - Weight gradients, optimizer state
//!
//! Block Hierarchy: 4KB → 64KB → 2MB → 64MB
//! ```
//!
//! ## Design Goals
//!
//! - **Arena-based allocation**: Single large buffer allocations per pool
//! - **Block sub-allocation**: Buddy allocator for efficient memory use
//! - **Zero-copy transfers**: Reusable staging buffers for CPU↔GPU
//! - **Hilbert alignment**: Tensor addresses aligned to Hilbert curve boundaries
//!
//! ## Usage
//!
//! ```rust,ignore
//! use infinite_map_rs::ml_memory::{MLMemoryPool, TensorSpec, MemoryRegion};
//!
//! // Create pool (requires wgpu device/queue)
//! let pool = MLMemoryPool::new(device, queue)?;
//!
//! // Allocate a weight tensor
//! let spec = TensorSpec {
//!     name: "embedding".into(),
//!     shape: vec![32000, 256],
//!     dtype: DataType::Float16,
//!     region: MemoryRegion::Weight,
//! };
//! let tensor = pool.allocate(&spec)?;
//!
//! // Write weights with zero-copy staging
//! pool.write_tensor(&tensor.id, &weight_data)?;
//!
//! // Apply Hebbian updates in batch
//! pool.apply_hebbian_batch(&updates)?;
//! ```

pub mod block_allocator;
pub mod pool;
pub mod weight_pool;
pub mod activation_pool;
pub mod gradient_pool;
pub mod zero_copy;

pub use block_allocator::{BlockAllocator, Block, BlockSize, AllocatedBlock};
pub use pool::{MLMemoryPool, PoolStats, PoolConfig, TensorHandle};
pub use weight_pool::{WeightPool, WeightRegion, HebbianUpdate, HebbianBatch};
pub use activation_pool::{ActivationPool, ActivationHandle, KVCacheEntry, RingBuffer};
pub use gradient_pool::{GradientPool, GradientHandle};
pub use zero_copy::{ZeroCopyManager, StagingBuffer};

use serde::{Deserialize, Serialize};

/// Data types supported by the ML memory pool
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum DataType {
    /// 16-bit floating point (IEEE 754 half precision)
    Float16,
    /// 32-bit floating point (IEEE 754 single precision)
    Float32,
    /// 8-bit signed integer
    Int8,
    /// 8-bit unsigned integer
    UInt8,
    /// 32-bit signed integer
    Int32,
}

impl DataType {
    /// Size in bytes per element
    pub fn size_bytes(&self) -> usize {
        match self {
            DataType::Float16 => 2,
            DataType::Float32 => 4,
            DataType::Int8 => 1,
            DataType::UInt8 => 1,
            DataType::Int32 => 4,
        }
    }
}

/// Memory region for tensor allocation
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum MemoryRegion {
    /// Weight storage (persistent, Hebbian updates)
    Weight,
    /// Activation storage (transient, ring buffer)
    Activation,
    /// Gradient storage (training)
    Gradient,
}

/// Specification for tensor allocation
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TensorSpec {
    /// Unique tensor name
    pub name: String,
    /// Tensor shape dimensions
    pub shape: Vec<usize>,
    /// Data type
    pub dtype: DataType,
    /// Target memory region
    pub region: MemoryRegion,
}

impl TensorSpec {
    /// Calculate total bytes needed for this tensor
    pub fn total_bytes(&self) -> usize {
        let elements: usize = self.shape.iter().product();
        elements * self.dtype.size_bytes()
    }
}

/// Unique identifier for an allocated tensor
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, Serialize, Deserialize)]
pub struct TensorId(pub u64);

impl std::fmt::Display for TensorId {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "tensor:{:016x}", self.0)
    }
}

/// Error types for ML memory operations
#[derive(Debug, thiserror::Error)]
pub enum MLError {
    #[error("Out of memory: requested {requested} bytes, available {available} bytes")]
    OutOfMemory {
        requested: usize,
        available: usize,
    },

    #[error("Tensor not found: {0}")]
    TensorNotFound(TensorId),

    #[error("Invalid tensor shape: {0}")]
    InvalidShape(String),

    #[error("Block allocation failed: {0}")]
    BlockAllocationFailed(String),

    #[error("GPU operation failed: {0}")]
    GpuError(String),

    #[error("Serialization error: {0}")]
    SerializationError(#[from] serde_json::Error),

    #[error("IO error: {0}")]
    IoError(#[from] std::io::Error),
}

/// Result type for ML memory operations
pub type MLResult<T> = Result<T, MLError>;

#[cfg(test)]
mod tests;

#[cfg(test)]
mod module_tests {
    use super::*;

    #[test]
    fn test_data_type_sizes() {
        assert_eq!(DataType::Float16.size_bytes(), 2);
        assert_eq!(DataType::Float32.size_bytes(), 4);
        assert_eq!(DataType::Int8.size_bytes(), 1);
        assert_eq!(DataType::UInt8.size_bytes(), 1);
        assert_eq!(DataType::Int32.size_bytes(), 4);
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
    fn test_tensor_id_display() {
        let id = TensorId(0x1234);
        assert_eq!(format!("{}", id), "tensor:0000000000001234");
    }
}
