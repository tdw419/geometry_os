//! Window Renderer for Bare Metal Display
//!
//! Renders VM windows as colored rectangles on the framebuffer.
//! Windows have state-based border colors and can be dynamically managed.

use super::{GpuFramebuffer, ScreenDimensionsConfig};

/// Window state enumeration
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum WindowState {
    Inactive = 0,
    Running = 1,
    Halted = 2,
    Waiting = 3,
}

impl Default for WindowState {
    fn default() -> Self {
        Self::Inactive
    }
}

/// Window instance for bare metal display
#[derive(Debug, Clone)]
pub struct WindowInstance {
    pub id: u32,
    pub vm_id: u32,
    pub x: u32,
    pub y: u32,
    pub width: u32,
    pub height: u32,
    pub border_color: u32,
    pub state: WindowState,
}

impl Default for WindowInstance {
    fn default() -> Self {
        Self {
            id: 0,
            vm_id: 0,
            x: 0,
            y: 0,
            width: 400,
            height: 300,
            border_color: 0x00FF00, // Green border for running
            state: WindowState::Inactive,
        }
    }
}

/// Window renderer for bare metal display
pub struct WindowRenderer {
    windows: Vec<WindowInstance>,
    max_windows: usize,
}

impl WindowRenderer {
    pub fn new(max_windows: usize) -> Self {
        Self {
            windows: Vec::with_capacity(max_windows),
            max_windows,
        }
    }

    /// Add a window to the renderer
    pub fn add_window(&mut self, window: WindowInstance) -> Result<(), String> {
        if self.windows.len() >= self.max_windows {
            return Err("Maximum windows reached".to_string());
        }
        self.windows.push(window);
        Ok(())
    }

    /// Get window count
    pub fn window_count(&self) -> usize {
        self.windows.len()
    }

    /// Render all windows to the framebuffer
    pub fn render(&self, framebuffer: &mut GpuFramebuffer) {
        const BORDER_THICKNESS: u32 = 3;
        const BACKGROUND_COLOR: u32 = 0x220000; // Dark background

        for win in &self.windows {
            if win.state == WindowState::Inactive {
                continue;
            }

            // Draw window rectangle
            for y in win.y..win.y.saturating_add(win.height) {
                for x in win.x..win.x.saturating_add(win.width) {
                    let px = x.saturating_sub(win.x);
                    let py = y.saturating_sub(win.y);

                    // Calculate border distances
                    let dist_left = px;
                    let dist_right = win.width.saturating_sub(px).saturating_sub(1);
                    let dist_top = py;
                    let dist_bottom = win.height.saturating_sub(py).saturating_sub(1);

                    let min_dist = dist_left
                        .min(dist_right)
                        .min(dist_top)
                        .min(dist_bottom);

                    // Draw border or background
                    let color = if min_dist < BORDER_THICKNESS {
                        win.border_color
                    } else {
                        BACKGROUND_COLOR
                    };

                    framebuffer.put_pixel(x, y, color);
                }
            }
        }
    }

    /// Get state color for window borders
    pub fn get_state_color(state: WindowState) -> u32 {
        match state {
            WindowState::Inactive => 0x333333, // Gray
            WindowState::Running => 0x00FF00,  // Green
            WindowState::Halted => 0xFF0000,   // Red
            WindowState::Waiting => 0xFFFF00,  // Yellow
        }
    }
}
