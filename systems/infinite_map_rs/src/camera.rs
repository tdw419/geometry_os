// ============================================
// GEOMETRY OS - CAMERA SYSTEM
// Ported from infinite_desktop.html Camera class
// ============================================

use glam::Vec2;

#[derive(Debug, Clone)]
pub struct Camera {
    // Target properties (where we want to be)
    pub target_x: f32,
    pub target_y: f32,
    pub target_zoom: f32,

    // Current properties (where we are, for smoothing)
    pub x: f32,
    pub y: f32,
    pub zoom: f32,
}

impl Camera {
    pub fn new(start_x: f32, start_y: f32, start_zoom: f32) -> Self {
        Camera {
            target_x: start_x,
            target_y: start_y,
            target_zoom: start_zoom,
            x: start_x,
            y: start_y,
            zoom: start_zoom,
        }
    }

    /// Convert Screen (Pixels) -> World (Grid Units)
    pub fn screen_to_world(&self, sx: f32, sy: f32, screen_width: f32, screen_height: f32) -> Vec2 {
        let center_x = screen_width / 2.0;
        let center_y = screen_height / 2.0;
        Vec2::new(
            (sx - center_x) / self.zoom + self.x,
            (sy - center_y) / self.zoom + self.y,
        )
    }

    /// Convert World (Grid Units) -> Screen (Pixels)
    pub fn world_to_screen(&self, wx: f32, wy: f32, screen_width: f32, screen_height: f32) -> Vec2 {
        let center_x = screen_width / 2.0;
        let center_y = screen_height / 2.0;
        Vec2::new(
            (wx - self.x) * self.zoom + center_x,
            (wy - self.y) * self.zoom + center_y,
        )
    }

    /// Update camera with smooth interpolation (Lerp)
    pub fn update(&mut self, damping: f32) {
        self.x += (self.target_x - self.x) * damping;
        self.y += (self.target_y - self.y) * damping;
        self.zoom += (self.target_zoom - self.zoom) * damping;

        // Precision cutoff
        if (self.target_x - self.x).abs() < 0.01 {
            self.x = self.target_x;
        }
        if (self.target_y - self.y).abs() < 0.01 {
            self.y = self.target_y;
        }
        if (self.target_zoom - self.zoom).abs() < 0.001 {
            self.zoom = self.target_zoom;
        }
    }

    /// Set target position (for smooth camera movement)
    #[allow(dead_code)]
    pub fn set_target(&mut self, x: f32, y: f32) {
        self.target_x = x;
        self.target_y = y;
    }

    /// Set target zoom level
    #[allow(dead_code)]
    pub fn set_zoom(&mut self, zoom: f32) {
        self.target_zoom = zoom;
    }

    /// Pan camera by world units
    #[allow(dead_code)]
    pub fn pan(&mut self, dx: f32, dy: f32) {
        self.target_x += dx;
        self.target_y += dy;
    }

    /// Zoom towards a screen point
    #[allow(dead_code)]
    pub fn zoom_towards(&mut self, screen_x: f32, screen_y: f32, factor: f32,
                        screen_width: f32, screen_height: f32,
                        min_zoom: f32, max_zoom: f32) {
        // 1. Get world position of cursor before zoom
        let mouse_world = self.screen_to_world(screen_x, screen_y, screen_width, screen_height);

        // 2. Apply zoom
        let new_zoom = (self.target_zoom * factor).clamp(min_zoom, max_zoom);
        self.target_zoom = new_zoom;

        // 3. Adjust camera position so mouse_world is still under cursor
        let center_w = screen_width / 2.0;
        let center_h = screen_height / 2.0;
        let mx = screen_x - center_w;
        let my = screen_y - center_h;

        self.target_x = mouse_world.x - (mx / new_zoom);
        self.target_y = mouse_world.y - (my / new_zoom);
    }

    /// Get view-projection matrix for rendering
    pub fn get_view_projection_matrix(&self) -> [[f32; 4]; 4] {
        // Create a simple orthographic projection matrix
        // For 2D rendering, we use a simple transformation
        let _aspect_ratio = 1.0; // Will be set by renderer
        let scale = self.zoom;
        
        // Translation matrix (camera position)
        let tx = -self.x * scale;
        let ty = -self.y * scale;
        
        // Combined matrix: scale * translation
        [
            [scale, 0.0, 0.0, 0.0],
            [0.0, scale, 0.0, 0.0],
            [0.0, 0.0, 1.0, 0.0],
            [tx, ty, 0.0, 1.0],
        ]
    }
}

impl Default for Camera {
    fn default() -> Self {
        Self::new(0.0, 0.0, 1.0)
    }
}
