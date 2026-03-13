//! Glyph Compute - Direct SPIR-V execution via DRM.
//!
//! This module executes compiled glyph SPIR-V directly via DRM,
//! bypassing Vulkan/WebGPU for Phase 2 of the Glyph-to-Metal pipeline.

use anyhow::{Context, Result};

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

        // Validate SPIR-V magic
        if spirv_binary.is_empty() || spirv_binary[0] != 0x07230203 {
            anyhow::bail!("Invalid SPIR-V binary");
        }

        // Placeholder - actual implementation would:
        // 1. Allocate GPU memory via DRM
        // 2. Upload SPIR-V to GPU
        // 3. Create compute command buffer
        // 4. Submit to GPU queue
        // 5. Wait for completion
        // 6. Read back results

        // For now, return zeroed output
        Ok(vec![0.0; output_size])
    }

    /// Check if DRM compute is available.
    pub fn is_available() -> bool {
        // Check if /dev/dri/card0 exists
        std::path::Path::new("/dev/dri/card0").exists()
    }
}
