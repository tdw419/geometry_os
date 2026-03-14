//! Ubuntu RV64 Bridge
//!
//! Uses the existing DrmGlyphExecutor to run the Ubuntu RISC-V 64-bit kernel
//! directly on the GPU.

use anyhow::Result;
use std::sync::Arc;

use crate::backend::drm::glyph_executor::GlyphOutput;
use crate::backend::drm::glyph_executor::{DrmGlyphExecutor, GlyphError};

/// Ubuntu kernel input format
pub struct UbuntuKernelInput {
    /// The crystallized kernel texture (RGBA pixels)
    pub pixels: Vec<u8>,
    /// Width of the kernel texture
    pub width: u32,
    /// Height of the kernel texture
    pub height: u32,
    /// Entry point (usually 0x80000000)
    pub entry_point: u64,
}

/// RV64 execution result
pub struct Rv64Result {
    /// Output texture (can be displayed)
    pub output: GlyphOutput,
    /// Number of cycles executed
    pub cycles: u32,
    /// Console output (UART)
    pub console_output: Vec<u8>,
}

/// Bridge between Ubuntu kernel and DrmGlyphExecutor
pub struct UbuntuRv64Bridge {
    executor: DrmGlyphExecutor,
    kernel: Option<UbuntuKernelInput>,
    spirv: Vec<u32>,
}

impl UbuntuRv64Bridge {
    /// Create a new Ubuntu RV64 bridge
    pub fn new(device: Arc<wgpu::Device>, queue: Arc<wgpu::Queue>) -> Self {
        let executor = DrmGlyphExecutor::new(device, queue);

        // Compile the RV64 GLSL shader to SPIR-V
        let spirv = Self::compile_rv64_shader();

        Self {
            executor,
            kernel: None,
            spirv,
        }
    }

    /// Load an Ubuntu kernel from an .rts.png file
    pub fn load_kernel(&mut self, path: &str) -> Result<()> {
        let img = image::open(path)?;
        let rgba = img.to_rgba8();
        let (width, height) = rgba.dimensions();

        self.kernel = Some(UbuntuKernelInput {
            pixels: rgba.as_raw().clone(),
            width,
            height,
            entry_point: 0x80000000,
        });

        log::info!("Loaded Ubuntu kernel: {}x{} pixels", width, height);
        Ok(())
    }

    /// Execute the loaded kernel for a specified number of cycles
    pub fn execute(&mut self, max_cycles: u32) -> Result<Rv64Result> {
        let kernel = self
            .kernel
            .as_ref()
            .ok_or_else(|| anyhow::anyhow!("No kernel loaded"))?;

        // Load the RV64 shader
        self.executor
            .load_spirv(&self.spirv)
            .map_err(|e| anyhow::anyhow!("Failed to load RV64 shader: {:?}", e))?;

        // Execute with kernel pixels as input (pass raw bytes)
        let (output, memory_readback) = self
            .executor
            .execute(&kernel.pixels, (kernel.width, kernel.height))
            .map_err(|e| anyhow::anyhow!("Execution failed: {:?}", e))?;

        // Extract console output from the memory readback
        // In this architecture, the UART buffer is part of the memory region
        // or a specific offset in the returned buffer.
        // For now, we look at the UART region (offset 0x10000000 if it was mapped)
        // TODO: Align this with the actual riscv64_vm.glsl layout
        let console_output = if memory_readback.len() > 4096 {
            // Simulate reading the UART ring buffer from the end of the memory
            memory_readback[memory_readback.len() - 4096..].to_vec()
        } else {
            Vec::new()
        };

        Ok(Rv64Result {
            output,
            cycles: max_cycles,
            console_output,
        })
    }

    /// Compile the simplified RV64 shader to SPIR-V
    fn compile_rv64_shader() -> Vec<u32> {
        use naga::back::spv;
        use naga::front::glsl;

        let source = include_str!("../shaders/riscv64_simple.glsl");

        let mut parser = glsl::Frontend::default();
        let options = glsl::Options {
            stage: naga::ShaderStage::Compute,
            defines: naga::FastHashMap::default(),
        };

        let module = parser
            .parse(&options, source)
            .expect("Failed to parse simplified RV64 GLSL");

        let mut validator = naga::valid::Validator::new(
            naga::valid::ValidationFlags::all(),
            naga::valid::Capabilities::all(),
        );
        let info = validator
            .validate(&module)
            .expect("Failed to validate simplified RV64 shader");

        let spv_options = spv::Options {
            lang_version: (1, 3),
            flags: spv::WriterFlags::empty(),
            ..Default::default()
        };

        spv::write_vec(&module, &info, &spv_options, None).expect("Failed to write SPIR-V")
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[tokio::test]
    async fn test_bridge_creation() {
        // This test requires GPU - skip in CI
        if std::env::var("CI").is_ok() {
            return;
        }

        // Would need actual wgpu device setup
    }
}
