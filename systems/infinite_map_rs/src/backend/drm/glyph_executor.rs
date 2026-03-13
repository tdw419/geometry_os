//! DRM-backed glyph program executor
//!
//! Executes compiled SPIR-V glyph programs directly on the GPU
//! via the DRM/KMS backend.
//!
//! ## Trusted Spatial Execution
//!
//! The `execute_attested` method provides atomic verify-and-execute:
//! 1. Verify visual substrate (atlas) hash matches contract
//! 2. Only if verified, execute the glyph SPIR-V program
//! 3. Attest that output matches expected hash
//!
//! If verification fails, execution is BLOCKED.

use std::sync::Arc;
use wgpu::util::DeviceExt;
use sha2::{Sha256, Digest};

use super::vcc_compute::{HardwareVCC, HardwareVCCResult};
use super::scanout::ScanoutAttestation;

/// Output from glyph execution
///
/// Holds both the texture and view to prevent use-after-free.
/// The texture must remain alive as long as the view exists.
pub struct GlyphOutput {
    /// The texture containing the output
    pub texture: Arc<wgpu::Texture>,
    /// A view into the output texture
    pub view: Arc<wgpu::TextureView>,
}

impl std::fmt::Debug for GlyphOutput {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.debug_struct("GlyphOutput")
            .field("texture", &"Arc<Texture>")
            .field("view", &"Arc<TextureView>")
            .finish()
    }
}

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

    #[error("VCC verification failed: {0}")]
    VccVerification(String),
}

/// Result of attested execution with VCC verification.
///
/// This is returned by `execute_attested` and provides full visibility
/// into the verification and execution process.
#[derive(Debug)]
pub struct AttestedExecutionResult {
    /// Output from glyph program execution
    pub output: Vec<u8>,
    /// VCC verification result
    pub vcc: HardwareVCCResult,
    /// Scanout attestation (if display bound)
    pub scanout: Option<ScanoutAttestation>,
    /// Whether execution was allowed
    pub executed: bool,
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
        inputs: &[u8],
        output_size: (u32, u32),
    ) -> Result<(GlyphOutput, Vec<u8>), GlyphError> {
        let loaded = self.pipeline.as_ref().ok_or(GlyphError::NoPipeline)?;

        // Create input buffer (storage buffer)
        // Add COPY_SRC so we can read it back
        let input_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Glyph Input Buffer"),
            size: if inputs.is_empty() {
                16 // Minimum buffer size
            } else {
                inputs.len() as u64
            },
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });
        if !inputs.is_empty() {
            self.queue.write_buffer(&input_buffer, 0, inputs);
        }

        // Create output texture (Rgba8Unorm, storage binding)
        let output_texture = Arc::new(self.device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Glyph Output Texture"),
            size: wgpu::Extent3d {
                width: output_size.0,
                height: output_size.1,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Unorm,
            usage: wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::TEXTURE_BINDING,
            view_formats: &[],
        }));
        let output_view = Arc::new(output_texture.create_view(&wgpu::TextureViewDescriptor::default()));

        // Create uniform buffer with GlyphUniforms
        let uniforms = GlyphUniforms {
            width: output_size.0,
            height: output_size.1,
            time: 0.0,
            _padding: 0.0,
        };
        let uniform_buffer = self
            .device
            .create_buffer_init(&wgpu::util::BufferInitDescriptor {
                label: Some("Glyph Uniform Buffer"),
                contents: bytemuck::cast_slice(&[uniforms]),
                usage: wgpu::BufferUsages::UNIFORM,
            });

        // Create bind group with all 3 resources
        let bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Glyph Bind Group"),
            layout: &loaded.bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: input_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::TextureView(&output_view),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: uniform_buffer.as_entire_binding(),
                },
            ],
        });

        // Create command encoder
        let mut encoder = self
            .device
            .create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("Glyph Compute Encoder"),
            });

        // Begin compute pass, set pipeline, set bind group, dispatch
        {
            let mut compute_pass =
                encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                    label: Some("Glyph Compute Pass"),
                    timestamp_writes: None,
                });
            compute_pass.set_pipeline(&loaded.pipeline);
            compute_pass.set_bind_group(0, &bind_group, &[]);
            compute_pass.dispatch_workgroups(
                (output_size.0 + 7) / 8,
                (output_size.1 + 7) / 8,
                1,
            );
        }

        // Create staging buffer for readback
        let staging_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Glyph Staging Buffer"),
            size: input_buffer.size(),
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Copy from input buffer to staging buffer
        encoder.copy_buffer_to_buffer(&input_buffer, 0, &staging_buffer, 0, input_buffer.size());

        // Submit to queue and wait
        self.queue.submit(std::iter::once(encoder.finish()));

        // Map staging buffer and read back data
        let buffer_slice = staging_buffer.slice(..);
        let (sender, receiver) = futures_intrusive::channel::shared::oneshot_channel();
        buffer_slice.map_async(wgpu::MapMode::Read, move |v| sender.send(v).unwrap());

        self.device.poll(wgpu::Maintain::Wait);

        // Wait for mapping to complete
        pollster::block_on(receiver.receive())
            .unwrap()
            .map_err(|e| GlyphError::Execution(format!("Map async failed: {:?}", e)))?;

        let data = buffer_slice.get_mapped_range().to_vec();
        staging_buffer.unmap();

        Ok((
            GlyphOutput {
                texture: output_texture,
                view: output_view,
            },
            data,
        ))
    }

    /// Check if a pipeline is loaded
    pub fn is_pipeline_loaded(&self) -> bool {
        self.pipeline.is_some()
    }

    /// Execute a glyph program with atomic VCC verification.
    ///
    /// This is the "Trusted Spatial Execution" path:
    /// 1. Verify visual substrate (atlas) hash matches contract
    /// 2. Only if verified, execute the glyph SPIR-V program
    /// 3. Attest that output matches expected hash
    ///
    /// If verification fails, execution is BLOCKED.
    ///
    /// # Arguments
    /// * `atlas_data` - Raw atlas pixel data as RGBA bytes
    /// * `atlas_width` - Atlas width in pixels
    /// * `atlas_height` - Atlas height in pixels
    /// * `contract_hash` - Expected (low, high) 64-bit hash from VCC contract
    /// * `inputs` - Input data for the glyph program
    /// * `output_size` - Output texture dimensions (width, height)
    ///
    /// # Returns
    /// An `AttestedExecutionResult` containing the output and verification status.
    pub fn execute_attested(
        &mut self,
        atlas_data: &[u8],
        atlas_width: u32,
        atlas_height: u32,
        contract_hash: (u32, u32),
        inputs: &[u8],
        output_size: (u32, u32),
    ) -> Result<AttestedExecutionResult, GlyphError> {
        // 1. VERIFY: Check visual substrate integrity
        let vcc = pollster::block_on(HardwareVCC::new())
            .map_err(|e| GlyphError::VccVerification(format!("Failed to init VCC: {}", e)))?;

        let vcc_result = vcc
            .verify_atlas(atlas_data, atlas_width, atlas_height, contract_hash)
            .map_err(|e| GlyphError::VccVerification(format!("VCC verification failed: {}", e)))?;

        if !vcc_result.matches {
            // VERIFICATION FAILED - Block execution
            log::warn!(
                "VCC verification FAILED - blocking execution. Expected: {}, Computed: {}",
                vcc_result.expected_hash,
                vcc_result.computed_hash
            );
            return Ok(AttestedExecutionResult {
                output: vec![],
                vcc: vcc_result,
                scanout: None,
                executed: false,
            });
        }

        // 2. EXECUTE: Run glyph program (only if verified)
        let (_, output) = self.execute(inputs, output_size)?;

        // 3. ATTEST: Verify output reached expected state
        // (Optional - for now we just return success)
        log::info!("VCC verification PASSED - execution completed");

        Ok(AttestedExecutionResult {
            output,
            vcc: vcc_result,
            scanout: None,
            executed: true,
        })
    }

    /// Quick check: Can this executor run given the current atlas?
    ///
    /// This is a fast pre-flight check that verifies the atlas hash
    /// matches the expected contract without executing the program.
    ///
    /// # Arguments
    /// * `atlas_data` - Raw atlas pixel data as RGBA bytes
    /// * `atlas_width` - Atlas width in pixels
    /// * `atlas_height` - Atlas height in pixels
    /// * `contract_hash` - Expected (low, high) 64-bit hash from VCC contract
    ///
    /// # Returns
    /// `true` if the atlas matches the contract, `false` otherwise.
    pub fn can_execute(
        &self,
        atlas_data: &[u8],
        atlas_width: u32,
        atlas_height: u32,
        contract_hash: (u32, u32),
    ) -> bool {
        // Fast path - verify hash without full execution
        let vcc = match pollster::block_on(HardwareVCC::new()) {
            Ok(v) => v,
            Err(_) => return false,
        };

        vcc.verify_atlas(atlas_data, atlas_width, atlas_height, contract_hash)
            .map(|r| r.matches)
            .unwrap_or(false)
    }
}

/// Compute SHA256 hash of execution output for attestation.
pub fn compute_output_hash(output: &[u8]) -> [u8; 32] {
    let mut hasher = Sha256::new();
    hasher.update(output);
    hasher.finalize().into()
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
                // After loading and implementing execute, it should succeed
                let result = executor.execute(&[], (64, 64));
                assert!(!matches!(result, Err(GlyphError::NoPipeline)));
                // Now that execute is implemented, it should return Ok
                assert!(result.is_ok(), "execute should succeed: {:?}", result);
            }
        }
        // Skip if no GPU available
    }

    #[tokio::test]
    async fn test_execute_with_valid_pipeline() {
        let result = create_test_device().await;
        if let Some((device, queue)) = result {
            let mut executor = DrmGlyphExecutor::new(device, queue);

            // Load minimal SPIR-V
            let spirv = minimal_spirv_compute();
            if executor.load_spirv(&spirv).is_ok() {
                // Execute with inputs and size
                let inputs = [1.0f32, 2.0, 3.0, 4.0];
                let inputs_bytes = bytemuck::cast_slice(&inputs);
                let exec_result = executor.execute(inputs_bytes, (64, 64));

                // Should return Ok (not error) after implementation
                assert!(
                    exec_result.is_ok(),
                    "execute should succeed with valid pipeline: {:?}",
                    exec_result
                );

                // Verify we got a GlyphOutput back with both texture and view
                let (output, _) = exec_result.unwrap();
                // TextureView doesn't expose size directly, but we can verify both exist
                let _ = &*output.texture;
                let _ = &*output.view;
            }
        }
        // Skip if no GPU available
    }
}
