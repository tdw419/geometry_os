// ============================================
// GEOMETRY OS - WINDOW MANAGER
// Manages "window particles" on the infinite map
// ============================================

use smithay::reexports::wayland_server::protocol::wl_surface::WlSurface;
use smithay::reexports::wayland_server::Resource;
use std::sync::Arc;

#[derive(Debug, Clone, Copy, PartialEq)]
#[allow(dead_code)]
pub enum WindowType {
    Default,
    Focus,    // Cyan - Logic/Code
    Creative, // Purple - Dream/Art
    System,   // Green - Stable/Core
    EvolutionZone, // Gold - Autonomous Execution
}

impl WindowType {
    pub fn border_color(&self) -> (f32, f32, f32) {
        match self {
            WindowType::Default => (0.1, 0.1, 0.1),
            WindowType::Focus => (0.0, 0.8, 1.0),    // Cyan
            WindowType::Creative => (0.6, 0.2, 1.0), // Purple
            WindowType::System => (1.0, 0.0, 0.0),   // Bright Red (High Vis)
            WindowType::EvolutionZone => (1.0, 0.84, 0.0), // Gold
        }
    }
}

#[derive(Debug, Clone)]
pub struct WindowDecorations {
    pub title_bar_height: f32,
    pub border_width: f32,
    pub show_title_bar: bool,
    #[allow(dead_code)]
    pub show_border: bool,
    #[allow(dead_code)]
    pub close_button_hovered: bool,
}

impl Default for WindowDecorations {
    fn default() -> Self {
        WindowDecorations {
            title_bar_height: 30.0,
            border_width: 2.0,
            show_title_bar: true,
            show_border: true,
            close_button_hovered: false,
        }
    }
}

pub struct Window {
    pub id: usize,
    #[allow(dead_code)]
    pub title: String,

    // Wayland surface (real app window)
    pub surface: Option<Arc<WlSurface>>,

    // Mock content (for demo windows without surfaces)
    #[allow(dead_code)]
    pub content: Option<String>,

    // Spatial position (world coordinates)
    pub x: f32,
    pub y: f32,

    // Dimensions
    pub width: f32,
    pub height: f32,

    // Window type
    pub window_type: WindowType,

    // Interaction state
    #[allow(dead_code)]
    pub hovered: bool,
    #[allow(dead_code)]
    pub dragging: bool,

    // Window decorations
    pub decorations: WindowDecorations,

    // Phase 30.2: VM framebuffer texture
    pub has_vm_texture: bool,
    // Phase 33: Memory texture (V2 brick)
    pub has_memory_texture: bool,
    // Phase 34.5: Custom border color (for PAS health)
    pub custom_border_color: Option<[f32; 4]>,
    // Phase 35.9.1: Cartridge texture (.rts.png)
    pub has_cartridge_texture: bool,
    pub cartridge_texture_id: Option<String>,
}

impl Window {
    #[allow(dead_code)]
    pub fn contains_content(&self, world_x: f32, world_y: f32) -> bool {
        world_x >= self.x
            && world_x <= self.x + self.width
            && world_y >= self.y
            && world_y <= self.y + self.height
    }

    pub fn contains_visual(&self, world_x: f32, world_y: f32) -> bool {
        let border = self.decorations.border_width;
        let title_h = if self.decorations.show_title_bar {
            self.decorations.title_bar_height
        } else {
            0.0
        };

        // Visual bounds (Frame)
        let visual_x = self.x - border;
        let visual_y = self.y - title_h - border;
        let visual_w = self.width + 2.0 * border;
        let visual_h = self.height + title_h + 2.0 * border;

        world_x >= visual_x 
            && world_x <= visual_x + visual_w
            && world_y >= visual_y
            && world_y <= visual_y + visual_h
    }

    #[allow(dead_code)]
    pub fn header_contains_point(&self, world_x: f32, world_y: f32) -> bool {
        if !self.decorations.show_title_bar {
            return false;
        }
        let header_height = self.decorations.title_bar_height;
        let border = self.decorations.border_width;
        
        // Header visual area (excluding borders for simple logic, or including?)
        // Let's match the renderer: Header is above content.
        // It spans the width of the content (plus borders maybe?)
        // Renderer draws frame rect which includes everything.
        // Let's define interaction header as strictly the bar above content.
        
        let header_y_start = self.y - header_height;
        let header_y_end = self.y;
        
        // Allow clicking slightly outside width due to borders
        let width_padding = border; 

        world_x >= self.x - width_padding
            && world_x <= self.x + self.width + width_padding
            && world_y >= header_y_start
            && world_y <= header_y_end
    }
}

pub struct WindowManager {
    windows: Vec<Window>,
    next_id: usize,
    /// Phase 30.6: Focused window ID for keyboard routing
    focused_window_id: Option<usize>,
}

impl WindowManager {
    pub fn new() -> Self {
        WindowManager {
            windows: Vec::new(),
            next_id: 0,
            focused_window_id: None,
        }
    }

    /// Create a window with Wayland surface
    #[allow(dead_code)]
    pub fn create_surface_window(
        &mut self,
        surface: Arc<WlSurface>,
        title: String,
        x: f32,
        y: f32,
        width: f32,
        height: f32,
    ) -> usize {
        let id = self.next_id;
        self.next_id += 1;

        let window = Window {
            id,
            title,
            surface: Some(surface),
            content: None,
            x,
            y,
            width,
            height,
            window_type: WindowType::Default,
            hovered: false,
            dragging: false,
            decorations: WindowDecorations::default(),
            has_vm_texture: false,
            has_memory_texture: false,
            custom_border_color: None,
            has_cartridge_texture: false,
            cartridge_texture_id: None,
        };

        self.windows.push(window);
        id
    }

    /// Create a demo window (mock content)
    pub fn create_demo_window(
        &mut self,
        title: String,
        content: String,
        x: f32,
        y: f32,
        window_type: WindowType,
    ) -> usize {
        let id = self.next_id;
        self.next_id += 1;

        let window = Window {
            id,
            title,
            surface: None,
            content: Some(content),
            x,
            y,
            width: 300.0,
            height: 200.0,
            window_type,
            hovered: false,
            dragging: false,
            decorations: WindowDecorations::default(),
            has_vm_texture: false,
            has_memory_texture: false,
            custom_border_color: None,
            has_cartridge_texture: false,
            cartridge_texture_id: None,
        };

        self.windows.push(window);
        id
    }

    /// Find window by Wayland surface
    #[allow(dead_code)]
    pub fn find_window_by_surface(&self, surface: &WlSurface) -> Option<&Window> {
        self.windows
            .iter()
            .find(|w| w.surface.as_ref().map(|s| s.as_ref()) == Some(surface))
    }

    /// Find window by Wayland surface (mutable)
    #[allow(dead_code)]
    pub fn find_window_by_surface_mut(&mut self, surface: &WlSurface) -> Option<&mut Window> {
        self.windows
            .iter_mut()
            .find(|w| w.surface.as_ref().map(|s| s.as_ref()) == Some(surface))
    }

    /// Update window dimensions (when surface changes size)
    #[allow(dead_code)]
    pub fn update_window_size(&mut self, surface: &WlSurface, width: f32, height: f32) {
        if let Some(window) = self.find_window_by_surface_mut(surface) {
            window.width = width;
            window.height = height;
            log::debug!("Updated window {} size: {}x{}", window.id, width, height);
        }
    }

    /// Remove window by Wayland surface
    #[allow(dead_code)]
    pub fn remove_window_by_surface(&mut self, surface: &WlSurface) {
        if let Some(pos) = self.windows
            .iter()
            .position(|w| w.surface.as_ref().map(|s| s.as_ref()) == Some(surface))
        {
            self.windows.remove(pos);
            log::debug!("Removed window for surface {:?}", surface.id());
        }
    }

    pub fn get_windows(&self) -> &[Window] {
        &self.windows
    }

    pub fn get_windows_mut(&mut self) -> &mut Vec<Window> {
        &mut self.windows
    }

    #[allow(dead_code)]
    pub fn get_window_mut(&mut self, id: usize) -> Option<&mut Window> {
        self.windows.iter_mut().find(|w| w.id == id)
    }

    #[allow(dead_code)]
    pub fn start_drag(&mut self, world_x: f32, world_y: f32) -> Option<usize> {
        // Find topmost window under cursor (reverse order for z-index simulation)
        // Note: Real z-index sorting would be better, but simplified for now
        for window in self.windows.iter_mut().rev() {
            if window.header_contains_point(world_x, world_y) {
                window.dragging = true;
                return Some(window.id);
            }
        }
        None
    }

    #[allow(dead_code)]
    pub fn update_drag(&mut self, id: usize, delta_x: f32, delta_y: f32) {
        if let Some(window) = self.get_window_mut(id) {
            if window.dragging {
                window.x += delta_x;
                window.y += delta_y;
            }
        }
    }

    #[allow(dead_code)]
    pub fn end_drag(&mut self, id: usize) {
        if let Some(window) = self.get_window_mut(id) {
            window.dragging = false;
        }
    }

    #[allow(dead_code)]
    pub fn update_hover(&mut self, world_x: f32, world_y: f32) {
        for window in &mut self.windows {
            window.hovered = window.contains_visual(world_x, world_y);
        }
    }

    /// Create a window with explicit dimensions (for cartridge textures)
    pub fn create_window(
        &mut self,
        title: String,
        x: f32,
        y: f32,
        width: f32,
        height: f32,
    ) -> usize {
        let id = self.next_id;
        self.next_id += 1;

        let window = Window {
            id,
            title,
            surface: None,
            content: None,
            x,
            y,
            width,
            height,
            window_type: WindowType::Default,
            hovered: false,
            dragging: false,
            decorations: WindowDecorations::default(),
            has_vm_texture: false,
            has_memory_texture: false,
            custom_border_color: None,
            has_cartridge_texture: false,
            cartridge_texture_id: None,
        };

        self.windows.push(window);
        id
    }

    /// Phase 35.9.1: Set window type
    pub fn set_window_type(&mut self, window_id: usize, window_type: WindowType) {
        if let Some(window) = self.get_window_mut(window_id) {
            window.window_type = window_type;
        }
    }

    /// Phase 35.9.1: Mark window as having a cartridge texture
    pub fn set_window_has_cartridge_texture(&mut self, window_id: usize, cartridge_id: &str) {
        if let Some(window) = self.get_window_mut(window_id) {
            window.has_cartridge_texture = true;
            window.cartridge_texture_id = Some(cartridge_id.to_string());
        }
    }

    /// Phase 35.9.1: Get window by ID (immutable)
    pub fn get_window(&self, id: usize) -> Option<&Window> {
        self.windows.iter().find(|w| w.id == id)
    }

    /// Find window at world position
    pub fn find_window_at_position(&self, x: f32, y: f32) -> Option<&Window> {
        // Iterate windows in reverse order (top to bottom)
        for window in self.windows.iter().rev() {
            if window.contains_visual(x, y) {
                return Some(window);
            }
        }
        None
    }
    
    /// Find window at world position (mutable)
    #[allow(dead_code)]
    pub fn find_window_at_position_mut(&mut self, x: f32, y: f32) -> Option<&mut Window> {
        // Iterate windows in reverse order (top to bottom)
        for window in self.windows.iter_mut().rev() {
            if window.contains_visual(x, y) {
                return Some(window);
            }
        }
        None
    }
    
    /// Get screen width
    pub fn screen_width(&self) -> f32 {
        // This should be passed in or stored. For now returning default or from config if available.
        // Assuming typical HD for now, but ideally we get this from backend.
        1280.0 
    }
    
    /// Get screen height
    pub fn screen_height(&self) -> f32 {
        720.0 
    }
    
    /// Bring window to front
    pub fn bring_to_front(&mut self, window_id: usize) {
        if let Some(pos) = self.windows.iter().position(|w| w.id == window_id) {
            let window = self.windows.remove(pos);
            self.windows.push(window);
            // Phase 30.6: Update focused window ID
            self.focused_window_id = Some(window_id);
        }
    }

    /// Phase 30.6: Get the focused window ID
    pub fn get_focused_window_id(&self) -> Option<usize> {
        self.focused_window_id
    }

    #[allow(dead_code)]
    pub fn remove_window(&mut self, id: usize) {
        self.windows.retain(|w| w.id != id);
    }
}

impl Default for WindowManager {
    fn default() -> Self {
        Self::new()
    }
}
