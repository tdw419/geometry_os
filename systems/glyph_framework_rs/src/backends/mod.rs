pub mod wgpu_backend;
pub use wgpu_backend::WgpuBackend;

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
    
    /// Drop an intent glyph into the application's message bus/interrupt queue.
    fn send_intent(&mut self, app_id: AppId, intent: Intent) -> Result<(), String>;
    
    /// Request an application to draw a glyph at a local coordinate.
    fn draw(&mut self, app_id: AppId, glyph_id: GlyphId, local_x: u32, local_y: u32) -> Result<(), String>;
    
    /// Advance the execution state (tick the VM/compute shader).
    fn step(&mut self) -> Result<(), String>;

    /// Read the application's execution context (for debugging).
    fn get_context(&mut self, app_id: AppId) -> Result<[u32; 10], String>;
}
