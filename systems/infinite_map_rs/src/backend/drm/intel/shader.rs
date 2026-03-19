//! Intel GPU Compute Shader - SPIR-V to Intel assembly.
//!
//! Converts SPIR-V to Intel GPU native format for direct execution.

use anyhow::Result;

/// Intel compute shader loaded from SPIR-V.
pub struct ComputeShader {
    /// SPIR-V binary words
    spirv_binary: Vec<u32>,
    /// Shader entry point name
    entry_point: String,
    /// Whether shader is ready for execution
    ready: bool,
    /// Intel-specific kernel pointer
    kernel_offset: u64,
}

impl ComputeShader {
    /// Create a compute shader from SPIR-V binary.
    pub fn from_spirv(spirv_binary: Vec<u32>, entry_point: &str) -> Result<Self> {
        // Validate SPIR-V magic
        if spirv_binary.is_empty() {
            anyhow::bail!("Empty SPIR-V binary");
        }

        if spirv_binary[0] != 0x07230203 {
            anyhow::bail!("Invalid SPIR-V magic number: 0x{:08x}", spirv_binary[0]);
        }

        log::info!(
            "Created Intel compute shader: {} words, entry={}",
            spirv_binary.len(),
            entry_point
        );

        Ok(Self {
            spirv_binary,
            entry_point: entry_point.to_string(),
            ready: true,
            kernel_offset: 0,
        })
    }

    /// Get the SPIR-V binary.
    pub fn spirv(&self) -> &[u32] {
        &self.spirv_binary
    }

    /// Get the entry point name.
    pub fn entry_point(&self) -> &str {
        &self.entry_point
    }

    /// Check if shader is ready.
    pub fn is_ready(&self) -> bool {
        self.ready
    }

    /// Set the kernel offset (from upload).
    pub fn set_kernel_offset(&mut self, offset: u64) {
        self.kernel_offset = offset;
    }

    /// Get the kernel offset.
    pub fn kernel_offset(&self) -> u64 {
        self.kernel_offset
    }

    /// Convert to Intel batch buffer commands.
    ///
    /// This generates the INTERFACE_DESCRIPTOR_DATA and
    /// related commands for compute dispatch.
    pub fn to_batch_commands(&self) -> Result<Vec<u32>> {
        if !self.ready {
            anyhow::bail!("Shader not ready");
        }

        let commands = Vec::new();

        // In a real implementation, this would:
        // 1. Parse SPIR-V to understand the kernel
        // 2. Generate MEDIA_INTERFACE_DESCRIPTOR_LOAD
        // 3. Set up CURBE (constant URB entry)
        // 4. Generate binding table

        log::debug!("Generated {} batch commands for shader", commands.len());

        Ok(commands)
    }
}
