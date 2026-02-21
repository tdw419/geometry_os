//! RISC-V Native GPU Pipeline Module
//!
//! Compute pipeline for executing RISC-V programs using the VM shader.

use anyhow::Result;
use std::num::NonZeroU64;
use wgpu::*;

/// RISC-V VM compute pipeline
///
/// Contains the init and execute pipelines for the VM shader.
pub struct RiscvPipeline {
    /// Pipeline for initializing VM state (@group(0) @binding(0-8))
    pub init_pipeline: ComputePipeline,
    /// Pipeline for executing RISC-V instructions
    pub execute_pipeline: ComputePipeline,
    /// Bind group layout matching the shader's 9 bindings
    pub bind_group_layout: BindGroupLayout,
}

impl RiscvPipeline {
    /// Create a new RISC-V VM pipeline
    ///
    /// # Arguments
    /// * `device` - The WGPU device
    ///
    /// # Returns
    /// A `RiscvPipeline` with init and execute pipelines
    pub fn new(device: &Device) -> Result<Self> {
        // Load shader
        let shader_source = std::fs::read_to_string("shaders/riscv_linux_vm.wgsl")?;
        let shader = device.create_shader_module(ShaderModuleDescriptor {
            label: Some("RISC-V VM Shader"),
            source: ShaderSource::Wgsl(shader_source.into()),
        });

        // Create bind group layout matching shader bindings
        let bind_group_layout = device.create_bind_group_layout(&BindGroupLayoutDescriptor {
            label: Some("RISC-V VM Bind Group Layout"),
            entries: &[
                // Binding 0: RAM texture (texture_2d<u32>)
                BindGroupLayoutEntry {
                    binding: 0,
                    visibility: ShaderStages::COMPUTE,
                    ty: BindingType::StorageTexture {
                        access: StorageTextureAccess::ReadOnly,
                        format: TextureFormat::Rgba8Unorm,
                        view_dimension: TextureViewDimension::D2,
                    },
                    count: None,
                },
                // Binding 1: Registers (storage buffer, 32 x u32)
                BindGroupLayoutEntry {
                    binding: 1,
                    visibility: ShaderStages::COMPUTE,
                    ty: BindingType::Buffer {
                        ty: BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: Some(NonZeroU64::new(128).unwrap()),
                    },
                    count: None,
                },
                // Binding 2: Memory (storage buffer)
                BindGroupLayoutEntry {
                    binding: 2,
                    visibility: ShaderStages::COMPUTE,
                    ty: BindingType::Buffer {
                        ty: BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Binding 3: PC (atomic storage buffer)
                BindGroupLayoutEntry {
                    binding: 3,
                    visibility: ShaderStages::COMPUTE,
                    ty: BindingType::Buffer {
                        ty: BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: Some(NonZeroU64::new(4).unwrap()),
                    },
                    count: None,
                },
                // Binding 4: State (storage buffer)
                BindGroupLayoutEntry {
                    binding: 4,
                    visibility: ShaderStages::COMPUTE,
                    ty: BindingType::Buffer {
                        ty: BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: Some(NonZeroU64::new(32).unwrap()),
                    },
                    count: None,
                },
                // Binding 5: CSRs (storage buffer)
                BindGroupLayoutEntry {
                    binding: 5,
                    visibility: ShaderStages::COMPUTE,
                    ty: BindingType::Buffer {
                        ty: BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: Some(NonZeroU64::new(100).unwrap()),
                    },
                    count: None,
                },
                // Binding 6: MMIO (storage buffer)
                BindGroupLayoutEntry {
                    binding: 6,
                    visibility: ShaderStages::COMPUTE,
                    ty: BindingType::Buffer {
                        ty: BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: Some(NonZeroU64::new(76).unwrap()),
                    },
                    count: None,
                },
                // Binding 7: Stats (storage buffer)
                BindGroupLayoutEntry {
                    binding: 7,
                    visibility: ShaderStages::COMPUTE,
                    ty: BindingType::Buffer {
                        ty: BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Binding 8: Config (uniform buffer)
                BindGroupLayoutEntry {
                    binding: 8,
                    visibility: ShaderStages::COMPUTE,
                    ty: BindingType::Buffer {
                        ty: BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: Some(NonZeroU64::new(24).unwrap()),
                    },
                    count: None,
                },
            ],
        });

        // Create pipeline layout
        let pipeline_layout = device.create_pipeline_layout(&PipelineLayoutDescriptor {
            label: Some("RISC-V VM Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        // Create init pipeline
        let init_pipeline = device.create_compute_pipeline(&ComputePipelineDescriptor {
            label: Some("RISC-V Init Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader,
            entry_point: "init",
        });

        // Create execute pipeline
        let execute_pipeline = device.create_compute_pipeline(&ComputePipelineDescriptor {
            label: Some("RISC-V Execute Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader,
            entry_point: "main",
        });

        Ok(Self {
            init_pipeline,
            execute_pipeline,
            bind_group_layout,
        })
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_pipeline_creation() {
        // Requires GPU - skip in unit tests
        // Will be tested in integration tests
    }
}
