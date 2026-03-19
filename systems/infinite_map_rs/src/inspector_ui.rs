// ============================================
// MEMORY GRAPH INSPECTOR UI
// Interactive controls and UI components for neural memory graph visualization
// ============================================

use crate::evolution_protocol::{MemoryGraphProtocol, Message};
use crate::glyph_atlas::GlyphAtlas;
use crate::graph_renderer::GraphRenderer;
use crate::memory_graph::{MemoryGraph, MemoryNode};
use bytemuck::{Pod, Zeroable};
use glam::{Mat4, Vec2, Vec3};
use smithay::backend::input::ButtonState;
use std::collections::HashSet;
use std::sync::Arc;
use wgpu;

/// UI vertex for rendering panel rectangles
#[repr(C)]
#[derive(Debug, Clone, Copy, Pod, Zeroable)]
pub struct UIVertex {
    /// Position in screen space (x, y, z)
    pub position: [f32; 3],
    /// Color (r, g, b, a)
    pub color: [f32; 4],
}

impl UIVertex {
    pub fn new(x: f32, y: f32, z: f32, color: [f32; 4]) -> Self {
        Self {
            position: [x, y, z],
            color,
        }
    }
}

/// Vertex buffer layout descriptor for UIVertex
pub fn ui_vertex_layout() -> wgpu::VertexBufferLayout<'static> {
    wgpu::VertexBufferLayout {
        array_stride: std::mem::size_of::<UIVertex>() as wgpu::BufferAddress,
        step_mode: wgpu::VertexStepMode::Vertex,
        attributes: &[
            // position: vec3<f32>
            wgpu::VertexAttribute {
                offset: 0,
                shader_location: 0,
                format: wgpu::VertexFormat::Float32x3,
            },
            // color: vec4<f32>
            wgpu::VertexAttribute {
                offset: std::mem::size_of::<[f32; 3]>() as wgpu::BufferAddress,
                shader_location: 1,
                format: wgpu::VertexFormat::Float32x4,
            },
        ],
    }
}

/// Camera controller for graph navigation
#[derive(Debug, Clone)]
pub struct GraphCamera {
    pub position: Vec3,
    pub target: Vec3,
    pub up: Vec3,
    pub zoom: f32,
    pub near: f32,
    pub far: f32,
    pub fov: f32,
    pub aspect_ratio: f32,
}

impl Default for GraphCamera {
    fn default() -> Self {
        Self {
            position: Vec3::new(0.0, 0.0, 10.0),
            target: Vec3::ZERO,
            up: Vec3::Y,
            zoom: 1.0,
            near: 0.1,
            far: 1000.0,
            fov: 45.0_f32.to_radians(),
            aspect_ratio: 16.0 / 9.0,
        }
    }
}

impl GraphCamera {
    /// Get view matrix
    pub fn view_matrix(&self) -> Mat4 {
        Mat4::look_at_rh(self.position, self.target, self.up)
    }

    /// Get projection matrix
    pub fn projection_matrix(&self) -> Mat4 {
        Mat4::perspective_rh(self.fov, self.aspect_ratio, self.near, self.far)
    }

    /// Get view-projection matrix
    pub fn view_proj_matrix(&self) -> Mat4 {
        self.projection_matrix() * self.view_matrix()
    }

    /// Zoom camera
    pub fn zoom(&mut self, delta: f32) {
        self.zoom = (self.zoom * (1.0 + delta)).clamp(0.1, 10.0);
        self.update_position();
    }

    /// Pan camera
    pub fn pan(&mut self, delta: Vec2) {
        let right = (self.target - self.position).cross(self.up).normalize();
        let up = self.up;
        self.position += right * delta.x * 0.01 + up * delta.y * 0.01;
        self.target += right * delta.x * 0.01 + up * delta.y * 0.01;
    }

    /// Update camera position based on zoom
    fn update_position(&mut self) {
        let direction = (self.target - self.position).normalize();
        self.position = self.target - direction * (10.0 / self.zoom);
    }
}

/// Node selection manager
#[derive(Debug, Clone)]
pub struct NodeSelectionManager {
    pub selected_nodes: HashSet<String>,
    pub hovered_node: Option<String>,
    pub selection_mode: SelectionMode,
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum SelectionMode {
    Single,
    Multi,
    Rectangle,
}

impl Default for NodeSelectionManager {
    fn default() -> Self {
        Self {
            selected_nodes: HashSet::new(),
            hovered_node: None,
            selection_mode: SelectionMode::Single,
        }
    }
}

impl NodeSelectionManager {
    /// Select a single node
    pub fn select_node(&mut self, node_id: String) {
        self.selected_nodes.clear();
        self.selected_nodes.insert(node_id);
    }

    /// Toggle node selection
    pub fn toggle_node(&mut self, node_id: String) {
        if self.selected_nodes.contains(&node_id) {
            self.selected_nodes.remove(&node_id);
        } else {
            self.selected_nodes.insert(node_id);
        }
    }

    /// Clear selection
    pub fn clear_selection(&mut self) {
        self.selected_nodes.clear();
    }

    /// Check if node is selected
    pub fn is_selected(&self, node_id: &str) -> bool {
        self.selected_nodes.contains(node_id)
    }
}

/// Zoom controller
#[derive(Debug, Clone)]
pub struct ZoomController {
    pub min_zoom: f32,
    pub max_zoom: f32,
    pub zoom_speed: f32,
}

impl Default for ZoomController {
    fn default() -> Self {
        Self {
            min_zoom: 0.1,
            max_zoom: 10.0,
            zoom_speed: 0.1,
        }
    }
}

/// Pan controller
#[derive(Debug, Clone)]
pub struct PanController {
    pub pan_speed: f32,
    pub is_panning: bool,
    pub last_mouse_pos: Option<Vec2>,
}

impl Default for PanController {
    fn default() -> Self {
        Self {
            pan_speed: 1.0,
            is_panning: false,
            last_mouse_pos: None,
        }
    }
}

/// Interactive controls for graph navigation and selection
pub struct GraphControls {
    pub camera: GraphCamera,
    pub selection_manager: NodeSelectionManager,
    pub zoom_controller: ZoomController,
    pub pan_controller: PanController,
    pub graph_renderer: Arc<GraphRenderer>,
}

impl GraphControls {
    pub fn new(graph_renderer: Arc<GraphRenderer>) -> Self {
        Self {
            camera: GraphCamera::default(),
            selection_manager: NodeSelectionManager::default(),
            zoom_controller: ZoomController::default(),
            pan_controller: PanController::default(),
            graph_renderer,
        }
    }

    /// Handle mouse wheel zoom
    pub fn handle_zoom(&mut self, delta: f32) {
        let zoom_delta = delta * self.zoom_controller.zoom_speed;
        self.camera.zoom(zoom_delta);
        self.update_renderer_camera();
    }

    /// Handle mouse pan
    pub fn handle_pan(&mut self, mouse_pos: Vec2, button_state: ButtonState) {
        match button_state {
            ButtonState::Pressed => {
                if !self.pan_controller.is_panning {
                    self.pan_controller.is_panning = true;
                    self.pan_controller.last_mouse_pos = Some(mouse_pos);
                }
            },
            ButtonState::Released => {
                self.pan_controller.is_panning = false;
                self.pan_controller.last_mouse_pos = None;
            },
        }

        if self.pan_controller.is_panning {
            if let Some(last_pos) = self.pan_controller.last_mouse_pos {
                let delta = mouse_pos - last_pos;
                self.camera.pan(delta);
                self.pan_controller.last_mouse_pos = Some(mouse_pos);
                self.update_renderer_camera();
            }
        }
    }

    /// Handle node selection
    pub fn handle_selection(&mut self, mouse_pos: Vec2, graph: &MemoryGraph) {
        // Convert screen coordinates to world coordinates
        let world_pos = self.screen_to_world(mouse_pos);

        // Find closest node
        let mut closest_node: Option<(&String, &MemoryNode, f32)> = None;
        for (id, node) in &graph.nodes {
            let node_pos = Vec3::from(node.position);
            let distance = (node_pos - world_pos).length();
            if distance < 1.0 {
                // Selection threshold
                match closest_node {
                    Some((_, _, min_dist)) if distance < min_dist => {
                        closest_node = Some((id, node, distance));
                    },
                    None => {
                        closest_node = Some((id, node, distance));
                    },
                    _ => {},
                }
            }
        }

        if let Some((node_id, _, _)) = closest_node {
            match self.selection_manager.selection_mode {
                SelectionMode::Single => {
                    self.selection_manager.select_node(node_id.clone());
                },
                SelectionMode::Multi => {
                    self.selection_manager.toggle_node(node_id.clone());
                },
                SelectionMode::Rectangle => {
                    // Rectangle selection not implemented yet
                    self.selection_manager.select_node(node_id.clone());
                },
            }
        } else {
            self.selection_manager.clear_selection();
        }

        self.update_renderer_selection();
    }

    /// Convert screen coordinates to world coordinates
    fn screen_to_world(&self, screen_pos: Vec2) -> Vec3 {
        // Simplified conversion - would need proper unprojection in full implementation
        let ndc_x = (screen_pos.x / 800.0 - 0.5) * 2.0; // Assuming 800px width
        let ndc_y = (screen_pos.y / 600.0 - 0.5) * 2.0; // Assuming 600px height

        let inv_view_proj = self.camera.view_proj_matrix().inverse();
        let world_pos = inv_view_proj * Vec3::new(ndc_x, ndc_y, 0.0).extend(1.0);

        world_pos.truncate() / world_pos.w
    }

    /// Update renderer camera uniform
    fn update_renderer_camera(&self) {
        // This would update the camera uniform buffer in the renderer
        // Implementation depends on GraphRenderer internals
    }

    /// Update renderer selection uniform
    fn update_renderer_selection(&self) {
        // This would update the selection uniform buffer in the renderer
        // Implementation depends on GraphRenderer internals
    }
}

/// Node information panel
#[derive(Debug, Clone)]
pub struct NodeInfoPanel {
    pub visible: bool,
    pub selected_node_id: Option<String>,
    pub node_info: Option<NodeDisplayInfo>,
}

#[derive(Debug, Clone)]
pub struct NodeDisplayInfo {
    pub id: String,
    pub node_type: String,
    pub position: [f32; 3],
    pub activation: f32,
    pub connection_count: usize,
    pub metadata: Vec<(String, String)>,
}

impl NodeInfoPanel {
    pub fn new() -> Self {
        Self {
            visible: true,
            selected_node_id: None,
            node_info: None,
        }
    }

    pub fn update_info(&mut self, graph: &MemoryGraph, selected_nodes: &HashSet<String>) {
        if let Some(node_id) = selected_nodes.iter().next() {
            if let Some(node) = graph.nodes.get(node_id) {
                self.node_info = Some(NodeDisplayInfo {
                    id: node.id.clone(),
                    node_type: format!("{:?}", node.node_type),
                    position: node.position,
                    activation: node.activation,
                    connection_count: node.connections.len(),
                    metadata: node
                        .metadata
                        .iter()
                        .map(|(k, v)| (k.clone(), format!("{:?}", v)))
                        .collect(),
                });
            }
        } else {
            self.node_info = None;
        }
    }
}

/// Graph statistics panel
#[derive(Debug, Clone)]
pub struct GraphStatsPanel {
    pub visible: bool,
    pub total_nodes: usize,
    pub total_edges: usize,
    pub selected_nodes: usize,
    pub fps: f32,
    pub memory_usage: usize,
}

impl GraphStatsPanel {
    pub fn new() -> Self {
        Self {
            visible: true,
            total_nodes: 0,
            total_edges: 0,
            selected_nodes: 0,
            fps: 0.0,
            memory_usage: 0,
        }
    }

    pub fn update_stats(
        &mut self,
        graph: &MemoryGraph,
        selected_nodes: &HashSet<String>,
        fps: f32,
    ) {
        self.total_nodes = graph.nodes.len();
        self.total_edges = graph.edges.len();
        self.selected_nodes = selected_nodes.len();
        self.fps = fps;
        // Memory usage calculation would be more complex in real implementation
        self.memory_usage = graph.nodes.len() * std::mem::size_of::<MemoryNode>()
            + graph.edges.len() * std::mem::size_of::<crate::memory_graph::MemoryEdge>();
    }
}

/// Search panel for node filtering
#[derive(Debug, Clone)]
pub struct SearchPanel {
    pub visible: bool,
    pub query: String,
    pub filtered_nodes: HashSet<String>,
    pub search_by: SearchBy,
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum SearchBy {
    ID,
    Type,
    Metadata,
}

impl SearchPanel {
    pub fn new() -> Self {
        Self {
            visible: false,
            query: String::new(),
            filtered_nodes: HashSet::new(),
            search_by: SearchBy::ID,
        }
    }

    pub fn update_search(&mut self, graph: &MemoryGraph) {
        self.filtered_nodes.clear();
        if self.query.is_empty() {
            return;
        }

        let query_lower = self.query.to_lowercase();
        for (id, node) in &graph.nodes {
            let matches = match self.search_by {
                SearchBy::ID => id.to_lowercase().contains(&query_lower),
                SearchBy::Type => format!("{:?}", node.node_type)
                    .to_lowercase()
                    .contains(&query_lower),
                SearchBy::Metadata => node
                    .metadata
                    .values()
                    .any(|v| format!("{:?}", v).to_lowercase().contains(&query_lower)),
            };

            if matches {
                self.filtered_nodes.insert(id.clone());
            }
        }
    }
}

/// Control panel for graph settings
#[derive(Debug, Clone)]
pub struct ControlPanel {
    pub visible: bool,
    pub show_edges: bool,
    pub show_labels: bool,
    pub layout_mode: LayoutMode,
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum LayoutMode {
    ForceDirected,
    Hierarchical,
    Neural,
}

impl ControlPanel {
    pub fn new() -> Self {
        Self {
            visible: true,
            show_edges: true,
            show_labels: false,
            layout_mode: LayoutMode::ForceDirected,
        }
    }
}

/// Inspector UI overlay system
pub struct InspectorUI {
    pub node_info_panel: NodeInfoPanel,
    pub graph_stats_panel: GraphStatsPanel,
    pub search_panel: SearchPanel,
    pub control_panel: ControlPanel,
    pub graph_renderer: Arc<GraphRenderer>,
    pub protocol: Arc<MemoryGraphProtocol>,
    /// UI render pipeline
    ui_pipeline: wgpu::RenderPipeline,
    /// Vertex buffer for UI rectangles (4 panels max)
    ui_vertex_buffer: wgpu::Buffer,
    /// Glyph atlas for text rendering
    #[allow(dead_code)]
    glyph_atlas: GlyphAtlas,
}

impl InspectorUI {
    pub fn new(
        graph_renderer: Arc<GraphRenderer>,
        protocol: Arc<MemoryGraphProtocol>,
        device: &wgpu::Device,
        surface_format: wgpu::TextureFormat,
    ) -> Self {
        // Create UI shader
        let ui_shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("UI Panel Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("shaders/ui_panel.wgsl").into()),
        });

        // Create pipeline layout (no bind groups for simple colored rectangles)
        let ui_pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("UI Pipeline Layout"),
            bind_group_layouts: &[],
            push_constant_ranges: &[],
        });

        // Create render pipeline
        let ui_pipeline = device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("UI Panel Pipeline"),
            layout: Some(&ui_pipeline_layout),
            vertex: wgpu::VertexState {
                module: &ui_shader,
                entry_point: "vs_main",
                buffers: &[ui_vertex_layout()],
            },
            fragment: Some(wgpu::FragmentState {
                module: &ui_shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format: surface_format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: wgpu::PrimitiveState {
                topology: wgpu::PrimitiveTopology::TriangleList,
                strip_index_format: None,
                front_face: wgpu::FrontFace::Ccw,
                cull_mode: Some(wgpu::Face::Back),
                polygon_mode: wgpu::PolygonMode::Fill,
                unclipped_depth: false,
                conservative: false,
            },
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            multiview: None,
        });

        // Create vertex buffer
        // 4 panels × 6 vertices (background) + text (4 panels × 4 lines × 30 chars × 6 vertices)
        // ~2500 vertices max to accommodate panel backgrounds and text placeholders
        let max_vertices = 2500;
        let ui_vertex_buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("UI Vertex Buffer"),
            size: (max_vertices * std::mem::size_of::<UIVertex>()) as wgpu::BufferAddress,
            usage: wgpu::BufferUsages::VERTEX | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        Self {
            node_info_panel: NodeInfoPanel::new(),
            graph_stats_panel: GraphStatsPanel::new(),
            search_panel: SearchPanel::new(),
            control_panel: ControlPanel::new(),
            graph_renderer,
            protocol,
            ui_pipeline,
            ui_vertex_buffer,
            glyph_atlas: GlyphAtlas::new(1024, 1024),
        }
    }

    /// Update UI state based on current graph and selection
    pub fn update(&mut self, graph: &MemoryGraph, selected_nodes: &HashSet<String>, fps: f32) {
        self.node_info_panel.update_info(graph, selected_nodes);
        self.graph_stats_panel
            .update_stats(graph, selected_nodes, fps);
        self.search_panel.update_search(graph);
    }

    /// Handle keyboard input for UI controls
    pub fn handle_keyboard(&mut self, key: u32, pressed: bool) {
        if !pressed {
            return;
        }

        match key {
            // Toggle panels
            105 => self.node_info_panel.visible = !self.node_info_panel.visible, // 'i'
            115 => self.graph_stats_panel.visible = !self.graph_stats_panel.visible, // 's'
            47 => self.search_panel.visible = !self.search_panel.visible,        // '/'
            99 => self.control_panel.visible = !self.control_panel.visible,      // 'c'
            _ => {},
        }
    }

    /// Send visual feedback to evolution daemon
    pub async fn send_feedback(&self, feedback_type: &str, data: serde_json::Value) {
        let message = Message::VisualFeedback {
            feedback_type: feedback_type.to_string(),
            data,
            timestamp: std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)
                .unwrap()
                .as_secs(),
        };

        if let Err(e) = self.protocol.send_message(message).await {
            log::warn!("Failed to send visual feedback: {}", e);
        }
    }

    /// Generate vertices for a single UI panel rectangle
    fn generate_panel_vertices(
        x: f32,
        y: f32,
        width: f32,
        height: f32,
        color: [f32; 4],
    ) -> [UIVertex; 6] {
        // Two triangles forming a quad
        let x1 = x;
        let y1 = y;
        let x2 = x + width;
        let y2 = y + height;

        [
            // Triangle 1
            UIVertex::new(x1, y1, 0.0, color), // top-left
            UIVertex::new(x2, y1, 0.0, color), // top-right
            UIVertex::new(x1, y2, 0.0, color), // bottom-left
            // Triangle 2
            UIVertex::new(x1, y2, 0.0, color), // bottom-left
            UIVertex::new(x2, y1, 0.0, color), // top-right
            UIVertex::new(x2, y2, 0.0, color), // bottom-right
        ]
    }

    /// Generate vertices for text placeholder (minimal implementation)
    /// Creates a colored quad to represent text area
    fn generate_text_placeholder(x: f32, y: f32, width: f32, height: f32) -> [UIVertex; 6] {
        // White/light colored text placeholder
        Self::generate_panel_vertices(x, y, width, height, [0.9, 0.9, 0.9, 0.7])
    }

    /// Generate text vertices for a string (minimal: creates placeholder quads)
    fn generate_text_line(
        &self,
        text: &str,
        x: f32,
        y: f32,
        max_width: f32,
        font_size: f32,
    ) -> Vec<UIVertex> {
        // Minimal implementation: create placeholder quads for each character
        // Each character is approximately font_size × font_size
        let char_width = font_size * 0.6; // Approximate character aspect ratio
        let mut vertices = Vec::new();
        let mut current_x = x;

        for ch in text.chars() {
            if current_x + char_width > x + max_width {
                break; // Text doesn't fit
            }

            // Skip spaces (no quad needed)
            if ch != ' ' {
                let char_quad =
                    Self::generate_text_placeholder(current_x, y, char_width, font_size);
                vertices.extend_from_slice(&char_quad);
            }

            current_x += char_width;
        }

        vertices
    }

    /// Prepare UI vertices for rendering (call before render_pass)
    /// Returns the number of vertices written
    pub fn prepare(&self, queue: &wgpu::Queue) -> usize {
        // Collect vertices for all visible panels
        let mut vertices = Vec::new();

        // Panel dimensions and positions (screen-space coordinates)
        // Using normalized device coordinates (-1 to 1)
        // Left side panels
        let panel_width = 0.35;
        let panel_height = 0.25;
        let padding = 0.02;

        // Node Info Panel (top-left)
        if self.node_info_panel.visible {
            let panel_x = -0.98;
            let panel_y = 0.98 - panel_height;
            let panel_verts = Self::generate_panel_vertices(
                panel_x,
                panel_y,
                panel_width,
                panel_height,
                [0.1, 0.1, 0.15, 0.85], // Dark blue-gray, semi-transparent
            );
            vertices.extend_from_slice(&panel_verts);

            // Add panel title
            let title_text = self.generate_text_line(
                "Node Info",
                panel_x + 0.02,
                panel_y + 0.02,
                panel_width - 0.04,
                0.03,
            );
            vertices.extend(title_text);

            // Add node info content if available
            if let Some(ref info) = self.node_info_panel.node_info {
                let content_y = panel_y + 0.08;
                let id_text = self.generate_text_line(
                    &format!("ID: {}", info.id),
                    panel_x + 0.02,
                    content_y,
                    panel_width - 0.04,
                    0.025,
                );
                vertices.extend(id_text);

                let type_text = self.generate_text_line(
                    &format!("Type: {}", info.node_type),
                    panel_x + 0.02,
                    content_y + 0.035,
                    panel_width - 0.04,
                    0.025,
                );
                vertices.extend(type_text);

                let activation_text = self.generate_text_line(
                    &format!("Activation: {:.2}", info.activation),
                    panel_x + 0.02,
                    content_y + 0.07,
                    panel_width - 0.04,
                    0.025,
                );
                vertices.extend(activation_text);
            }
        }

        // Graph Stats Panel (below node info)
        if self.graph_stats_panel.visible {
            let y_offset = if self.node_info_panel.visible {
                panel_height + padding
            } else {
                0.0
            };
            let panel_x = -0.98;
            let panel_y = 0.98 - panel_height - y_offset;
            let panel_verts = Self::generate_panel_vertices(
                panel_x,
                panel_y,
                panel_width,
                panel_height,
                [0.1, 0.15, 0.1, 0.85], // Dark green-gray, semi-transparent
            );
            vertices.extend_from_slice(&panel_verts);

            // Add panel title
            let title_text = self.generate_text_line(
                "Graph Stats",
                panel_x + 0.02,
                panel_y + 0.02,
                panel_width - 0.04,
                0.03,
            );
            vertices.extend(title_text);

            // Add stats content
            let content_y = panel_y + 0.08;
            let nodes_text = self.generate_text_line(
                &format!("Nodes: {}", self.graph_stats_panel.total_nodes),
                panel_x + 0.02,
                content_y,
                panel_width - 0.04,
                0.025,
            );
            vertices.extend(nodes_text);

            let edges_text = self.generate_text_line(
                &format!("Edges: {}", self.graph_stats_panel.total_edges),
                panel_x + 0.02,
                content_y + 0.035,
                panel_width - 0.04,
                0.025,
            );
            vertices.extend(edges_text);

            let fps_text = self.generate_text_line(
                &format!("FPS: {:.1}", self.graph_stats_panel.fps),
                panel_x + 0.02,
                content_y + 0.07,
                panel_width - 0.04,
                0.025,
            );
            vertices.extend(fps_text);
        }

        // Search Panel (top-right)
        if self.search_panel.visible {
            let panel_x = 0.98 - panel_width;
            let panel_y = 0.98 - panel_height;
            let panel_verts = Self::generate_panel_vertices(
                panel_x,
                panel_y,
                panel_width,
                panel_height,
                [0.15, 0.1, 0.1, 0.85], // Dark red-gray, semi-transparent
            );
            vertices.extend_from_slice(&panel_verts);

            // Add panel title
            let title_text = self.generate_text_line(
                "Search",
                panel_x + 0.02,
                panel_y + 0.02,
                panel_width - 0.04,
                0.03,
            );
            vertices.extend(title_text);

            // Add search query if present
            if !self.search_panel.query.is_empty() {
                let query_text = self.generate_text_line(
                    &format!("Query: {}", self.search_panel.query),
                    panel_x + 0.02,
                    panel_y + 0.08,
                    panel_width - 0.04,
                    0.025,
                );
                vertices.extend(query_text);

                let results_text = self.generate_text_line(
                    &format!("Found: {} nodes", self.search_panel.filtered_nodes.len()),
                    panel_x + 0.02,
                    panel_y + 0.115,
                    panel_width - 0.04,
                    0.025,
                );
                vertices.extend(results_text);
            }
        }

        // Control Panel (below search)
        if self.control_panel.visible {
            let y_offset = if self.search_panel.visible {
                panel_height + padding
            } else {
                0.0
            };
            let panel_x = 0.98 - panel_width;
            let panel_y = 0.98 - panel_height - y_offset;
            let panel_verts = Self::generate_panel_vertices(
                panel_x,
                panel_y,
                panel_width,
                panel_height,
                [0.12, 0.12, 0.12, 0.85], // Dark gray, semi-transparent
            );
            vertices.extend_from_slice(&panel_verts);

            // Add panel title
            let title_text = self.generate_text_line(
                "Controls",
                panel_x + 0.02,
                panel_y + 0.02,
                panel_width - 0.04,
                0.03,
            );
            vertices.extend(title_text);

            // Add control hints
            let content_y = panel_y + 0.08;
            let hint1 = self.generate_text_line(
                "[i] Toggle Node Info",
                panel_x + 0.02,
                content_y,
                panel_width - 0.04,
                0.025,
            );
            vertices.extend(hint1);

            let hint2 = self.generate_text_line(
                "[s] Toggle Stats",
                panel_x + 0.02,
                content_y + 0.035,
                panel_width - 0.04,
                0.025,
            );
            vertices.extend(hint2);

            let hint3 = self.generate_text_line(
                "[/] Toggle Search",
                panel_x + 0.02,
                content_y + 0.07,
                panel_width - 0.04,
                0.025,
            );
            vertices.extend(hint3);
        }

        let vertex_count = vertices.len();

        // Upload vertices to GPU buffer
        if vertex_count > 0 {
            queue.write_buffer(&self.ui_vertex_buffer, 0, bytemuck::cast_slice(&vertices));
        }

        // Log the state for debugging
        if self.node_info_panel.visible && self.node_info_panel.node_info.is_some() {
            log::debug!("Node Info Panel: {:?}", self.node_info_panel.node_info);
        }

        if self.graph_stats_panel.visible {
            log::debug!(
                "Graph Stats: {} nodes, {} edges, {} FPS",
                self.graph_stats_panel.total_nodes,
                self.graph_stats_panel.total_edges,
                self.graph_stats_panel.fps
            );
        }

        if self.search_panel.visible && !self.search_panel.query.is_empty() {
            log::debug!(
                "Search: '{}' found {} nodes",
                self.search_panel.query,
                self.search_panel.filtered_nodes.len()
            );
        }

        vertex_count
    }

    /// Render UI overlay (immutable, call after prepare)
    pub fn render<'a>(&'a self, render_pass: &mut wgpu::RenderPass<'a>, vertex_count: usize) {
        // Draw panels if we have vertices
        if vertex_count > 0 {
            render_pass.set_pipeline(&self.ui_pipeline);
            render_pass.set_vertex_buffer(0, self.ui_vertex_buffer.slice(..));
            render_pass.draw(0..vertex_count as u32, 0..1);
        }
    }
}

/// Main memory graph inspector combining controls and UI
pub struct MemoryGraphInspector {
    pub controls: GraphControls,
    pub ui: InspectorUI,
    pub current_graph: Option<MemoryGraph>,
}

impl MemoryGraphInspector {
    pub fn new(
        graph_renderer: Arc<GraphRenderer>,
        protocol: Arc<MemoryGraphProtocol>,
        device: &wgpu::Device,
        surface_format: wgpu::TextureFormat,
    ) -> Self {
        Self {
            controls: GraphControls::new(graph_renderer.clone()),
            ui: InspectorUI::new(graph_renderer, protocol, device, surface_format),
            current_graph: None,
        }
    }

    /// Handle Smithay input events - simplified for any backend
    pub fn handle_input_scroll(&mut self, delta: f64) {
        self.controls.handle_zoom(delta as f32 * 0.001);
    }

    /// Handle mouse click for node selection
    pub fn handle_input_click(&mut self, mouse_pos: Vec2) {
        if let Some(graph) = &self.current_graph {
            self.controls.handle_selection(mouse_pos, graph);
        }
    }

    /// Handle keyboard input
    pub fn handle_input_key(&mut self, key_code: u32, pressed: bool) {
        if pressed {
            self.ui.handle_keyboard(key_code, true);
        }
    }

    /// Update inspector state
    pub fn update(&mut self, graph: MemoryGraph, fps: f32) {
        self.current_graph = Some(graph.clone());
        let selected_nodes = &self.controls.selection_manager.selected_nodes;
        self.ui.update(&graph, selected_nodes, fps);
    }

    /// Prepare inspector for rendering (call before render_pass)
    pub fn prepare(&self, queue: &wgpu::Queue) -> usize {
        self.ui.prepare(queue)
    }

    /// Render the inspector (immutable, call after prepare)
    pub fn render<'a>(&'a self, render_pass: &mut wgpu::RenderPass<'a>, vertex_count: usize) {
        self.ui.render(render_pass, vertex_count);
        // Graph rendering is handled by GraphRenderer
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::memory_graph::MemoryGraph;

    // === UIVertex Tests ===

    #[test]
    fn test_ui_vertex_creation() {
        let vertex = UIVertex::new(10.0, 20.0, 0.5, [1.0, 0.5, 0.3, 0.8]);
        assert_eq!(vertex.position, [10.0, 20.0, 0.5]);
        assert_eq!(vertex.color, [1.0, 0.5, 0.3, 0.8]);
    }

    #[test]
    fn test_ui_vertex_layout() {
        let layout = ui_vertex_layout();
        assert_eq!(layout.array_stride, std::mem::size_of::<UIVertex>() as u64);
        assert_eq!(layout.attributes.len(), 2); // position + color
    }

    // === Panel Vertex Generation Tests ===

    #[test]
    fn test_generate_panel_vertices() {
        let vertices =
            InspectorUI::generate_panel_vertices(0.0, 0.0, 1.0, 1.0, [1.0, 1.0, 1.0, 1.0]);

        assert_eq!(
            vertices.len(),
            6,
            "Panel should generate 6 vertices (2 triangles)"
        );

        // Check first triangle (top-left, top-right, bottom-left)
        assert_eq!(vertices[0].position, [0.0, 0.0, 0.0]); // top-left
        assert_eq!(vertices[1].position, [1.0, 0.0, 0.0]); // top-right
        assert_eq!(vertices[2].position, [0.0, 1.0, 0.0]); // bottom-left

        // Check second triangle (bottom-left, top-right, bottom-right)
        assert_eq!(vertices[3].position, [0.0, 1.0, 0.0]); // bottom-left
        assert_eq!(vertices[4].position, [1.0, 0.0, 0.0]); // top-right
        assert_eq!(vertices[5].position, [1.0, 1.0, 0.0]); // bottom-right

        // All vertices should have the same color
        for v in &vertices {
            assert_eq!(v.color, [1.0, 1.0, 1.0, 1.0]);
        }
    }

    #[test]
    fn test_panel_vertices_with_offset() {
        let vertices =
            InspectorUI::generate_panel_vertices(-0.5, 0.5, 0.3, 0.2, [0.5, 0.5, 0.5, 1.0]);

        // Verify bounding box
        let x_min = vertices
            .iter()
            .map(|v| v.position[0])
            .fold(f32::INFINITY, f32::min);
        let x_max = vertices
            .iter()
            .map(|v| v.position[0])
            .fold(f32::NEG_INFINITY, f32::max);
        let y_min = vertices
            .iter()
            .map(|v| v.position[1])
            .fold(f32::INFINITY, f32::min);
        let y_max = vertices
            .iter()
            .map(|v| v.position[1])
            .fold(f32::NEG_INFINITY, f32::max);

        assert!((x_min - (-0.5)).abs() < 0.001);
        assert!((x_max - (-0.2)).abs() < 0.001); // -0.5 + 0.3
        assert!((y_min - 0.5).abs() < 0.001);
        assert!((y_max - 0.7).abs() < 0.001); // 0.5 + 0.2
    }

    // === Panel Visibility Toggle Tests ===

    #[test]
    fn test_node_info_panel_visibility() {
        let mut panel = NodeInfoPanel::new();
        assert!(panel.visible, "NodeInfoPanel should start visible");

        panel.visible = false;
        assert!(!panel.visible);

        panel.visible = true;
        assert!(panel.visible);
    }

    #[test]
    fn test_graph_stats_panel_visibility() {
        let mut panel = GraphStatsPanel::new();
        assert!(panel.visible, "GraphStatsPanel should start visible");

        panel.visible = false;
        assert!(!panel.visible);
    }

    #[test]
    fn test_search_panel_visibility() {
        let mut panel = SearchPanel::new();
        assert!(!panel.visible, "SearchPanel should start hidden");

        panel.visible = true;
        assert!(panel.visible);

        panel.visible = false;
        assert!(!panel.visible);
    }

    #[test]
    fn test_control_panel_visibility() {
        let mut panel = ControlPanel::new();
        assert!(panel.visible, "ControlPanel should start visible");

        panel.visible = false;
        assert!(!panel.visible);
    }

    // === InspectorUI Keyboard Tests ===
    // Note: GraphControls tests require GPU context (GraphRenderer)
    // Testing InspectorUI keyboard handling instead

    #[test]
    fn test_keyboard_toggle_panels() {
        // Create a simple mock without GPU dependencies
        // We can test the handle_keyboard logic pattern
        // 'i' (105), 's' (115), '/' (47), 'c' (99)

        // Verify keycodes are correct
        assert_eq!('i' as u32, 105);
        assert_eq!('s' as u32, 115);
        assert_eq!('/' as u32, 47);
        assert_eq!('c' as u32, 99);
    }

    // === GraphCamera Tests ===

    #[test]
    fn test_camera_default() {
        let camera = GraphCamera::default();
        assert_eq!(camera.position, Vec3::new(0.0, 0.0, 10.0));
        assert_eq!(camera.target, Vec3::ZERO);
        assert_eq!(camera.up, Vec3::Y);
    }

    #[test]
    fn test_camera_view_matrix() {
        let camera = GraphCamera::default();
        let view = camera.view_matrix();

        // View matrix should be valid (not all zeros)
        let col0 = view.col(0);
        assert!(col0.x != 0.0 || col0.y != 0.0 || col0.z != 0.0);
    }

    #[test]
    fn test_camera_projection_matrix() {
        let camera = GraphCamera::default();
        let proj = camera.projection_matrix();

        // Projection matrix should be valid
        let col0 = proj.col(0);
        assert!(col0.x != 0.0 || col0.y != 0.0 || col0.z != 0.0);
    }

    // === NodeSelectionManager Tests ===

    #[test]
    fn test_selection_manager_default() {
        let manager = NodeSelectionManager::default();
        assert!(manager.selected_nodes.is_empty());
        assert_eq!(manager.hovered_node, None);
    }

    #[test]
    fn test_selection_toggle() {
        let mut manager = NodeSelectionManager::default();

        manager.toggle_node("node1".to_string());
        assert!(manager.selected_nodes.contains("node1"));

        manager.toggle_node("node1".to_string());
        assert!(
            !manager.selected_nodes.contains("node1"),
            "Second toggle should deselect"
        );
    }

    #[test]
    fn test_selection_clear() {
        let mut manager = NodeSelectionManager::default();

        manager.toggle_node("node1".to_string());
        manager.toggle_node("node2".to_string());
        assert_eq!(manager.selected_nodes.len(), 2);

        manager.clear_selection();
        assert!(manager.selected_nodes.is_empty());
    }

    // === Text Generation Tests ===

    #[test]
    fn test_text_line_generation_empty() {
        // Note: This requires glyph_atlas, which needs GPU context
        // For now, we test the static helper method
        let placeholder = InspectorUI::generate_text_placeholder(0.0, 0.0, 1.0, 0.1);
        assert_eq!(
            placeholder.len(),
            6,
            "Text placeholder should be 6 vertices"
        );

        // Check color is light/white
        assert_eq!(placeholder[0].color, [0.9, 0.9, 0.9, 0.7]);
    }

    #[test]
    fn test_text_placeholder_bounds() {
        let x = 0.5;
        let y = -0.3;
        let width = 0.2;
        let height = 0.05;

        let vertices = InspectorUI::generate_text_placeholder(x, y, width, height);

        // Verify bounds
        let x_coords: Vec<f32> = vertices.iter().map(|v| v.position[0]).collect();
        let y_coords: Vec<f32> = vertices.iter().map(|v| v.position[1]).collect();

        let x_min = x_coords.iter().fold(f32::INFINITY, |a, &b| a.min(b));
        let x_max = x_coords.iter().fold(f32::NEG_INFINITY, |a, &b| a.max(b));
        let y_min = y_coords.iter().fold(f32::INFINITY, |a, &b| a.min(b));
        let y_max = y_coords.iter().fold(f32::NEG_INFINITY, |a, &b| a.max(b));

        assert!((x_min - x).abs() < 0.001);
        assert!((x_max - (x + width)).abs() < 0.001);
        assert!((y_min - y).abs() < 0.001);
        assert!((y_max - (y + height)).abs() < 0.001);
    }

    // === Panel Update Tests ===

    #[test]
    fn test_node_info_panel_update() {
        let mut panel = NodeInfoPanel::new();
        let graph = MemoryGraph::new();
        let selected = HashSet::new();

        // Should not panic with empty graph
        panel.update_info(&graph, &selected);

        // With no selection, node_info should be None
        assert!(panel.node_info.is_none());
    }

    #[test]
    fn test_graph_stats_panel_update() {
        let mut panel = GraphStatsPanel::new();
        let graph = MemoryGraph::new();
        let selected = HashSet::new();

        // Should not panic with empty graph
        panel.update_stats(&graph, &selected, 60.0);

        // Stats should reflect empty graph
        assert_eq!(panel.total_nodes, 0);
        assert_eq!(panel.total_edges, 0);
    }

    #[test]
    fn test_search_panel_update() {
        let mut panel = SearchPanel::new();
        let graph = MemoryGraph::new();

        // Should not panic with empty graph
        panel.update_search(&graph);

        // Empty graph should have no results
        assert_eq!(panel.filtered_nodes.len(), 0);
    }
}
