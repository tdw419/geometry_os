//! Glyph Compute - Direct SPIR-V execution via DRM.
//!
//! This module executes compiled glyph SPIR-V directly via DRM,
//! bypassing Vulkan/WebGPU for Phase 2 of the Glyph-to-Metal pipeline.

use anyhow::{anyhow, Context, Result};
use std::os::unix::io::AsRawFd;

use super::buffer_binding::{BufferBindingInterface, DispatchBindings};
use super::device::DrmDevice;
use super::memory::GpuMemoryAllocator;

/// Direct SPIR-V compute executor via DRM.
pub struct GlyphCompute {
    device: DrmDevice,
    /// Optional buffer binding interface (created on demand)
    buffer_bindings: Option<BufferBindingInterface>,
}

impl GlyphCompute {
    /// Create a new DRM compute executor.
    pub fn new(device: DrmDevice) -> Result<Self> {
        Ok(Self {
            device,
            buffer_bindings: None,
        })
    }

    /// Initialize the buffer binding interface.
    ///
    /// This creates a GPU memory allocator and buffer binding interface
    /// for managing compute shader input/output buffers.
    pub fn init_buffer_bindings(&mut self) -> Result<&mut BufferBindingInterface> {
        if self.buffer_bindings.is_none() {
            let allocator = GpuMemoryAllocator::new(&self.device)
                .context("Failed to create GPU memory allocator")?;
            self.buffer_bindings = Some(BufferBindingInterface::new(allocator));
            log::info!("Initialized buffer binding interface for DRM compute");
        }
        Ok(self.buffer_bindings.as_mut().unwrap())
    }

    /// Get the buffer binding interface (if initialized).
    pub fn buffer_bindings(&self) -> Option<&BufferBindingInterface> {
        self.buffer_bindings.as_ref()
    }

    /// Get mutable buffer binding interface (initializes if needed).
    pub fn buffer_bindings_mut(&mut self) -> Result<&mut BufferBindingInterface> {
        self.init_buffer_bindings()
    }

    /// Execute a SPIR-V compute shader directly via DRM.
    ///
    /// This bypasses Vulkan/WebGPU and submits compute commands
    /// directly to the GPU via the DRM subsystem.
    pub fn execute_spirv(
        &mut self,
        spirv_binary: &[u32],
        input: &[f32],
        output_size: usize,
    ) -> Result<Vec<f32>> {
        let fd = self.device.fd();

        log::info!(
            "Executing SPIR-V ({} words) via DRM fd={}, output_size={}",
            spirv_binary.len(),
            fd,
            output_size
        );

        // Validate SPIR-V magic number
        if spirv_binary.is_empty() || spirv_binary[0] != 0x07230203 {
            anyhow::bail!("Invalid SPIR-V binary (bad magic number)");
        }

        // Validate SPIR-V version header
        let version = spirv_binary.get(1).copied().unwrap_or(0);
        let major = (version >> 16) & 0xFF;
        let minor = (version >> 8) & 0xFF;
        log::debug!("SPIR-V version: {}.{}", major, minor);

        // In a full implementation, this would:
        // 1. Allocate GPU-visible memory via DRM ✓ (TODO-1/7)
        // 2. Upload SPIR-V binary to GPU (TODO-2/7)
        // 3. Create compute command buffer (TODO-3/7)
        // 4. Bind input/output buffers ✓ (TODO-4/7)
        // 5. Submit to GPU queue via DRM_IOCTL (TODO-5/7)
        // 6. Wait for completion (TODO-6/7)
        // 7. Read back results via DMA (TODO-7/7)

        // Bind buffers using the buffer binding interface
        let bindings = self.prepare_buffer_bindings(input, output_size)?;

        // For Phase 2 scaffold, we simulate execution
        // TODO: Replace with actual AMDGPU/Intel command buffer submission

        // Simulate compute: passthrough with input
        let mut output = vec![0.0f32; output_size];
        let copy_len = input.len().min(output_size);
        output[..copy_len].copy_from_slice(&input[..copy_len]);

        log::info!("DRM compute complete: {} outputs", output_size);
        Ok(output)
    }

    /// Execute with input/output buffer pair.
    pub fn execute_buffers(
        &mut self,
        spirv_binary: &[u32],
        input_buffer: &[f32],
        output_buffer: &mut [f32],
    ) -> Result<()> {
        let result = self.execute_spirv(spirv_binary, input_buffer, output_buffer.len())?;
        output_buffer.copy_from_slice(&result);
        Ok(())
    }

    /// Check if DRM compute is available on this system.
    pub fn is_available() -> bool {
        // Check if /dev/dri/card0 exists and is accessible
        std::path::Path::new("/dev/dri/card0").exists()
            && std::fs::metadata("/dev/dri/card0").is_ok()
    }

    /// Get the underlying DRM device.
    pub fn device(&self) -> &DrmDevice {
        &self.device
    }

    /// Prepare buffer bindings for a compute dispatch.
    ///
    /// This initializes the buffer binding interface if needed and
    /// binds the input and output buffers for the compute shader.
    fn prepare_buffer_bindings(&mut self, input: &[f32], output_size: usize) -> Result<DispatchBindings> {
        let bindings = self.buffer_bindings_mut()?;
        
        // Clear any previous bindings
        bindings.clear();
        
        // Bind input buffer (convert f32 slice to bytes)
        let input_bytes = input.len() * std::mem::size_of::<f32>();
        bindings.bind_input_buffer(input_bytes, None)
            .context("Failed to bind input buffer")?;
        
        // Bind output buffer
        let output_bytes = output_size * std::mem::size_of::<f32>();
        bindings.bind_output_buffer(output_bytes)
            .context("Failed to bind output buffer")?;
        
        // Prepare and validate bindings for dispatch
        bindings.prepare_dispatch()
    }
}
