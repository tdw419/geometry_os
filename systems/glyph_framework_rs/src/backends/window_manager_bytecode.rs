//! WindowManager bytecode for WgpuBackend and DrmBackend
//!
//! Contains pre-compiled instructions for:
//! - Layout registry (spatial positions of all apps)
//! - Intent processing (mouse clicks, keyboard, custom intents)
//! - Hit testing (determine which app was clicked)
//! - Focus management (track focused app)
//!
//! Integrates with:
//! - DrmBackend when running with `--features drm` on bare metal
//! - WgpuBackend for the incubation (browser/debug) environment

use crate::backends::ExecutionBackend;
use crate::types::{AppId, AppLayout, GlyphId, Intent};
use std::collections::HashMap;

/// Opcode constants for custom intents
pub const SPAWN_APP: u32 = 0x01;
pub const FOCUS_CHANGE: u32 = 0x02;
pub const CLOSE_APP: u32 = 0x03;
pub const KEY_PRESS: u32 = 0x04;

/// WindowManager bytecode state
pub struct WindowManagerBytecode {
    /// Layout registry: stores position, size, and active state for all apps
    layout_registry: HashMap<u32, LayoutEntry>,

    /// Intent queue: incoming intents to be processed
    intent_queue: Vec<Intent>,

    /// Focused app ID
    focused_app_id: Option<u32>,

    /// Next available app ID
    next_app_id: u32,
}

/// Entry in the layout registry
#[derive(Clone, Copy, Debug)]
pub struct LayoutEntry {
    pub x: u32,
    pub y: u32,
    pub width: u32,
    pub height: u32,
    pub app_id: u32,
    pub active: bool,
}

impl WindowManagerBytecode {
    /// Create a new WindowManagerBytecode
    pub fn new() -> Self {
        Self {
            layout_registry: HashMap::new(),
            intent_queue: Vec::new(),
            focused_app_id: None,
            next_app_id: 1, // Start at 1 (WindowManager is App 0)
        }
    }

    /// Process all pending intents from the queue
    pub fn process_intents(&mut self) {
        let intents: Vec<Intent> = self.intent_queue.drain(..).collect();
        for intent in intents {
            self.process_intent(intent);
        }
    }

    /// Process a single intent
    pub fn process_intent(&mut self, intent: Intent) {
        match intent {
            Intent::MouseClick { x, y } => {
                self.handle_mouse_click(x, y);
            }
            Intent::KeyPress(c) => {
                self.handle_key_press(c);
            }
            Intent::Custom { opcode, payload } => {
                match opcode {
                    SPAWN_APP => self.handle_spawn(&payload),
                    CLOSE_APP => self.handle_close(&payload),
                    _ => {}
                }
            }
        }
    }

    /// Handle mouse click: find which app was hit and update focus
    pub fn handle_mouse_click(&mut self, x: u32, y: u32) {
        for entry in self.layout_registry.values() {
            if entry.active && point_in_rect(x, y, entry) {
                self.focused_app_id = Some(entry.app_id);
                self.intent_queue.push(Intent::Custom {
                    opcode: FOCUS_CHANGE,
                    payload: vec![entry.app_id as f32],
                });
                return; // Only focus the first matching app
            }
        }
    }

    /// Handle key press: forward to focused app
    pub fn handle_key_press(&mut self, c: char) {
        if let Some(focused_id) = self.focused_app_id {
            // Forward key press to focused app
            self.intent_queue.push(Intent::Custom {
                opcode: KEY_PRESS,
                payload: vec![focused_id as f32, (c as u8) as f32],
            });
        }
    }

    /// Handle spawn intent: create a new app entry
    pub fn handle_spawn(&mut self, payload: &[f32]) {
        if payload.len() < 5 {
            return;
        }
        // Parse payload: name_hash, x, y, w, h
        let _name_hash = payload[0] as u32;
        let x = payload[1] as u32;
        let y = payload[2] as u32;
        let w = payload[3] as u32;
        let h = payload[4] as u32;
        let app_id = self.next_app_id;
        let entry = LayoutEntry {
            x,
            y,
            width: w,
            height: h,
            app_id,
            active: true,
        };
        self.layout_registry.insert(app_id, entry);
        self.next_app_id += 1;
    }

    /// Handle close intent: remove an app entry
    pub fn handle_close(&mut self, payload: &[f32]) {
        if payload.is_empty() {
            return;
        }
        let app_id = payload[0] as u32;
        if let Some(entry) = self.layout_registry.get_mut(&app_id) {
            entry.active = false;
            if self.focused_app_id == Some(app_id) {
                self.focused_app_id = None;
            }
        }
    }

    /// Find which app (if any) contains the given point
    pub fn find_app_at(&self, x: u32, y: u32) -> Option<u32> {
        for entry in self.layout_registry.values() {
            if entry.active && point_in_rect(x, y, entry) {
                return Some(entry.app_id);
            }
        }
        None
    }

    /// Get layout for a specific app
    pub fn get_layout(&self, app_id: u32) -> Option<LayoutEntry> {
        self.layout_registry.get(&app_id).copied()
    }

    /// Get count of active apps
    pub fn active_app_count(&self) -> usize {
        self.layout_registry.values().filter(|e| e.active).count()
    }
}

/// Check if a point is within an app's layout rectangle
fn point_in_rect(x: u32, y: u32, entry: &LayoutEntry) -> bool {
    x >= entry.x
        && x < entry.x + entry.width
        && y >= entry.y
        && y < entry.y + entry.height
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_window_manager_bytecode_new() {
        let bytecode = WindowManagerBytecode::new();
        assert!(bytecode.layout_registry.is_empty());
        assert!(bytecode.focused_app_id.is_none());
        assert_eq!(bytecode.next_app_id, 1);
    }

    #[test]
    fn test_window_manager_bytecode_layout_registry() {
        let mut bytecode = WindowManagerBytecode::new();

        // Add apps to layout registry
        let entry1 = LayoutEntry {
            x: 100,
            y: 100,
            width: 200,
            height: 200,
            app_id: 1,
            active: true,
        };
        bytecode.layout_registry.insert(1, entry1);

        let entry2 = LayoutEntry {
            x: 400,
            y: 200,
            width: 300,
            height: 250,
            app_id: 2,
            active: true,
        };
        bytecode.layout_registry.insert(2, entry2);

        // Test process intent - click in app 1
        let intent = Intent::MouseClick { x: 150, y: 150 };
        bytecode.process_intent(intent);

        // Check focus
        assert_eq!(bytecode.focused_app_id, Some(1));

        // Test hit detection
        let hit = bytecode.find_app_at(150, 150);
        assert_eq!(hit, Some(1));

        let no_hit = bytecode.find_app_at(500, 500);
        assert!(no_hit.is_none());
    }

    #[test]
    fn test_window_manager_bytecode_spawn() {
        let mut bytecode = WindowManagerBytecode::new();

        // Spawn a new app
        let spawn_intent = Intent::Custom {
            opcode: SPAWN_APP,
            payload: vec![123.0, 200.0, 400.0, 300.0, 3.0], // name_hash, x, y, w, h
        };
        bytecode.process_intent(spawn_intent);

        assert_eq!(bytecode.layout_registry.len(), 1);
        assert_eq!(bytecode.next_app_id, 2);

        let entry = bytecode.get_layout(1).unwrap();
        assert_eq!(entry.x, 200);
        assert_eq!(entry.y, 400);
        assert_eq!(entry.width, 300);
        assert_eq!(entry.height, 3);
    }

    #[test]
    fn test_window_manager_bytecode_hit_detection() {
        let mut bytecode = WindowManagerBytecode::new();

        // Add apps at different regions
        let entry1 = LayoutEntry {
            x: 100,
            y: 100,
            width: 200,
            height: 200,
            app_id: 1,
            active: true,
        };
        bytecode.layout_registry.insert(1, entry1);

        let entry2 = LayoutEntry {
            x: 400,
            y: 100,
            width: 200,
            height: 200,
            app_id: 2,
            active: true,
        };
        bytecode.layout_registry.insert(2, entry2);

        // Click in app 1 region
        let hit = bytecode.find_app_at(150, 150);
        assert_eq!(hit, Some(1));

        // Click in app 2 region
        let hit = bytecode.find_app_at(450, 150);
        assert_eq!(hit, Some(2));

        // Click in gap between apps
        let hit = bytecode.find_app_at(350, 150);
        assert!(hit.is_none());
    }

    #[test]
    fn test_window_manager_bytecode_close() {
        let mut bytecode = WindowManagerBytecode::new();

        // Add an app
        let entry = LayoutEntry {
            x: 100,
            y: 100,
            width: 200,
            height: 200,
            app_id: 1,
            active: true,
        };
        bytecode.layout_registry.insert(1, entry);
        bytecode.focused_app_id = Some(1);

        // Close the app
        let close_intent = Intent::Custom {
            opcode: CLOSE_APP,
            payload: vec![1.0],
        };
        bytecode.process_intent(close_intent);

        // Verify app is inactive
        let closed_entry = bytecode.get_layout(1).unwrap();
        assert!(!closed_entry.active);

        // Verify focus is cleared
        assert!(bytecode.focused_app_id.is_none());
    }
}
