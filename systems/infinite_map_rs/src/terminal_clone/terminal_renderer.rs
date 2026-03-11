use wgpu::util::DeviceExt;

#[repr(C)]
#[derive(Copy, Clone, Debug, bytemuck::Pod, bytemuck::Zeroable)]
pub struct TerminalUniforms {
    pub rows: u32,
    pub cols: u32,
    pub cursor_x: u32,
    pub cursor_y: u32,
    pub cursor_visible: u32,
    pub time: f32,
    pub _padding: [f32; 2],
}

pub struct TerminalRenderer {
    pub compute_pipeline: wgpu::ComputePipeline,
    pub bind_group_layout: wgpu::BindGroupLayout,
    pub font_atlas_buffer: wgpu::Buffer,
}

impl TerminalRenderer {
    pub fn new(device: &wgpu::Device) -> Self {
        // 1. Load Shader
        let shader =
            device.create_shader_module(wgpu::include_wgsl!("../shaders/terminal_renderer.wgsl"));

        // 2. Bind Group Layout
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Terminal Renderer Bind Group Layout"),
            entries: &[
                // Uniforms
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Terminal RAM Texture (Input)
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Texture {
                        sample_type: wgpu::TextureSampleType::Uint,
                        view_dimension: wgpu::TextureViewDimension::D2,
                        multisampled: false,
                    },
                    count: None,
                },
                // Font Atlas (Input)
                wgpu::BindGroupLayoutEntry {
                    binding: 2,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Storage { read_only: true },
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
                // Output Texture
                wgpu::BindGroupLayoutEntry {
                    binding: 3,
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
            label: Some("Terminal Renderer Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        let compute_pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Terminal Renderer Compute Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader,
            entry_point: "main",
        });

        // 3. Create Font Atlas Buffer
        let mut font_data = Vec::with_capacity(95 * 16);
        for i in 0..95 {
            let char_data = crate::font_bitmap::FONT_8X16[i];
            for row in char_data.iter() {
                font_data.push(*row as u32);
            }
        }

        let font_atlas_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Terminal Font Atlas Buffer"),
            contents: bytemuck::cast_slice(&font_data),
            usage: wgpu::BufferUsages::STORAGE,
        });

        Self {
            compute_pipeline,
            bind_group_layout,
            font_atlas_buffer,
        }
    }

    #[allow(clippy::too_many_arguments)]
    pub fn render(
        &self,
        device: &wgpu::Device,
        encoder: &mut wgpu::CommandEncoder,
        output_texture_view: &wgpu::TextureView,
        rows: u32,
        cols: u32,
        terminal_ram_view: &wgpu::TextureView,
        cursor_x: u32,
        cursor_y: u32,
        time: f32,
    ) {
        // Create Uniform Buffer
        let uniforms = TerminalUniforms {
            rows,
            cols,
            cursor_x,
            cursor_y,
            cursor_visible: 1,
            time,
            _padding: [0.0; 2],
        };

        let uniform_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Terminal Uniform Buffer"),
            contents: bytemuck::cast_slice(&[uniforms]),
            usage: wgpu::BufferUsages::UNIFORM,
        });

        // Create Bind Group
        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Terminal Renderer Bind Group"),
            layout: &self.bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: uniform_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::TextureView(terminal_ram_view),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: self.font_atlas_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 3,
                    resource: wgpu::BindingResource::TextureView(output_texture_view),
                },
            ],
        });

        // Dispatch Compute
        {
            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some("Terminal Render Pass"),
                timestamp_writes: None,
            });
            compute_pass.set_pipeline(&self.compute_pipeline);
            compute_pass.set_bind_group(0, &bind_group, &[]);

            let workgroup_x = (cols * 8 + 15) / 16;
            let workgroup_y = (rows * 16 + 15) / 16;
            compute_pass.dispatch_workgroups(workgroup_x as u32, workgroup_y as u32, 1);
        }
    }
}
