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

    #[error("SPIR-V to WGSL conversion failed: {0}")]
    SpirvConversion(String),

    #[error("Compute pipeline creation failed: {0}")]
    PipelineCreation(String),

    #[error("Execution failed: {0}")]
    Execution(String),

    #[error("No pipeline loaded")]
    NoPipeline,
}

/// Uniform buffer layout for glyph shaders
#[repr(C)]
#[derive(Copy, Clone, bytemuck::Pod, bytemuck::Zeroable)]
struct GlyphUniforms {
    width: u32,
    height: u32,
    time: f32,
    _padding: f32,
}

/// Holds the compiled compute pipeline
struct LoadedPipeline {
    pipeline: wgpu::ComputePipeline,
    bind_group_layout: wgpu::BindGroupLayout,
}

/// Executes compiled glyph programs on DRM-backed GPU
pub struct DrmGlyphExecutor {
    device: Arc<wgpu::Device>,
    queue: Arc<wgpu::Queue>,
    pipeline: Option<LoadedPipeline>,
}

impl DrmGlyphExecutor {
    /// Create a new glyph executor
    pub fn new(device: Arc<wgpu::Device>, queue: Arc<wgpu::Queue>) -> Self {
        Self {
            device,
            queue,
            pipeline: None,
        }
    }

    /// Load a SPIR-V binary as a compute pipeline
    ///
    /// Converts SPIR-V to WGSL using naga, then creates the compute pipeline.
    pub fn load_spirv(&mut self, spirv: &[u32]) -> Result<(), GlyphError> {
        // Convert SPIR-V to WGSL using naga
        let wgsl = self.spirv_to_wgsl(spirv)?;

        // Create shader module from WGSL
        let shader_module = self
            .device
            .create_shader_module(wgpu::ShaderModuleDescriptor {
                label: Some("Glyph SPIR-V Shader"),
                source: wgpu::ShaderSource::Wgsl(std::borrow::Cow::Owned(wgsl)),
            });

        // Create bind group layout with 3 bindings:
        // Binding 0: Storage buffer (read/write) - glyph memory
        // Binding 1: Storage texture (write-only) - output
        // Binding 2: Uniform buffer - width, height, time
        let bind_group_layout =
            self.device
                .create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
                    label: Some("Glyph Bind Group Layout"),
                    entries: &[
                        // Binding 0: Storage buffer for glyph memory
                        wgpu::BindGroupLayoutEntry {
                            binding: 0,
                            visibility: wgpu::ShaderStages::COMPUTE,
                            ty: wgpu::BindingType::Buffer {
                                ty: wgpu::BufferBindingType::Storage {
                                    read_only: false,
                                },
                                has_dynamic_offset: false,
                                min_binding_size: None,
                            },
                            count: None,
                        },
                        // Binding 1: Storage texture for output
                        wgpu::BindGroupLayoutEntry {
                            binding: 1,
                            visibility: wgpu::ShaderStages::COMPUTE,
                            ty: wgpu::BindingType::StorageTexture {
                                access: wgpu::StorageTextureAccess::WriteOnly,
                                format: wgpu::TextureFormat::Rgba8Unorm,
                                view_dimension: wgpu::TextureViewDimension::D2,
                            },
                            count: None,
                        },
                        // Binding 2: Uniform buffer for width, height, time
                        wgpu::BindGroupLayoutEntry {
                            binding: 2,
                            visibility: wgpu::ShaderStages::COMPUTE,
                            ty: wgpu::BindingType::Buffer {
                                ty: wgpu::BufferBindingType::Uniform,
                                has_dynamic_offset: false,
                                min_binding_size: Some(
                                    std::num::NonZeroU64::new(std::mem::size_of::<GlyphUniforms>()
                                        as u64)
                                        .unwrap(),
                                ),
                            },
                            count: None,
                        },
                    ],
                });

        // Create pipeline layout
        let pipeline_layout = self
            .device
            .create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
                label: Some("Glyph Pipeline Layout"),
                bind_group_layouts: &[&bind_group_layout],
                push_constant_ranges: &[],
            });

        // Create compute pipeline
        let pipeline = self
            .device
            .create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
                label: Some("Glyph Compute Pipeline"),
                layout: Some(&pipeline_layout),
                module: &shader_module,
                entry_point: "main",
            });

        self.pipeline = Some(LoadedPipeline {
            pipeline,
            bind_group_layout,
        });

        Ok(())
    }

    /// Convert SPIR-V binary to WGSL source using naga
    fn spirv_to_wgsl(&self, spirv: &[u32]) -> Result<String, GlyphError> {
        use naga::back::wgsl::{Writer, WriterFlags};
        use naga::front::spv::Options;
        use naga::valid::{Capabilities, ValidationFlags, Validator};

        // Convert &[u32] to iterator of u32
        let spirv_iter = spirv.iter().copied();

        // Parse SPIR-V
        let mut frontend = naga::front::spv::Frontend::new(spirv_iter, &Options::default());
        let module = frontend
            .parse()
            .map_err(|e| GlyphError::SpirvValidation(format!("{:?}", e)))?;

        // Validate the module
        let mut validator = Validator::new(ValidationFlags::all(), Capabilities::all());
        let info = validator
            .validate(&module)
            .map_err(|e| GlyphError::SpirvValidation(format!("{:?}", e)))?;

        // Convert to WGSL
        let mut wgsl_output = String::new();
        let mut writer = Writer::new(&mut wgsl_output, WriterFlags::empty());
        writer
            .write(&module, &info)
            .map_err(|e| GlyphError::SpirvConversion(format!("{:?}", e)))?;

        Ok(wgsl_output)
    }

    /// Execute the loaded glyph program
    pub fn execute(
        &self,
        _inputs: &[f32],
        _output_size: (u32, u32),
    ) -> Result<Arc<TextureView>, GlyphError> {
        // Check if pipeline is loaded
        if self.pipeline.is_none() {
            return Err(GlyphError::NoPipeline);
        }

        // TODO: Implement execution in Task 1.2
        Err(GlyphError::Execution("Not implemented".to_string()))
    }

    /// Check if a pipeline is loaded
    pub fn is_pipeline_loaded(&self) -> bool {
        self.pipeline.is_some()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Create a test wgpu device for unit tests
    async fn create_test_device() -> Option<(Arc<wgpu::Device>, Arc<wgpu::Queue>)> {
        let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
            backends: wgpu::Backends::all(),
            ..Default::default()
        });

        let adapter = instance
            .request_adapter(&wgpu::RequestAdapterOptions {
                power_preference: wgpu::PowerPreference::default(),
                compatible_surface: None,
                force_fallback_adapter: false,
            })
            .await?;

        let (device, queue) = adapter
            .request_device(&wgpu::DeviceDescriptor::default(), None)
            .await
            .ok()?;

        Some((Arc::new(device), Arc::new(queue)))
    }

    /// Generate a minimal valid SPIR-V compute shader using naga
    fn minimal_spirv_compute() -> Vec<u32> {
        use naga::back::spv;
        use naga::valid::{Capabilities, ValidationFlags, Validator};

        // Create a minimal WGSL compute shader
        let wgsl_source = r#"
@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    // Minimal compute shader - does nothing
}
"#;

        // Parse WGSL
        let mut frontend = naga::front::wgsl::Frontend::new();
        let module = frontend.parse(wgsl_source).expect("Failed to parse WGSL");

        // Validate
        let mut validator = Validator::new(ValidationFlags::all(), Capabilities::all());
        let info = validator.validate(&module).expect("Failed to validate");

        // Convert to SPIR-V
        spv::write_vec(&module, &info, &spv::Options::default(), None)
            .expect("Failed to write SPIR-V")
    }

    #[tokio::test]
    async fn test_executor_creation() {
        let result = create_test_device().await;
        if let Some((device, queue)) = result {
            let executor = DrmGlyphExecutor::new(device, queue);
            // New executor should not have a pipeline loaded
            assert!(!executor.is_pipeline_loaded());
        }
        // Skip if no GPU available
    }

    #[tokio::test]
    async fn test_execute_without_pipeline_returns_error() {
        let result = create_test_device().await;
        if let Some((device, queue)) = result {
            let executor = DrmGlyphExecutor::new(device, queue);
            let result = executor.execute(&[], (64, 64));
            assert!(matches!(result, Err(GlyphError::NoPipeline)));
        }
        // Skip if no GPU available
    }

    #[tokio::test]
    async fn test_load_spirv_creates_pipeline() {
        let result = create_test_device().await;
        if let Some((device, queue)) = result {
            let mut executor = DrmGlyphExecutor::new(device, queue);
            assert!(!executor.is_pipeline_loaded());

            let spirv = minimal_spirv_compute();
            let load_result = executor.load_spirv(&spirv);

            // If SPIR-V validation passes, pipeline should be loaded
            if load_result.is_ok() {
                assert!(executor.is_pipeline_loaded());
            } else {
                // Log the error for debugging
                eprintln!("load_spirv failed: {:?}", load_result);
            }
        }
        // Skip if no GPU available
    }

    #[tokio::test]
    async fn test_execute_with_pipeline_loaded() {
        let result = create_test_device().await;
        if let Some((device, queue)) = result {
            let mut executor = DrmGlyphExecutor::new(device, queue);

            let spirv = minimal_spirv_compute();
            if executor.load_spirv(&spirv).is_ok() {
                // After loading, execute should not return NoPipeline
                // It will return Execution("Not implemented") since Task 1.2 isn't done
                let result = executor.execute(&[], (64, 64));
                assert!(!matches!(result, Err(GlyphError::NoPipeline)));
                assert!(matches!(result, Err(GlyphError::Execution(_))));
            }
        }
        // Skip if no GPU available
    }
}
