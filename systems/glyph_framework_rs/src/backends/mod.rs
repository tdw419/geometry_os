pub mod drm_backend;
pub mod wgpu_backend;
pub mod window_manager_bytecode;

#[cfg(feature = "drm")]
pub use drm_backend::DrmBackend;
pub use wgpu_backend::WgpuBackend;
pub use window_manager_bytecode::WindowManagerBytecode;
pub use window_manager_bytecode::{CLOSE_APP, FOCUS_CHANGE, KEY_PRESS, SPAWN_APP};

use crate::types::{AppId, AppLayout, GlyphId, Intent};

pub trait ExecutionBackend {
    /// Initialize the backend.
    fn init(&mut self) -> Result<(), String>;

    /// Allocate space and create a new application instance.
    fn spawn_app(&mut self, name: &str, layout: AppLayout) -> Result<AppId, String>;

    /// Write a specific value to an application's spatial memory.
    fn set_state(&mut self, app_id: AppId, addr: u64, value: f32) -> Result<(), String>;

    /// Read a specific value from an application's spatial memory.
    fn get_state(&mut self, app_id: AppId, addr: u64) -> Result<f32, String>;

    /// Read a range of values from an application's spatial memory.
    fn get_state_range(&mut self, app_id: AppId, addr: u64, count: u64)
        -> Result<Vec<f32>, String>;

    /// Drop an intent glyph into the application's message bus/interrupt queue.
    fn send_intent(&mut self, app_id: AppId, intent: Intent) -> Result<(), String>;

    /// Request an application to draw a glyph at a local coordinate.
    fn draw(
        &mut self,
        app_id: AppId,
        glyph_id: GlyphId,
        local_x: u32,
        local_y: u32,
    ) -> Result<(), String>;

    /// Advance the execution state (tick the VM/compute shader).
    fn step(&mut self) -> Result<(), String>;

    /// Load a SPIR-V binary into an application (for AOT backends).
    fn load_spirv(&mut self, app_id: AppId, spirv: &[u32]) -> Result<(), String>;

    /// Load the font atlas data into the backend.
    fn load_font_atlas(&mut self, atlas_data: &[u8]) -> Result<(), String>;

    /// Read the application's execution context (for debugging).
    fn get_context(&mut self, app_id: AppId) -> Result<[u32; 10], String>;

    /// Read a pixel from the global display buffer.
    fn get_display_pixel(&mut self, x: u32, y: u32) -> Result<u32, String>;

    /// Write input event to the Visual Interaction Bus.
    /// Used by CPU to inject keyboard/mouse events for GPU consumption.
    fn write_input_event(&mut self, event: InputEvent) -> Result<(), String>;

    /// Read the current input bus state (for debugging).
    fn get_input_bus_state(&mut self) -> Result<InputBusState, String>;
}

/// Visual Interaction Bus input event (20 bytes)
#[repr(C)]
#[derive(Copy, Clone, Debug, Default)]
pub struct InputEvent {
    /// Character ASCII or ScanCode
    pub code: u32,
    /// 1 = Key Down, 0 = Key Up
    pub state: u32,
    /// Modifiers bitmask (Shift=1, Ctrl=2, Alt=4, Super=8)
    pub mods: u32,
    /// Relative timestamp in milliseconds
    pub timestamp: u32,
    /// Attention weight for prioritization (0.0 = ignore, 1.0 = normal, >1.0 = boosted)
    pub attention_weight: f32,
}

/// Visual Interaction Bus state snapshot (for debugging)
#[derive(Clone, Debug, Default)]
pub struct InputBusState {
    pub magic: u32,
    pub mouse_x: f32,
    pub mouse_y: f32,
    pub mouse_btn: u32,
    pub kb_head: u32,
    pub kb_tail: u32,
    pub kb_cap: u32,
}
