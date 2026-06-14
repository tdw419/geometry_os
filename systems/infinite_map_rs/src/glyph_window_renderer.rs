//! Glyph Window Renderer
//!
//! Renders the visual representation of executing Glyph VMs as windows.
//! Each VM is displayed as a colored window with:
//! - Border indicating VM state (running/halted/waiting)
//! - Current instruction display
//! - Register visualization

use wgpu::util::DeviceExt;

/// Vertex for window quads
#[repr(C)]
#[derive(Copy, Clone, Debug, bytemuck::Pod, bytemuck::Zeroable)]
pub struct WindowVertex {
    pub position: [f32; 2],
    pub tex_coords: [f32; 2],
}

/// Instance data for each window
#[repr(C)]
#[derive(Copy, Clone, Debug, bytemuck::Pod, bytemuck::Zeroable)]
pub struct WindowInstance {
    pub window_pos: [f32; 2],  // x, y
    pub window_size: [f32; 2], // width, height
    pub border_color: [f32; 4], // RGBA
    pub vm_id: u32,
    pub state: u32, // 0=inactive, 1=running, 2=halted, 3=waiting
}

/// Renders glyph VM windows
pub struct GlyphWindowRenderer {
    pipeline: wgpu::RenderPipeline,
    vertex_buffer: wgpu::Buffer,
    instance_buffer: wgpu::Buffer,
    bind_group: wgpu::BindGroup,
    max_windows: usize,
}

impl GlyphWindowRenderer {
    pub fn new(
        device: &wgpu::Device,
        surface_format: wgpu::TextureFormat,
    ) -> Self {
        let shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Glyph Window Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("shaders/glyph_windows.wgsl").into()),
        });

        // Create bind group layout for uniforms (screen size, etc.)
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Glyph Window Bind Group Layout"),
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::VERTEX,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        // Create uniform buffer for screen dimensions
        let uniform_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Glyph Window Uniform Buffer"),
            contents: bytemuck::cast_slice(&[1920.0f32, 1080.0f32, 0.0, 0.0]),
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
        });

        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Glyph Window Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: uniform_buffer.as_entire_binding(),
                },
            ],
        });

        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Glyph Window Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        // Create vertex buffer for a unit quad
        let vertices: &[WindowVertex] = &[
            WindowVertex { position: [0.0, 0.0], tex_coords: [0.0, 0.0] },
            WindowVertex { position: [1.0, 0.0], tex_coords: [1.0, 0.0] },
            WindowVertex { position: [0.0, 1.0], tex_coords: [0.0, 1.0] },
            WindowVertex { position: [1.0, 1.0], tex_coords: [1.0, 1.0] },
        ];

        let vertex_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Glyph Window Vertex Buffer"),
            contents: bytemuck::cast_slice(vertices),
            usage: wgpu::BufferUsages::VERTEX,
        });

        // Create instance buffer for up to 8 windows
        let max_windows = 8;
        let instance_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Glyph Window Instance Buffer"),
            size: (max_windows * std::mem::size_of::<WindowInstance>()) as u64,
            usage: wgpu::BufferUsages::VERTEX | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let pipeline = device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Glyph Window Render Pipeline"),
            layout: Some(&pipeline_layout),
            vertex: wgpu::VertexState {
                module: &shader,
                entry_point: "vs_main",
                buffers: &[
                    wgpu::VertexBufferLayout {
                        array_stride: std::mem::size_of::<WindowVertex>() as wgpu::BufferAddress,
                        step_mode: wgpu::VertexStepMode::Vertex,
                        attributes: &wgpu::vertex_attr_array![0 => Float32x2, 1 => Float32x2],
                    },
                    wgpu::VertexBufferLayout {
                        array_stride: std::mem::size_of::<WindowInstance>() as wgpu::BufferAddress,
                        step_mode: wgpu::VertexStepMode::Instance,
                        attributes: &wgpu::vertex_attr_array![
                            2 => Float32x2,  // window_pos
                            3 => Float32x2,  // window_size
                            4 => Float32x4,  // border_color
                            5 => Uint32,     // vm_id
                            6 => Uint32,     // state
                        ],
                    },
                ],
            },
            fragment: Some(wgpu::FragmentState {
                module: &shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format: surface_format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: wgpu::PrimitiveState {
                topology: wgpu::PrimitiveTopology::TriangleStrip,
                strip_index_format: None,
                front_face: wgpu::FrontFace::Ccw,
                cull_mode: None,
                polygon_mode: wgpu::PolygonMode::Fill,
                unclipped_depth: false,
                conservative: false,
            },
            depth_stencil: None,
            multisample: wgpu::MultisampleState {
                count: 1,
                mask: !0,
                alpha_to_coverage_enabled: false,
            },
            multiview: None,
        });

        Self {
            pipeline,
            vertex_buffer,
            instance_buffer,
            bind_group,
            max_windows,
        }
    }

    /// Update window instances from VM state
    pub fn update_windows(
        &self,
        queue: &wgpu::Queue,
        windows: &[WindowInstance],
    ) {
        let instances: Vec<WindowInstance> = windows
            .iter()
            .take(self.max_windows)
            .cloned()
            .collect();

        // Pad to max_windows if needed
        let mut padded = instances;
        while padded.len() < self.max_windows {
            padded.push(WindowInstance {
                window_pos: [0.0, 0.0],
                window_size: [0.0, 0.0],
                border_color: [0.0, 0.0, 0.0, 0.0],
                vm_id: 0xFF,
                state: 0,
            });
        }

        queue.write_buffer(&self.instance_buffer, 0, bytemuck::cast_slice(&padded));
    }

    /// Update screen dimensions
    pub fn update_screen_size(&self, queue: &wgpu::Queue, width: f32, height: f32) {
        let uniforms: [f32; 4] = [width, height, 0.0, 0.0];
        // Note: We need access to the uniform buffer to update it
        // For now, this is a placeholder
        let _ = (queue, uniforms);
    }

    /// Render the windows
    pub fn render<'a>(
        &'a self,
        render_pass: &mut wgpu::RenderPass<'a>,
        instance_count: u32,
    ) {
        render_pass.set_pipeline(&self.pipeline);
        render_pass.set_bind_group(0, &self.bind_group, &[]);
        render_pass.set_vertex_buffer(0, self.vertex_buffer.slice(..));
        render_pass.set_vertex_buffer(1, self.instance_buffer.slice(..));
        render_pass.draw(0..4, 0..instance_count);
    }
}

/// Get color for VM state
pub fn get_state_color(state: u32) -> [f32; 4] {
    match state {
        0 => [0.3, 0.3, 0.3, 0.8], // Inactive - gray
        1 => [0.2, 0.8, 0.2, 0.9], // Running - green
        2 => [0.8, 0.2, 0.2, 0.9], // Halted - red
        3 => [0.8, 0.8, 0.2, 0.9], // Waiting - yellow
        _ => [0.5, 0.5, 0.5, 0.8], // Unknown - gray
    }
}
