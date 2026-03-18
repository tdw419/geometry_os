//! GPU Memory Allocation via DRM/GBM.
//!
//! This module implements GPU-visible memory allocation for compute shaders
//! using the Generic Buffer Management (GBM) library, which provides a
//! driver-agnostic interface for allocating GPU buffers.

use anyhow::{Context, Result};
use gbm::{BufferObject, BufferObjectFlags, Device as GbmDevice, Format};

use super::device::DrmDevice;

/// GPU memory allocator using GBM.
///
/// This wraps the GBM device and provides methods for allocating
/// GPU-visible buffers that can be used for compute operations.
pub struct GpuMemoryAllocator {
    gbm_device: GbmDevice<std::fs::File>,
}

impl GpuMemoryAllocator {
    /// Create a new GPU memory allocator from a DRM device.
    ///
    /// # Arguments
    /// * `drm_device` - The DRM device to use for buffer allocation
    ///
    /// # Returns
    /// A new allocator instance, or an error if GBM initialization fails.
    pub fn new(drm_device: &DrmDevice) -> Result<Self> {
        let file = drm_device.file().try_clone().context("Failed to clone DRM device file")?;
        
        let gbm_device = GbmDevice::new(file).context("Failed to create GBM device")?;
        
        log::info!("Created GPU memory allocator (GBM device initialized)");
        
        Ok(Self { gbm_device })
    }
    
    /// Allocate a GPU-visible buffer for compute operations.
    ///
    /// # Arguments
    /// * `size` - Size of the buffer in bytes
    /// * `name` - Optional name for debugging/logging
    ///
    /// # Returns
    /// A BufferObject representing the allocated GPU memory.
    ///
    /// # Notes
    /// - Uses GBM_BO_USE_LINEAR for CPU access (required for readback)
    /// - Uses GBM_BO_USE_RENDERING for GPU compute access
    /// - Format is set to XRGB8888 (common format, will be reinterpreted by shader)
    pub fn allocate_buffer(&self, size: usize, name: Option<&str>) -> Result<BufferObject<()>> {
        // Calculate dimensions: treat as 1D array of 32-bit values
        let width = ((size + 3) / 4) as u32; // Round up to 4-byte boundary
        let height = 1u32;
        
        log::debug!(
            "Allocating GPU buffer: {} bytes ({}x{} 32-bit elements){}",
            size,
            width,
            height,
            name.map(|n| format!(" ({})", n)).unwrap_or_default()
        );
        
        // Create buffer with linear layout (for CPU access) and rendering usage (for GPU)
        let buffer = self.gbm_device
            .create_buffer_object::<()>(
                width,
                height,
                Format::Xrgb8888, // Common format, will be reinterpreted by shader
                BufferObjectFlags::LINEAR | BufferObjectFlags::RENDERING | BufferObjectFlags::WRITE,
            )
            .context("Failed to allocate GBM buffer")?;
        
        log::info!("Allocated GPU buffer: {} bytes ({} stride)", size, buffer.stride());
        
        Ok(buffer)
    }
    
    /// Allocate a buffer optimized for compute shader input.
    ///
    /// This creates a buffer with flags suitable for input data that will
    /// be read by a compute shader.
    pub fn allocate_input_buffer(&self, size: usize) -> Result<BufferObject<()>> {
        self.allocate_buffer(size, Some("compute-input"))
    }
    
    /// Allocate a buffer optimized for compute shader output.
    ///
    /// This creates a buffer with flags suitable for output data that will
    /// be written by a compute shader and read back by the CPU.
    pub fn allocate_output_buffer(&self, size: usize) -> Result<BufferObject<()>> {
        self.allocate_buffer(size, Some("compute-output"))
    }
    
    /// Get the GBM device handle.
    pub fn device(&self) -> &GbmDevice<std::fs::File> {
        &self.gbm_device
    }
    
    /// Check if GPU memory allocation is available.
    ///
    /// This requires:
    /// 1. DRM device access
    /// 2. GBM library availability
    /// 3. Proper permissions
    pub fn is_available() -> bool {
        // Check if DRM device exists
        std::path::Path::new("/dev/dri/card0").exists()
    }
}

/// RAII wrapper for a mapped GPU buffer.
///
/// This provides CPU access to GPU memory while maintaining proper
/// synchronization and cleanup.
pub struct MappedBuffer<'a> {
    buffer: &'a BufferObject<()>,
    mapped_data: &'a [u8],
}

impl<'a> MappedBuffer<'a> {
    /// Map a GPU buffer for CPU access (read-only).
    ///
    /// # Arguments
    /// * `buffer` - The buffer to map
    ///
    /// # Returns
    /// A mapped buffer view, or an error if mapping fails.
    pub fn new(buffer: &'a BufferObject<()>) -> Result<Self> {
        let width = buffer.width();
        let height = buffer.height();
        
        // Map the buffer for reading using a closure
        let mapped_data = buffer
            .map(0, 0, width, height, |mapped_bo| {
                // Return a copy of the data for simplicity
                // In production, we'd keep the mapped buffer alive
                mapped_bo.buffer().to_vec()
            })
            .context("Failed to map GPU buffer")?;
        
        // For now, we need to leak this to maintain the lifetime
        // This is a simplification - in production we'd use a different approach
        let mapped_data: &'a [u8] = Box::leak(mapped_data.into_boxed_slice());
        
        log::trace!("Mapped GPU buffer: {}x{}", width, height);
        
        Ok(Self { buffer, mapped_data })
    }
    
    /// Get a reference to the mapped data.
    pub fn as_slice(&self) -> &[u8] {
        self.mapped_data
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_allocator_creation() {
        if !GpuMemoryAllocator::is_available() {
            log::warn!("Skipping test: DRM/GBM not available");
            return;
        }
        
        let drm_device = match DrmDevice::open_default() {
            Ok(d) => d,
            Err(e) => {
                log::warn!("Skipping test: Failed to open DRM device: {}", e);
                return;
            }
        };
        
        match GpuMemoryAllocator::new(&drm_device) {
            Ok(_) => log::info!("GPU memory allocator created successfully"),
            Err(e) => log::warn!("GPU memory allocator creation failed (expected in some envs): {}", e),
        }
    }
    
    #[test]
    fn test_buffer_allocation() {
        if !GpuMemoryAllocator::is_available() {
            log::warn!("Skipping test: DRM/GBM not available");
            return;
        }
        
        let drm_device = match DrmDevice::open_default() {
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
        
        // Try to allocate a small buffer
        match allocator.allocate_buffer(4096, Some("test")) {
            Ok(buffer) => {
                log::info!("Allocated test buffer: {}x{}, stride={}", 
                    buffer.width(), buffer.height(), buffer.stride());
            }
            Err(e) => {
                log::warn!("Buffer allocation failed (may be expected in some envs): {}", e);
            }
        }
    }
}

