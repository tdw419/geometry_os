//! DRM-backed glyph program executor
//!
//! Executes compiled SPIR-V glyph programs directly on the GPU
//! via the DRM/KMS backend.

use std::sync::Arc;
use wgpu::TextureView;

/// Error types for glyph execution
#[derive(Debug, Clone, PartialEq, thiserror::Error)]
#[non_exhaustive]
pub enum GlyphError {
    #[error("SPIR-V validation failed: {0}")]
    SpirvValidation(String),

    #[error("Compute pipeline creation failed: {0}")]
    PipelineCreation(String),

    #[error("Execution failed: {0}")]
    Execution(String),
}

/// Executes compiled glyph programs on DRM-backed GPU
pub struct DrmGlyphExecutor {
    device: Arc<wgpu::Device>,
    queue: Arc<wgpu::Queue>,
}

impl DrmGlyphExecutor {
    /// Create a new glyph executor
    pub fn new(device: Arc<wgpu::Device>, queue: Arc<wgpu::Queue>) -> Self {
        Self { device, queue }
    }

    /// Load a SPIR-V binary as a compute pipeline
    pub fn load_spirv(&mut self, _spirv: &[u32]) -> Result<(), GlyphError> {
        // TODO: Implement in Task 1.1
        Ok(())
    }

    /// Execute the loaded glyph program
    pub fn execute(
        &self,
        _inputs: &[f32],
        _output_size: (u32, u32),
    ) -> Result<Arc<TextureView>, GlyphError> {
        // TODO: Implement in Task 1.2
        Err(GlyphError::Execution("Not implemented".to_string()))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_executor_creation() {
        // Placeholder - async GPU tests in Task 0.2
        // This verifies the module compiles and types are correct
        assert!(true);
    }
}
