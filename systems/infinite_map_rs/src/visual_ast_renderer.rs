use wgpu::util::DeviceExt;
use std::sync::Arc;
use crate::visual_ast::{VisualAST, VisualNode};

#[repr(C)]
#[derive(Copy, Clone, Debug, bytemuck::Pod, bytemuck::Zeroable)]
pub struct VisualNodeInstance {
    pub world_pos: [f32; 2],
    pub size: [f32; 2],
    pub color: [f32; 4],
    pub border_color: [f32; 4],
    pub glow: f32,
}

#[repr(C)]
#[derive(Copy, Clone, Debug, bytemuck::Pod, bytemuck::Zeroable)]
pub struct VisualNodeVertex {
    pub position: [f32; 2],
}

pub struct VisualASTRenderer {
    pipeline: wgpu::RenderPipeline,
    vertex_buffer: wgpu::Buffer,
    instance_buffer: wgpu::Buffer,
    bind_group: wgpu::BindGroup,
    pub max_instances: usize,
    pub instance_count: u32,
}

impl VisualASTRenderer {
    pub fn new(
        device: &wgpu::Device,
        surface_format: wgpu::TextureFormat,
        uniform_buffer: &wgpu::Buffer,
    ) -> Self {
        let shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Visual AST Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("shaders/visual_ast.wgsl").into()),
        });

        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Visual AST BGL"),
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::VERTEX | wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Visual AST Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: uniform_buffer.as_entire_binding(),
                },
            ],
        });

        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Visual AST Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        let pipeline = device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Visual AST Pipeline"),
            layout: Some(&pipeline_layout),
            vertex: wgpu::VertexState {
                module: &shader,
                entry_point: "vs_main",
                buffers: &[
                    // Vertex Buffer
                    wgpu::VertexBufferLayout {
                        array_stride: std::mem::size_of::<VisualNodeVertex>() as wgpu::BufferAddress,
                        step_mode: wgpu::VertexStepMode::Vertex,
                        attributes: &[
                            wgpu::VertexAttribute {
                                offset: 0,
                                shader_location: 0, // position
                                format: wgpu::VertexFormat::Float32x2,
                            },
                        ],
                    },
                    // Instance Buffer
                    wgpu::VertexBufferLayout {
                        array_stride: std::mem::size_of::<VisualNodeInstance>() as wgpu::BufferAddress,
                        step_mode: wgpu::VertexStepMode::Instance,
                        attributes: &[
                            wgpu::VertexAttribute {
                                offset: 0,
                                shader_location: 1, // pos
                                format: wgpu::VertexFormat::Float32x2,
                            },
                            wgpu::VertexAttribute {
                                offset: 8,
                                shader_location: 2, // size
                                format: wgpu::VertexFormat::Float32x2,
                            },
                            wgpu::VertexAttribute {
                                offset: 16,
                                shader_location: 3, // color
                                format: wgpu::VertexFormat::Float32x4,
                            },
                            wgpu::VertexAttribute {
                                offset: 32,
                                shader_location: 4, // border_color
                                format: wgpu::VertexFormat::Float32x4,
                            },
                            wgpu::VertexAttribute {
                                offset: 48,
                                shader_location: 5, // glow
                                format: wgpu::VertexFormat::Float32,
                            },
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
                topology: wgpu::PrimitiveTopology::TriangleList,
                ..Default::default()
            },
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            multiview: None,
        });

        // 0.5 centered quad
        let vertices = [
            VisualNodeVertex { position: [-0.5, -0.5] },
            VisualNodeVertex { position: [0.5, -0.5] },
            VisualNodeVertex { position: [-0.5, 0.5] },
            VisualNodeVertex { position: [-0.5, 0.5] },
            VisualNodeVertex { position: [0.5, -0.5] },
            VisualNodeVertex { position: [0.5, 0.5] },
        ];

        let vertex_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Visual AST Vertex Buffer"),
            contents: bytemuck::cast_slice(&vertices),
            usage: wgpu::BufferUsages::VERTEX,
        });

        let max_instances = 10000;
        let instance_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Visual AST Instance Buffer"),
            size: (max_instances * std::mem::size_of::<VisualNodeInstance>()) as u64,
            usage: wgpu::BufferUsages::VERTEX | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        Self {
            pipeline,
            vertex_buffer,
            instance_buffer,
            bind_group,
            max_instances,
            instance_count: 0,
        }
    }

    pub fn update(&mut self, queue: &wgpu::Queue, ast: &VisualAST) {
        let mut instances = Vec::new();

        // Collect all nodes
        // TODO: Optimization - View culling or spatial query
        for node in ast.nodes.values() {
            instances.push(VisualNodeInstance {
                world_pos: [node.x + node.width/2.0, node.y + node.height/2.0], // Center align for shader
                size: [node.width, node.height],
                color: [
                    node.style.background_color.0,
                    node.style.background_color.1,
                    node.style.background_color.2,
                    node.style.background_color.3,
                ],
                border_color: [
                    node.style.border_color.0,
                    node.style.border_color.1,
                    node.style.border_color.2,
                    node.style.border_color.3,
                ],
                glow: if node.health.score < 1.0 { 1.0 } else { node.style.glow_intensity },
            });
            
            // Limit for safety
            if instances.len() >= self.max_instances {
                break;
            }
        }

        self.instance_count = instances.len() as u32;
        if self.instance_count > 0 {
            queue.write_buffer(
                &self.instance_buffer, 
                0, 
                bytemuck::cast_slice(&instances)
            );
        }
    }

    pub fn render<'rp>(&'rp self, render_pass: &mut wgpu::RenderPass<'rp>) {
        if self.instance_count == 0 { return; }
        
        render_pass.set_pipeline(&self.pipeline);
        render_pass.set_bind_group(0, &self.bind_group, &[]);
        render_pass.set_vertex_buffer(0, self.vertex_buffer.slice(..));
        render_pass.set_vertex_buffer(1, self.instance_buffer.slice(..));
        render_pass.draw(0..6, 0..self.instance_count);
    }
}
