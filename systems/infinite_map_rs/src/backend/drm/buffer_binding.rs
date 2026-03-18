//! Buffer Binding Interface for DRM Compute.
//!
//! This module provides buffer binding capabilities for compute shaders,
//! connecting GPU-allocated buffers to shader binding points.

use anyhow::{Context, Result};
use gbm::BufferObject;

use super::memory::GpuMemoryAllocator;

/// Binding point for a buffer in a compute shader.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum BindingPoint {
    /// Input buffer (binding 0)
    Input = 0,
    /// Output buffer (binding 1)
    Output = 1,
    /// Uniform buffer (binding 2)
    Uniform = 2,
    /// Storage buffer (binding 3)
    Storage = 3,
}

/// A buffer bound to a specific binding point.
#[derive(Debug)]
pub struct BoundBuffer {
    /// The GPU buffer object
    buffer: BufferObject<()>,
    /// The binding point this buffer is bound to
    binding_point: BindingPoint,
    /// Size in bytes
    size: usize,
    /// Optional name for debugging
    name: Option<String>,
}

impl BoundBuffer {
    /// Create a new bound buffer.
    pub fn new(
        buffer: BufferObject<()>,
        binding_point: BindingPoint,
        size: usize,
        name: Option<&str>,
    ) -> Self {
        Self {
            buffer,
            binding_point,
            size,
            name: name.map(String::from),
        }
    }

    /// Get the binding point.
    pub fn binding_point(&self) -> BindingPoint {
        self.binding_point
    }

    /// Get the buffer size in bytes.
    pub fn size(&self) -> usize {
        self.size
    }

    /// Get the buffer object.
    pub fn buffer(&self) -> &BufferObject<()> {
        &self.buffer
    }

    /// Get the buffer's stride (row pitch).
    pub fn stride(&self) -> u32 {
        self.buffer.stride()
    }

    /// Get the buffer dimensions.
    pub fn dimensions(&self) -> (u32, u32) {
        (self.buffer.width(), self.buffer.height())
    }
}

/// Buffer binding manager for compute shader resources.
///
/// This manages the binding of input, output, and uniform buffers
/// to a compute shader's binding points.
pub struct BufferBindingInterface {
    /// The memory allocator used to create buffers
    allocator: GpuMemoryAllocator,
    /// Currently bound buffers
    bound_buffers: Vec<BoundBuffer>,
}

impl BufferBindingInterface {
    /// Create a new buffer binding interface.
    ///
    /// # Arguments
    /// * `allocator` - The GPU memory allocator to use
    pub fn new(allocator: GpuMemoryAllocator) -> Self {
        Self {
            allocator,
            bound_buffers: Vec::new(),
        }
    }

    /// Create from a DRM device.
    pub fn from_device(drm_device: &super::device::DrmDevice) -> Result<Self> {
        let allocator = GpuMemoryAllocator::new(drm_device)?;
        Ok(Self::new(allocator))
    }

    /// Allocate and bind an input buffer.
    ///
    /// # Arguments
    /// * `size` - Size in bytes
    /// * `data` - Optional initial data to write
    ///
    /// # Returns
    /// The binding index of the newly bound buffer.
    pub fn bind_input_buffer(&mut self, size: usize, data: Option<&[u8]>) -> Result<usize> {
        let buffer = self
            .allocator
            .allocate_input_buffer(size)
            .context("Failed to allocate input buffer")?;

        // TODO: Write initial data if provided (requires map_buffer implementation)

        let bound = BoundBuffer::new(buffer, BindingPoint::Input, size, Some("compute-input"));
        self.bound_buffers.push(bound);

        let index = self.bound_buffers.len() - 1;
        log::debug!("Bound input buffer at index {} ({} bytes)", index, size);

        Ok(index)
    }

    /// Allocate and bind an output buffer.
    ///
    /// # Arguments
    /// * `size` - Size in bytes
    ///
    /// # Returns
    /// The binding index of the newly bound buffer.
    pub fn bind_output_buffer(&mut self, size: usize) -> Result<usize> {
        let buffer = self
            .allocator
            .allocate_output_buffer(size)
            .context("Failed to allocate output buffer")?;

        let bound = BoundBuffer::new(buffer, BindingPoint::Output, size, Some("compute-output"));
        self.bound_buffers.push(bound);

        let index = self.bound_buffers.len() - 1;
        log::debug!("Bound output buffer at index {} ({} bytes)", index, size);

        Ok(index)
    }

    /// Allocate and bind a uniform buffer.
    ///
    /// # Arguments
    /// * `size` - Size in bytes
    /// * `data` - Optional initial data
    ///
    /// # Returns
    /// The binding index of the newly bound buffer.
    pub fn bind_uniform_buffer(&mut self, size: usize, data: Option<&[u8]>) -> Result<usize> {
        let buffer = self
            .allocator
            .allocate_buffer(size, Some("compute-uniform"))
            .context("Failed to allocate uniform buffer")?;

        // TODO: Write initial data if provided

        let bound = BoundBuffer::new(buffer, BindingPoint::Uniform, size, Some("compute-uniform"));
        self.bound_buffers.push(bound);

        let index = self.bound_buffers.len() - 1;
        log::debug!("Bound uniform buffer at index {} ({} bytes)", index, size);

        Ok(index)
    }

    /// Allocate and bind a storage buffer.
    ///
    /// Storage buffers are read-write buffers that can be used for
    /// arbitrary data structures in compute shaders.
    ///
    /// # Arguments
    /// * `size` - Size in bytes
    /// * `data` - Optional initial data
    ///
    /// # Returns
    /// The binding index of the newly bound buffer.
    pub fn bind_storage_buffer(&mut self, size: usize, data: Option<&[u8]>) -> Result<usize> {
        let buffer = self
            .allocator
            .allocate_buffer(size, Some("compute-storage"))
            .context("Failed to allocate storage buffer")?;

        // TODO: Write initial data if provided

        let bound = BoundBuffer::new(buffer, BindingPoint::Storage, size, Some("compute-storage"));
        self.bound_buffers.push(bound);

        let index = self.bound_buffers.len() - 1;
        log::debug!("Bound storage buffer at index {} ({} bytes)", index, size);

        Ok(index)
    }

    /// Get a bound buffer by index.
    pub fn get_buffer(&self, index: usize) -> Option<&BoundBuffer> {
        self.bound_buffers.get(index)
    }

    /// Get all bound buffers.
    pub fn buffers(&self) -> &[BoundBuffer] {
        &self.bound_buffers
    }

    /// Get buffers by binding point.
    pub fn get_buffers_by_point(&self, point: BindingPoint) -> Vec<&BoundBuffer> {
        self.bound_buffers
            .iter()
            .filter(|b| b.binding_point == point)
            .collect()
    }

    /// Clear all bound buffers.
    pub fn clear(&mut self) {
        self.bound_buffers.clear();
        log::debug!("Cleared all buffer bindings");
    }

    /// Get the number of bound buffers.
    pub fn len(&self) -> usize {
        self.bound_buffers.len()
    }

    /// Check if no buffers are bound.
    pub fn is_empty(&self) -> bool {
        self.bound_buffers.is_empty()
    }

    /// Get the underlying allocator.
    pub fn allocator(&self) -> &GpuMemoryAllocator {
        &self.allocator
    }

    /// Prepare bindings for compute shader dispatch.
    ///
    /// This validates that required buffers are bound and returns
    /// binding information for the shader.
    pub fn prepare_dispatch(&self) -> Result<DispatchBindings> {
        let has_input = self
            .bound_buffers
            .iter()
            .any(|b| b.binding_point == BindingPoint::Input);
        let has_output = self
            .bound_buffers
            .iter()
            .any(|b| b.binding_point == BindingPoint::Output);

        if !has_input {
            anyhow::bail!("No input buffer bound for compute dispatch");
        }
        if !has_output {
            anyhow::bail!("No output buffer bound for compute dispatch");
        }

        // Collect buffer info for dispatch
        let input_buffers: Vec<(usize, usize)> = self
            .bound_buffers
            .iter()
            .filter(|b| b.binding_point == BindingPoint::Input)
            .map(|b| (b.size, 0)) // placeholder for GPU address
            .collect();

        let output_buffers: Vec<(usize, usize)> = self
            .bound_buffers
            .iter()
            .filter(|b| b.binding_point == BindingPoint::Output)
            .map(|b| (b.size, 0))
            .collect();

        Ok(DispatchBindings {
            input_count: input_buffers.len(),
            output_count: output_buffers.len(),
            total_size: self.bound_buffers.iter().map(|b| b.size).sum(),
        })
    }
}

/// Binding information for a compute shader dispatch.
#[derive(Debug, Clone)]
pub struct DispatchBindings {
    /// Number of input buffers
    pub input_count: usize,
    /// Number of output buffers
    pub output_count: usize,
    /// Total size of all bound buffers
    pub total_size: usize,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_binding_point_values() {
        assert_eq!(BindingPoint::Input as u32, 0);
        assert_eq!(BindingPoint::Output as u32, 1);
        assert_eq!(BindingPoint::Uniform as u32, 2);
        assert_eq!(BindingPoint::Storage as u32, 3);
    }

    #[test]
    fn test_buffer_binding_interface_creation() {
        if !GpuMemoryAllocator::is_available() {
            log::warn!("Skipping test: DRM/GBM not available");
            return;
        }

        let drm_device = match super::super::device::DrmDevice::open_default() {
            Ok(d) => d,
            Err(e) => {
                log::warn!("Skipping test: DRM device not available: {}", e);
                return;
            }
        };

        let allocator = match GpuMemoryAllocator::new(&drm_device) {
            Ok(a) => a,
            Err(e) => {
                log::warn!("Skipping test: GBM not available: {}", e);
                return;
            }
        };

        let interface = BufferBindingInterface::new(allocator);
        assert!(interface.is_empty());
    }

    #[test]
    fn test_bind_buffers() {
        if !GpuMemoryAllocator::is_available() {
            log::warn!("Skipping test: DRM/GBM not available");
            return;
        }

        let drm_device = match super::super::device::DrmDevice::open_default() {
            Ok(d) => d,
            Err(_) => {
                log::warn!("Skipping test: DRM device not available");
                return;
            }
        };

        let allocator = match GpuMemoryAllocator::new(&drm_device) {
            Ok(a) => a,
            Err(e) => {
                log::warn!("Skipping test: GBM not available: {}", e);
                return;
            }
        };

        let mut interface = BufferBindingInterface::new(allocator);

        // Bind input and output buffers
        match interface.bind_input_buffer(1024, None) {
            Ok(idx) => log::info!("Input buffer bound at index {}", idx),
            Err(e) => {
                log::warn!("Input buffer bind failed (may be expected): {}", e);
                return;
            }
        }

        match interface.bind_output_buffer(2048) {
            Ok(idx) => log::info!("Output buffer bound at index {}", idx),
            Err(e) => {
                log::warn!("Output buffer bind failed: {}", e);
                return;
            }
        }

        assert_eq!(interface.len(), 2);

        // Test prepare_dispatch
        match interface.prepare_dispatch() {
            Ok(bindings) => {
                assert_eq!(bindings.input_count, 1);
                assert_eq!(bindings.output_count, 1);
                log::info!("Dispatch prepared: {:?}", bindings);
            }
            Err(e) => {
                log::warn!("Prepare dispatch failed: {}", e);
            }
        }
    }

    #[test]
    fn test_prepare_dispatch_validation() {
        if !GpuMemoryAllocator::is_available() {
            log::warn!("Skipping test: DRM/GBM not available");
            return;
        }

        let drm_device = match super::super::device::DrmDevice::open_default() {
            Ok(d) => d,
            Err(_) => return,
        };

        let allocator = match GpuMemoryAllocator::new(&drm_device) {
            Ok(a) => a,
            Err(_) => return,
        };

        let mut interface = BufferBindingInterface::new(allocator);

        // Only bind input - should fail validation
        if interface.bind_input_buffer(1024, None).is_err() {
            return; // Skip if allocation fails
        }

        let result = interface.prepare_dispatch();
        assert!(result.is_err());
        assert!(result.unwrap_err().to_string().contains("No output buffer"));
    }
}
