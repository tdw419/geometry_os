// ============================================
// MEMORY GRAPH RENDERER
// WGPU-based graph visualization for neural memory graphs
// ============================================

use std::sync::Arc;
use wgpu::util::DeviceExt;
use glam::Mat4;
use crate::memory_graph::{MemoryGraph, MemoryNode, NodeType};

/// Instance data for node rendering
#[repr(C)]
#[derive(Copy, Clone, bytemuck::Pod, bytemuck::Zeroable)]
pub struct NodeInstance {
    pub position: [f32; 3],
    pub color: [f32; 3],
    pub scale: f32,
    pub activation: f32,
}

/// Vertex data for edges (lines between nodes)
#[repr(C)]
#[derive(Copy, Clone, bytemuck::Pod, bytemuck::Zeroable)]
pub struct EdgeVertex {
    pub position: [f32; 3],
    pub color: [f32; 3],
}

/// Camera uniform for graph rendering
#[repr(C)]
#[derive(Copy, Clone, bytemuck::Pod, bytemuck::Zeroable)]
pub struct GraphCameraUniform {
    pub view_proj: [[f32; 4]; 4],
    pub camera_pos: [f32; 3],
    pub zoom: f32,
}

/// Selection highlight data
#[repr(C)]
#[derive(Copy, Clone, bytemuck::Pod, bytemuck::Zeroable)]
pub struct SelectionUniform {
    pub selected_node_id: i32,
    pub highlight_color: [f32; 3],
    pub _padding: f32,
}

/// WGPU-based graph rendering pipeline
pub struct GraphRenderer {
    device: Arc<wgpu::Device>,
    queue: Arc<wgpu::Queue>,

    // Node rendering pipeline (instanced)
    node_pipeline: wgpu::RenderPipeline,
    node_vertex_buffer: wgpu::Buffer,
    node_instance_buffer: wgpu::Buffer,
    node_bind_group: wgpu::BindGroup,
    node_bind_group_layout: wgpu::BindGroupLayout,

    // Edge rendering pipeline
    edge_pipeline: wgpu::RenderPipeline,
    edge_vertex_buffer: wgpu::Buffer,
    edge_index_buffer: wgpu::Buffer,
    edge_bind_group: wgpu::BindGroup,
    edge_bind_group_layout: wgpu::BindGroupLayout,

    // Camera and selection uniforms
    camera_buffer: wgpu::Buffer,
    selection_buffer: wgpu::Buffer,

    // Current graph data
    current_graph: Option<MemoryGraph>,
    node_instances: Vec<NodeInstance>,
    edge_vertices: Vec<EdgeVertex>,
    edge_indices: Vec<u32>,

    // Performance tracking
    max_nodes: usize,
    max_edges: usize,
}

impl GraphRenderer {
    /// Create a new graph renderer
    pub fn new(device: Arc<wgpu::Device>, queue: Arc<wgpu::Queue>, surface_format: wgpu::TextureFormat) -> Self {
        // Create bind group layouts
        let node_bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Node Bind Group Layout"),
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
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
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

        let edge_bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Edge Bind Group Layout"),
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

        // Create uniform buffers
        let camera_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Graph Camera Buffer"),
            contents: bytemuck::cast_slice(&[GraphCameraUniform {
                view_proj: Mat4::IDENTITY.to_cols_array_2d(),
                camera_pos: [0.0, 0.0, 0.0],
                zoom: 1.0,
            }]),
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
        });

        let selection_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Selection Buffer"),
            contents: bytemuck::cast_slice(&[SelectionUniform {
                selected_node_id: -1,
                highlight_color: [1.0, 1.0, 0.0],
                _padding: 0.0,
            }]),
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
        });

        // Create bind groups
        let node_bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Node Bind Group"),
            layout: &node_bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: camera_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: selection_buffer.as_entire_binding(),
                },
            ],
        });

        let edge_bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Edge Bind Group"),
            layout: &edge_bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: camera_buffer.as_entire_binding(),
                },
            ],
        });

        // Create shaders
        let node_shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Node Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("shaders/graph_nodes.wgsl").into()),
        });

        let edge_shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Edge Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("shaders/graph_edges.wgsl").into()),
        });

        // Create pipelines
        let node_pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Node Pipeline Layout"),
            bind_group_layouts: &[&node_bind_group_layout],
            push_constant_ranges: &[],
        });

        let node_pipeline = device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Node Pipeline"),
            layout: Some(&node_pipeline_layout),
            vertex: wgpu::VertexState {
                module: &node_shader,
                entry_point: "vs_main",
                buffers: &[
                    // Vertex buffer (quad vertices)
                    wgpu::VertexBufferLayout {
                        array_stride: std::mem::size_of::<[f32; 2]>() as wgpu::BufferAddress,
                        step_mode: wgpu::VertexStepMode::Vertex,
                        attributes: &[
                            wgpu::VertexAttribute {
                                offset: 0,
                                shader_location: 0,
                                format: wgpu::VertexFormat::Float32x2,
                            },
                        ],
                    },
                    // Instance buffer
                    wgpu::VertexBufferLayout {
                        array_stride: std::mem::size_of::<NodeInstance>() as wgpu::BufferAddress,
                        step_mode: wgpu::VertexStepMode::Instance,
                        attributes: &[
                            wgpu::VertexAttribute {
                                offset: 0,
                                shader_location: 1,
                                format: wgpu::VertexFormat::Float32x3,
                            },
                            wgpu::VertexAttribute {
                                offset: std::mem::size_of::<[f32; 3]>() as wgpu::BufferAddress,
                                shader_location: 2,
                                format: wgpu::VertexFormat::Float32x3,
                            },
                            wgpu::VertexAttribute {
                                offset: std::mem::size_of::<[f32; 6]>() as wgpu::BufferAddress,
                                shader_location: 3,
                                format: wgpu::VertexFormat::Float32,
                            },
                            wgpu::VertexAttribute {
                                offset: std::mem::size_of::<[f32; 7]>() as wgpu::BufferAddress,
                                shader_location: 4,
                                format: wgpu::VertexFormat::Float32,
                            },
                        ],
                    },
                ],
            },
            fragment: Some(wgpu::FragmentState {
                module: &node_shader,
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
            multisample: wgpu::MultisampleState::default(),
            multiview: None,
        });

        let edge_pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Edge Pipeline Layout"),
            bind_group_layouts: &[&edge_bind_group_layout],
            push_constant_ranges: &[],
        });

        let edge_pipeline = device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Edge Pipeline"),
            layout: Some(&edge_pipeline_layout),
            vertex: wgpu::VertexState {
                module: &edge_shader,
                entry_point: "vs_main",
                buffers: &[wgpu::VertexBufferLayout {
                    array_stride: std::mem::size_of::<EdgeVertex>() as wgpu::BufferAddress,
                    step_mode: wgpu::VertexStepMode::Vertex,
                    attributes: &[
                        wgpu::VertexAttribute {
                            offset: 0,
                            shader_location: 0,
                            format: wgpu::VertexFormat::Float32x3,
                        },
                        wgpu::VertexAttribute {
                            offset: std::mem::size_of::<[f32; 3]>() as wgpu::BufferAddress,
                            shader_location: 1,
                            format: wgpu::VertexFormat::Float32x3,
                        },
                    ],
                }],
            },
            fragment: Some(wgpu::FragmentState {
                module: &edge_shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format: surface_format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: wgpu::PrimitiveState {
                topology: wgpu::PrimitiveTopology::LineList,
                strip_index_format: None,
                front_face: wgpu::FrontFace::Ccw,
                cull_mode: None,
                polygon_mode: wgpu::PolygonMode::Fill,
                unclipped_depth: false,
                conservative: false,
            },
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            multiview: None,
        });

        // Create vertex buffers (initially empty, will be resized as needed)
        let node_vertex_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Node Vertex Buffer"),
            contents: bytemuck::cast_slice(&[
                [-0.5f32, -0.5f32], // Bottom-left
                [0.5f32, -0.5f32],  // Bottom-right
                [-0.5f32, 0.5f32],  // Top-left
                [0.5f32, 0.5f32],   // Top-right
            ]),
            usage: wgpu::BufferUsages::VERTEX,
        });

        let node_instance_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Node Instance Buffer"),
            size: 1024 * std::mem::size_of::<NodeInstance>() as u64, // Initial capacity for 1024 nodes
            usage: wgpu::BufferUsages::VERTEX | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let edge_vertex_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Edge Vertex Buffer"),
            size: 2048 * std::mem::size_of::<EdgeVertex>() as u64, // Initial capacity for 2048 vertices
            usage: wgpu::BufferUsages::VERTEX | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let edge_index_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Edge Index Buffer"),
            size: 4096 * std::mem::size_of::<u32>() as u64, // Initial capacity for 4096 indices
            usage: wgpu::BufferUsages::INDEX | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        Self {
            device,
            queue,
            node_pipeline,
            node_vertex_buffer,
            node_instance_buffer,
            node_bind_group,
            node_bind_group_layout,
            edge_pipeline,
            edge_vertex_buffer,
            edge_index_buffer,
            edge_bind_group,
            edge_bind_group_layout,
            camera_buffer,
            selection_buffer,
            current_graph: None,
            node_instances: Vec::new(),
            edge_vertices: Vec::new(),
            edge_indices: Vec::new(),
            max_nodes: 1024,
            max_edges: 2048,
        }
    }

    /// Update the graph data for rendering
    pub fn update_graph(&mut self, graph: &MemoryGraph) {
        self.current_graph = Some(graph.clone());
        self.update_node_instances(graph);
        self.update_edge_data(graph);
    }

    /// Update node instance data from graph
    fn update_node_instances(&mut self, graph: &MemoryGraph) {
        self.node_instances.clear();

        for (id, node) in &graph.nodes {
            let color = self.node_type_to_color(&node.node_type);
            let scale = 0.1 + node.activation * 0.2; // Scale based on activation

            self.node_instances.push(NodeInstance {
                position: node.position,
                color,
                scale,
                activation: node.activation,
            });
        }

        // Resize buffer if needed
        let required_size = self.node_instances.len() * std::mem::size_of::<NodeInstance>();
        if required_size > self.max_nodes * std::mem::size_of::<NodeInstance>() {
            self.max_nodes = (required_size / std::mem::size_of::<NodeInstance>()).next_power_of_two();
            self.node_instance_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
                label: Some("Node Instance Buffer (Resized)"),
                size: (self.max_nodes * std::mem::size_of::<NodeInstance>()) as u64,
                usage: wgpu::BufferUsages::VERTEX | wgpu::BufferUsages::COPY_DST,
                mapped_at_creation: false,
            });
        }

        // Update buffer
        self.queue.write_buffer(
            &self.node_instance_buffer,
            0,
            bytemuck::cast_slice(&self.node_instances),
        );
    }

    /// Update edge vertex and index data from graph
    fn update_edge_data(&mut self, graph: &MemoryGraph) {
        self.edge_vertices.clear();
        self.edge_indices.clear();

        for edge in &graph.edges {
            if let (Some(from_node), Some(to_node)) = (
                graph.nodes.get(&edge.from),
                graph.nodes.get(&edge.to),
            ) {
                let from_pos = from_node.position;
                let to_pos = to_node.position;

                let start_idx = self.edge_vertices.len() as u32;
                self.edge_vertices.push(EdgeVertex {
                    position: from_pos,
                    color: [0.7, 0.7, 0.7], // Default edge color
                });
                self.edge_vertices.push(EdgeVertex {
                    position: to_pos,
                    color: [0.7, 0.7, 0.7],
                });

                self.edge_indices.push(start_idx);
                self.edge_indices.push(start_idx + 1);
            }
        }

        // Resize buffers if needed
        let vertex_size = self.edge_vertices.len() * std::mem::size_of::<EdgeVertex>();
        if vertex_size > self.max_edges * std::mem::size_of::<EdgeVertex>() {
            self.max_edges = (vertex_size / std::mem::size_of::<EdgeVertex>()).next_power_of_two();
            self.edge_vertex_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
                label: Some("Edge Vertex Buffer (Resized)"),
                size: (self.max_edges * std::mem::size_of::<EdgeVertex>()) as u64,
                usage: wgpu::BufferUsages::VERTEX | wgpu::BufferUsages::COPY_DST,
                mapped_at_creation: false,
            });
        }

        let index_size = self.edge_indices.len() * std::mem::size_of::<u32>();
        let max_indices = self.max_edges * 2; // 2 indices per edge
        if index_size > max_indices * std::mem::size_of::<u32>() {
            let new_max_indices = (index_size / std::mem::size_of::<u32>()).next_power_of_two();
            self.edge_index_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
                label: Some("Edge Index Buffer (Resized)"),
                size: (new_max_indices * std::mem::size_of::<u32>()) as u64,
                usage: wgpu::BufferUsages::INDEX | wgpu::BufferUsages::COPY_DST,
                mapped_at_creation: false,
            });
        }

        // Update buffers
        self.queue.write_buffer(
            &self.edge_vertex_buffer,
            0,
            bytemuck::cast_slice(&self.edge_vertices),
        );
        self.queue.write_buffer(
            &self.edge_index_buffer,
            0,
            bytemuck::cast_slice(&self.edge_indices),
        );
    }

    /// Convert node type to color
    fn node_type_to_color(&self, node_type: &NodeType) -> [f32; 3] {
        match node_type {
            NodeType::Neuron => [0.2, 0.8, 0.2],    // Green
            NodeType::Synapse => [0.8, 0.2, 0.8],   // Magenta
            NodeType::Memory => [0.2, 0.2, 0.8],    // Blue
            NodeType::Input => [0.8, 0.8, 0.2],     // Yellow
            NodeType::Output => [0.8, 0.2, 0.2],    // Red
        }
    }

    /// Update camera transform
    pub fn update_camera(&mut self, view_proj: Mat4, camera_pos: [f32; 3], zoom: f32) {
        let uniform = GraphCameraUniform {
            view_proj: view_proj.to_cols_array_2d(),
            camera_pos,
            zoom,
        };

        self.queue.write_buffer(
            &self.camera_buffer,
            0,
            bytemuck::cast_slice(&[uniform]),
        );
    }

    /// Set selected node for highlighting
    pub fn set_selected_node(&mut self, node_id: Option<&str>) {
        let selected_id = if let Some(id) = node_id {
            // Find the index of the selected node
            if let Some(graph) = &self.current_graph {
                graph.nodes.keys().position(|k| k == id).unwrap_or(0) as i32
            } else {
                -1
            }
        } else {
            -1
        };

        let uniform = SelectionUniform {
            selected_node_id: selected_id,
            highlight_color: [1.0, 1.0, 0.0], // Yellow highlight
            _padding: 0.0,
        };

        self.queue.write_buffer(
            &self.selection_buffer,
            0,
            bytemuck::cast_slice(&[uniform]),
        );
    }

    /// Render the graph to the given render pass
    pub fn render<'a>(&'a self, render_pass: &mut wgpu::RenderPass<'a>) {
        // Render edges first (behind nodes)
        render_pass.set_pipeline(&self.edge_pipeline);
        render_pass.set_bind_group(0, &self.edge_bind_group, &[]);
        render_pass.set_vertex_buffer(0, self.edge_vertex_buffer.slice(..));
        render_pass.set_index_buffer(self.edge_index_buffer.slice(..), wgpu::IndexFormat::Uint32);

        if !self.edge_indices.is_empty() {
            render_pass.draw_indexed(0..self.edge_indices.len() as u32, 0, 0..1);
        }

        // Render nodes (instanced)
        render_pass.set_pipeline(&self.node_pipeline);
        render_pass.set_bind_group(0, &self.node_bind_group, &[]);
        render_pass.set_vertex_buffer(0, self.node_vertex_buffer.slice(..));
        render_pass.set_vertex_buffer(1, self.node_instance_buffer.slice(..));

        if !self.node_instances.is_empty() {
            render_pass.draw(0..4, 0..self.node_instances.len() as u32); // 4 vertices per quad, instanced
        }
    }

    /// Get the number of nodes currently being rendered
    pub fn node_count(&self) -> usize {
        self.node_instances.len()
    }

    /// Get the number of edges currently being rendered
    pub fn edge_count(&self) -> usize {
        self.edge_indices.len() / 2
    }
}