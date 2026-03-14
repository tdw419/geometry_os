//! Glyph Compute - Direct SPIR-V execution via DRM.
//!
//! This module executes compiled glyph SPIR-V directly via DRM,
//! bypassing Vulkan/WebGPU for Phase 2 of the Glyph-to-Metal pipeline.

use anyhow::{Context, Result, anyhow};
use std::os::unix::io::AsRawFd;

use super::device::DrmDevice;

/// Direct SPIR-V compute executor via DRM.
pub struct GlyphCompute {
    device: DrmDevice,
}

impl GlyphCompute {
    /// Create a new DRM compute executor.
    pub fn new(device: DrmDevice) -> Result<Self> {
        Ok(Self { device })
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
        // 1. Allocate GPU-visible memory via DRM
        // 2. Upload SPIR-V binary to GPU
        // 3. Create compute command buffer
        // 4. Bind input/output buffers
        // 5. Submit to GPU queue via DRM_IOCTL
        // 6. Wait for completion
        // 7. Read back results via DMA

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
}
