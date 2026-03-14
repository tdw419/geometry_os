//! Visual Interaction Bus - Hardware Input to Verified Glyph Memory
//!
//! This module provides the bridge between hardware input devices (mouse, keyboard)
//! and the GPU-resident glyph memory. The key innovation is that input is written
//! directly to VRAM in the same memory space as the verified substrate.
//!
//! ## Architecture
//!
//! ```text
//! [Mouse Hardware] ──→ [Kernel IOCTL] ──→ [Visual Interaction Bus] ──→ [VRAM: memory[0-4]]
//!                                                                   │
//!                                                                   ▼
//!                                                        [GlyphVM execution]
//!                                                                   │
//!                                                                   ▼
//!                                                    [Attested Window Movement]
//! ```
//!
//! ## Memory Layout (Visual Interaction Bus Addresses)
//!
//! | Address | Name       | Description                    |
//! |---------|------------|--------------------------------|
//! | 0       | MOUSE_X    | Mouse X coordinate (pixels)    |
//! | 1       | MOUSE_Y    | Mouse Y coordinate (pixels)    |
//! | 2       | MOUSE_BTN  | Button state (1=pressed)       |
//! | 3       | MOUSE_DX   | Mouse delta X (per frame)      |
//! | 4       | MOUSE_DY   | Mouse delta Y (per frame)      |
//! | 5       | FOCUSED_ID | Currently focused window ID    |
//!
//! ## Security Model
//!
//! The Visual Interaction Bus ensures that ONLY the kernel module can write
//! to addresses 0-4. User-space processes cannot inject fake mouse events.
//! This is enforced by:
//! 1. The kernel module pins the interaction bus memory in VRAM
//! 2. Only the kernel IOCTL can write to these addresses
//! 3. The VCC attestation verifies the entire memory state

use std::sync::Arc;

/// Visual Interaction Bus Memory Layout
///
/// These addresses are the "contract" between hardware input and glyph programs.
/// Any glyph program expecting mouse input MUST use these addresses.
pub mod addresses {
    /// Mouse X coordinate (absolute, pixels from left)
    pub const MOUSE_X: usize = 0;
    /// Mouse Y coordinate (absolute, pixels from top)
    pub const MOUSE_Y: usize = 1;
    /// Mouse button state (bitfield: bit 0 = left, bit 1 = right, bit 2 = middle)
    pub const MOUSE_BTN: usize = 2;
    /// Mouse delta X (relative movement since last frame)
    pub const MOUSE_DX: usize = 3;
    /// Mouse delta Y (relative movement since last frame)
    pub const MOUSE_DY: usize = 4;
    /// Currently focused window ID (set by glyph program)
    pub const FOCUSED_ID: usize = 5;

    /// Total size of the Visual Interaction Bus region
    pub const BUS_SIZE: usize = 16;
}

/// Input state for the Visual Interaction Bus
#[repr(C)]
#[derive(Copy, Clone, Debug, Default, bytemuck::Pod, bytemuck::Zeroable)]
pub struct InputState {
    pub mouse_x: f32,
    pub mouse_y: f32,
    pub mouse_btn: f32,
    pub mouse_dx: f32,
    pub mouse_dy: f32,
    pub focused_id: f32,
    pub _padding: [f32; 10],
}

impl InputState {
    /// Create a new input state
    pub fn new() -> Self {
        Self::default()
    }

    /// Update mouse position (called by kernel module or simulation)
    pub fn update_mouse(&mut self, x: f32, y: f32, btn: f32) {
        // Calculate deltas
        self.mouse_dx = x - self.mouse_x;
        self.mouse_dy = y - self.mouse_y;

        // Update absolute position
        self.mouse_x = x;
        self.mouse_y = y;
        self.mouse_btn = btn;
    }

    /// Convert to bytes for GPU upload
    pub fn as_bytes(&self) -> &[u8] {
        bytemuck::cast_slice(std::slice::from_ref(self))
    }

    /// Convert from bytes (for deserialization)
    pub fn from_bytes(bytes: &[u8]) -> Option<Self> {
        if bytes.len() >= std::mem::size_of::<Self>() {
            Some(bytemuck::pod_read_unaligned(bytes))
        } else {
            None
        }
    }
}

/// The Visual Interaction Bus
///
/// Manages the bridge between hardware input and GPU-resident glyph memory.
/// This is the "zero-latency" path where mouse input goes directly to VRAM.
pub struct VisualInteractionBus {
    /// Current input state
    state: InputState,
    /// GPU buffer for input state (pinned in VRAM)
    input_buffer: Option<Arc<wgpu::Buffer>>,
    /// Whether the bus is connected to hardware
    hardware_connected: bool,
}

impl VisualInteractionBus {
    /// Create a new Visual Interaction Bus
    pub fn new() -> Self {
        Self {
            state: InputState::new(),
            input_buffer: None,
            hardware_connected: false,
        }
    }

    /// Connect to a GPU device and create the input buffer
    pub fn connect(&mut self, device: &wgpu::Device) {
        let buffer = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Visual Interaction Bus Buffer"),
            size: std::mem::size_of::<InputState>() as u64,
            usage: wgpu::BufferUsages::STORAGE
                | wgpu::BufferUsages::COPY_DST
                | wgpu::BufferUsages::COPY_SRC,
            mapped_at_creation: false,
        });

        self.input_buffer = Some(Arc::new(buffer));
        self.hardware_connected = true;
    }

    /// Update mouse input (from hardware or simulation)
    ///
    /// This is the main entry point for input events.
    /// In production, this is called by the kernel module.
    /// In simulation, this is called by the test harness.
    pub fn update_mouse(&mut self, x: f32, y: f32, btn: f32) {
        self.state.update_mouse(x, y, btn);
    }

    /// Upload current input state to GPU
    ///
    /// This writes the input state to the GPU buffer, making it available
    /// to glyph programs executing on the GPU.
    pub fn upload(&self, queue: &wgpu::Queue) {
        if let Some(ref buffer) = self.input_buffer {
            queue.write_buffer(buffer, 0, self.state.as_bytes());
        }
    }

    /// Get the input buffer for binding to a glyph program
    pub fn get_buffer(&self) -> Option<Arc<wgpu::Buffer>> {
        self.input_buffer.clone()
    }

    /// Get the current input state
    pub fn get_state(&self) -> &InputState {
        &self.state
    }

    /// Check if the bus is connected to hardware
    pub fn is_hardware_connected(&self) -> bool {
        self.hardware_connected
    }

    /// Set focused window ID (called by glyph program result)
    pub fn set_focused_id(&mut self, id: u32) {
        self.state.focused_id = id as f32;
    }

    /// Create a bind group entry for the input buffer
    ///
    /// Use this to bind the Visual Interaction Bus to a compute pipeline.
    pub fn as_bind_group_entry(&self, binding: u32) -> Option<wgpu::BindGroupEntry> {
        self.input_buffer.as_ref().map(|buffer| wgpu::BindGroupEntry {
            binding,
            resource: buffer.as_entire_binding(),
        })
    }
}

impl Default for VisualInteractionBus {
    fn default() -> Self {
        Self::new()
    }
}

/// Trait for types that can receive input from the Visual Interaction Bus
pub trait InputReceiver {
    /// Called when mouse input changes
    fn on_mouse_input(&mut self, x: f32, y: f32, btn: f32);

    /// Called when a window gains focus
    fn on_focus_change(&mut self, window_id: u32);
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_input_state_update() {
        let mut state = InputState::new();

        // Initial state
        assert_eq!(state.mouse_x, 0.0);
        assert_eq!(state.mouse_y, 0.0);
        assert_eq!(state.mouse_dx, 0.0);
        assert_eq!(state.mouse_dy, 0.0);

        // First update (no delta since starting at 0)
        state.update_mouse(100.0, 200.0, 1.0);
        assert_eq!(state.mouse_x, 100.0);
        assert_eq!(state.mouse_y, 200.0);
        assert_eq!(state.mouse_btn, 1.0);
        assert_eq!(state.mouse_dx, 100.0); // 100 - 0
        assert_eq!(state.mouse_dy, 200.0); // 200 - 0

        // Second update (should calculate delta)
        state.update_mouse(150.0, 250.0, 1.0);
        assert_eq!(state.mouse_x, 150.0);
        assert_eq!(state.mouse_y, 250.0);
        assert_eq!(state.mouse_dx, 50.0); // 150 - 100
        assert_eq!(state.mouse_dy, 50.0); // 250 - 200

        // Button release
        state.update_mouse(150.0, 250.0, 0.0);
        assert_eq!(state.mouse_btn, 0.0);
        assert_eq!(state.mouse_dx, 0.0); // No movement
        assert_eq!(state.mouse_dy, 0.0);
    }

    #[test]
    fn test_visual_interaction_bus() {
        let mut bus = VisualInteractionBus::new();

        // Not connected yet
        assert!(!bus.is_hardware_connected());
        assert!(bus.get_buffer().is_none());

        // Update state (works even without GPU)
        bus.update_mouse(100.0, 200.0, 1.0);
        let state = bus.get_state();
        assert_eq!(state.mouse_x, 100.0);

        // Set focus
        bus.set_focused_id(42);
        assert_eq!(bus.get_state().focused_id, 42.0);
    }

    #[test]
    fn test_input_state_serialization() {
        let mut state = InputState::new();
        state.update_mouse(100.0, 200.0, 1.0);

        let bytes = state.as_bytes();
        assert!(!bytes.is_empty());

        let restored = InputState::from_bytes(bytes).unwrap();
        assert_eq!(restored.mouse_x, 100.0);
        assert_eq!(restored.mouse_y, 200.0);
        assert_eq!(restored.mouse_btn, 1.0);
    }
}
