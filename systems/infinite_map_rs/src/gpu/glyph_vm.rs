//! Glyph VM - GPU-Native Instruction Execution
//!
//! Manages the execution of glyph-atomic programs (font-as-bytecode)
//! on the GPU via glyph_microcode.wgsl.

use std::sync::Arc;
use wgpu;
use bytemuck::{Pod, Zeroable};

/// Glyph Instruction (matches WGSL struct)
#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable, Default)]
pub struct Glyph {
    pub opcode: u32,
    pub stratum: u32,
    pub p1: f32,
    pub p2: f32,
    pub dst: u32,
}

/// VM State (matches WGSL struct)
#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
pub struct GlyphVMState {
    pub pc: u32,
    pub sp: u32,
    pub flags: u32,
    pub halted: u32,
    pub cycles: u32,
}

impl Default for GlyphVMState {
    fn default() -> Self {
        Self {
            pc: 0,
            sp: 0,
            flags: 0,
            halted: 0,
            cycles: 0,
        }
    }
}

pub struct GlyphVM {
    pub device: Arc<wgpu::Device>,
    pub queue: Arc<wgpu::Queue>,
    pub program_buffer: wgpu::Buffer,
    pub state_buffer: wgpu::Buffer,
    pub memory_buffer: wgpu::Buffer,
    pub stack_buffer: wgpu::Buffer,
    pub pipeline: wgpu::ComputePipeline,
    pub bind_group: wgpu::BindGroup,
    pub atlas_view: wgpu::TextureView,
    pub screen_view: wgpu::TextureView,
}

impl GlyphVM {
    pub fn new(
        device: Arc<wgpu::Device>,
        queue: Arc<wgpu::Queue>,
        atlas_view: wgpu::TextureView,
        screen_view: wgpu::TextureView,
        program_size: usize,
        memory_size: usize,
        stack_size: usize,
    ) -> Self {
        // 1. Create Buffers
        let program_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Glyph Program Buffer"),
            size: (program_size * std::mem::size_of::<Glyph>()) as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let state_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Glyph State Buffer"),
            size: std::mem::size_of::<GlyphVMState>() as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_SRC | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let memory_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Glyph Memory Buffer"),
            size: (memory_size * 4) as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_SRC | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let stack_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Glyph Stack Buffer"),
            size: (stack_size * 4) as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // 2. Load Shader
        let shader = device.create_shader_module(wgpu::include_wgsl!("shaders/glyph_microcode.wgsl"));

        // 3. Create Pipeline
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Glyph VM Layout"),
            entries: &[
                wgpu::BindGroupLayoutEntry { // program
                    binding: 0,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry { // state
                    binding: 1,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry { // memory
                    binding: 2,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry { // stack
                    binding: 3,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry { // atlas
                    binding: 4,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Texture {
                        sample_type: wgpu::TextureSampleType::Float { filterable: true },
                        view_dimension: wgpu::TextureViewDimension::D2,
                        multisampled: false,
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry { // screen
                    binding: 5,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::StorageTexture {
                        access: wgpu::StorageTextureAccess::WriteOnly,
                        format: wgpu::TextureFormat::Rgba8Unorm,
                        view_dimension: wgpu::TextureViewDimension::D2,
                    },
                    count: None,
                },
            ],
        });

        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Glyph VM Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        let pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Glyph VM Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader,
            entry_point: "main",
        });

        // 4. Create Bind Group
        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Glyph VM Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry { binding: 0, resource: program_buffer.as_entire_binding() },
                wgpu::BindGroupEntry { binding: 1, resource: state_buffer.as_entire_binding() },
                wgpu::BindGroupEntry { binding: 2, resource: memory_buffer.as_entire_binding() },
                wgpu::BindGroupEntry { binding: 3, resource: stack_buffer.as_entire_binding() },
                wgpu::BindGroupEntry { binding: 4, resource: wgpu::BindingResource::TextureView(&atlas_view) },
                wgpu::BindGroupEntry { binding: 5, resource: wgpu::BindingResource::TextureView(&screen_view) },
            ],
        });

        Self {
            device,
            queue,
            program_buffer,
            state_buffer,
            memory_buffer,
            stack_buffer,
            pipeline,
            bind_group,
            atlas_view,
            screen_view,
        }
    }

    /// Step the VM by executing one cycle (one dispatch)
    pub fn step(&self, encoder: &mut wgpu::CommandEncoder) {
        let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
            label: Some("Glyph VM Step"),
            timestamp_writes: None,
        });
        compute_pass.set_pipeline(&self.pipeline);
        compute_pass.set_bind_group(0, &self.bind_group, &[]);
        compute_pass.dispatch_workgroups(1, 1, 1);
    }

    /// Upload program to GPU
    pub fn upload_program(&self, instructions: &[Glyph]) {
        self.queue.write_buffer(&self.program_buffer, 0, bytemuck::cast_slice(instructions));
    }

    /// Upload memory to GPU
    pub fn upload_memory(&self, memory: &[f32]) {
        self.queue.write_buffer(&self.memory_buffer, 0, bytemuck::cast_slice(memory));
    }

    /// Reset the VM state
    pub fn reset_state(&self) {
        let state = GlyphVMState::default();
        self.queue.write_buffer(&self.state_buffer, 0, bytemuck::bytes_of(&state));
    }

    /// Attest the VM substrate using Hardware VCC
    pub async fn attest(&self, atlas_data: &[u8], contract_hash: (u32, u32)) -> Result<crate::backend::drm::vcc_compute::HardwareVCCResult, String> {
        let vcc = crate::backend::drm::vcc_compute::HardwareVCC::new().await
            .map_err(|e| format!("Failed to init VCC: {}", e))?;
        
        let (width, height) = (2048, 2048); // Standard atlas size
        vcc.verify_atlas(atlas_data, width, height, contract_hash)
            .map_err(|e| format!("VCC verification failed: {}", e))
    }
}
