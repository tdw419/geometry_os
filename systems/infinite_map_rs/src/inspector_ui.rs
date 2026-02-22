// ============================================
// MEMORY GRAPH INSPECTOR UI
// Interactive controls and UI components for neural memory graph visualization
// ============================================

use std::collections::HashSet;
use std::sync::Arc;
use glam::{Vec2, Vec3, Mat4};
use smithay::backend::input::ButtonState;
use crate::memory_graph::{MemoryGraph, MemoryNode};
use crate::graph_renderer::GraphRenderer;
use crate::evolution_protocol::{MemoryGraphProtocol, Message};

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
            }
            ButtonState::Released => {
                self.pan_controller.is_panning = false;
                self.pan_controller.last_mouse_pos = None;
            }
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
            if distance < 1.0 { // Selection threshold
                match closest_node {
                    Some((_, _, min_dist)) if distance < min_dist => {
                        closest_node = Some((id, node, distance));
                    }
                    None => {
                        closest_node = Some((id, node, distance));
                    }
                    _ => {}
                }
            }
        }

        if let Some((node_id, _, _)) = closest_node {
            match self.selection_manager.selection_mode {
                SelectionMode::Single => {
                    self.selection_manager.select_node(node_id.clone());
                }
                SelectionMode::Multi => {
                    self.selection_manager.toggle_node(node_id.clone());
                }
                SelectionMode::Rectangle => {
                    // Rectangle selection not implemented yet
                    self.selection_manager.select_node(node_id.clone());
                }
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
                    metadata: node.metadata.iter()
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

    pub fn update_stats(&mut self, graph: &MemoryGraph, selected_nodes: &HashSet<String>, fps: f32) {
        self.total_nodes = graph.nodes.len();
        self.total_edges = graph.edges.len();
        self.selected_nodes = selected_nodes.len();
        self.fps = fps;
        // Memory usage calculation would be more complex in real implementation
        self.memory_usage = graph.nodes.len() * std::mem::size_of::<MemoryNode>() +
                           graph.edges.len() * std::mem::size_of::<crate::memory_graph::MemoryEdge>();
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
                SearchBy::Type => format!("{:?}", node.node_type).to_lowercase().contains(&query_lower),
                SearchBy::Metadata => node.metadata.values()
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
}

impl InspectorUI {
    pub fn new(graph_renderer: Arc<GraphRenderer>, protocol: Arc<MemoryGraphProtocol>) -> Self {
        Self {
            node_info_panel: NodeInfoPanel::new(),
            graph_stats_panel: GraphStatsPanel::new(),
            search_panel: SearchPanel::new(),
            control_panel: ControlPanel::new(),
            graph_renderer,
            protocol,
        }
    }

    /// Update UI state based on current graph and selection
    pub fn update(&mut self, graph: &MemoryGraph, selected_nodes: &HashSet<String>, fps: f32) {
        self.node_info_panel.update_info(graph, selected_nodes);
        self.graph_stats_panel.update_stats(graph, selected_nodes, fps);
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
            47 => self.search_panel.visible = !self.search_panel.visible, // '/'
            99 => self.control_panel.visible = !self.control_panel.visible, // 'c'
            _ => {}
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

    /// Render UI overlay (placeholder - actual rendering would use egui or similar)
    pub fn render(&self) {
        // This would render the UI panels using a UI library
        // For now, just log the state for debugging
        if self.node_info_panel.visible && self.node_info_panel.node_info.is_some() {
            log::debug!("Node Info Panel: {:?}", self.node_info_panel.node_info);
        }

        if self.graph_stats_panel.visible {
            log::debug!("Graph Stats: {} nodes, {} edges, {} FPS",
                       self.graph_stats_panel.total_nodes,
                       self.graph_stats_panel.total_edges,
                       self.graph_stats_panel.fps);
        }

        if self.search_panel.visible && !self.search_panel.query.is_empty() {
            log::debug!("Search: '{}' found {} nodes",
                       self.search_panel.query,
                       self.search_panel.filtered_nodes.len());
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
    pub fn new(graph_renderer: Arc<GraphRenderer>, protocol: Arc<MemoryGraphProtocol>) -> Self {
        Self {
            controls: GraphControls::new(graph_renderer.clone()),
            ui: InspectorUI::new(graph_renderer, protocol),
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

    /// Render the inspector
    pub fn render(&self) {
        self.ui.render();
        // Graph rendering is handled by GraphRenderer
    }
}