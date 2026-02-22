//! PixelRTS v3 Geometric VM - GPU-Native Execution
//!
//! Manages the execution of geometric programs on the GPU via
//! geometric_programming.wgsl.

use std::sync::Arc;
use wgpu;
use bytemuck::{Pod, Zeroable};

/// Geometric VM State (matches WGSL struct)
#[repr(C)]
#[derive(Copy, Clone, Debug, Pod, Zeroable)]
pub struct GeometricState {
    pub regs: [u32; 32],
    pub pc: u32,
    pub halted: u32,
    pub flags: u32,
    pub cursor_x: u32,
    pub cursor_y: u32,
    pub fg: u32,
    pub bg: u32,
}

impl Default for GeometricState {
    fn default() -> Self {
        Self {
            regs: [0; 32],
            pc: 0,
            halted: 0,
            flags: 0,
            cursor_x: 0,
            cursor_y: 0,
            fg: 7, // Default white
            bg: 0, // Default black
        }
    }
}

pub struct GeometricVM {
    pub device: Arc<wgpu::Device>,
    pub queue: Arc<wgpu::Queue>,
    pub ram_texture: wgpu::Texture,
    pub state_buffer: wgpu::Buffer,
    pub pipeline: wgpu::ComputePipeline,
    pub bind_group: wgpu::BindGroup,
    pub grid_size: u32,
}

impl GeometricVM {
    pub fn new(device: Arc<wgpu::Device>, queue: Arc<wgpu::Queue>, grid_size: u32) -> Self {
        // 1. Create RAM Texture (Storage)
        let texture_desc = wgpu::TextureDescriptor {
            label: Some("Geometric RAM Texture"),
            size: wgpu::Extent3d {
                width: grid_size,
                height: grid_size,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Uint,
            usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::COPY_SRC,
            view_formats: &[],
        };
        let ram_texture = device.create_texture(&texture_desc);
        let ram_view = ram_texture.create_view(&wgpu::TextureViewDescriptor::default());

        // 2. Create State Buffer
        let state_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Geometric State Buffer"),
            size: std::mem::size_of::<GeometricState>() as u64,
            usage: wgpu::BufferUsages::STORAGE | wgpu::BufferUsages::COPY_SRC | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // 3. Load Shader
        let shader = device.create_shader_module(wgpu::include_wgsl!("../shaders/geometric_programming.wgsl"));

        // 4. Create Pipeline
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Geometric VM Layout"),
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::StorageTexture {
                        access: wgpu::StorageTextureAccess::ReadWrite,
                        format: wgpu::TextureFormat::Rgba8Uint,
                        view_dimension: wgpu::TextureViewDimension::D2,
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: false },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Geometric VM Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        let pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Geometric VM Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader,
            entry_point: "main",
        });

        // 5. Create Bind Group
        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Geometric VM Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: wgpu::BindingResource::TextureView(&ram_view),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: state_buffer.as_entire_binding(),
                },
            ],
        });

        Self {
            device,
            queue,
            ram_texture,
            state_buffer,
            pipeline,
            bind_group,
            grid_size,
        }
    }

    /// Step the VM by executing a batch of instructions
    pub fn step(&self, encoder: &mut wgpu::CommandEncoder, iterations: u32) {
        for _ in 0..iterations {
            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("Geometric VM Step"),
                timestamp_writes: None,
            });
            compute_pass.set_pipeline(&self.pipeline);
            compute_pass.set_bind_group(0, &self.bind_group, &[]);
            compute_pass.dispatch_workgroups(1, 1, 1);
        }
    }

    /// Upload program to RAM texture
    pub fn upload_program(&self, pixels: &[[u8; 4]]) {
        let size = wgpu::Extent3d {
            width: self.grid_size,
            height: self.grid_size,
            depth_or_array_layers: 1,
        };

        let mut data = vec![0u8; (self.grid_size * self.grid_size * 4) as usize];
        for (i, pixel) in pixels.iter().enumerate() {
            if i < (self.grid_size * self.grid_size) as usize {
                // Hilbert mapping would happen here on CPU if needed,
                // but we assume pixels are already mapped or we'll map them during upload.
                // For now, let's just do linear for simplicity in this prototype.
                data[i * 4] = pixel[0];
                data[i * 4 + 1] = pixel[1];
                data[i * 4 + 2] = pixel[2];
                data[i * 4 + 3] = pixel[3];
            }
        }

        self.queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: &self.ram_texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            &data,
            wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(4 * self.grid_size),
                rows_per_image: Some(self.grid_size),
            },
            size,
        );
    }

    /// Reset the VM state
    pub fn reset_state(&self) {
        let state = GeometricState::default();
        self.queue.write_buffer(&self.state_buffer, 0, bytemuck::bytes_of(&state));
    }
}
