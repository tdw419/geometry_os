use crate::backends::ExecutionBackend;
use crate::types::{AppId, AppLayout, GlyphId, Intent};

pub struct AppCoordinator<B: ExecutionBackend> {
    backend: B,
}

impl<B: ExecutionBackend> AppCoordinator<B> {
    pub fn new(mut backend: B) -> Result<Self, String> {
        backend.init()?;
        Ok(Self { backend })
    }

    pub fn spawn_app(&mut self, name: &str, layout: AppLayout) -> Result<AppId, String> {
        self.backend.spawn_app(name, layout)
    }

    pub fn set_state(&mut self, app_id: AppId, addr: u64, value: f32) -> Result<(), String> {
        self.backend.set_state(app_id, addr, value)
    }

    pub fn get_state(&mut self, app_id: AppId, addr: u64) -> Result<f32, String> {
        self.backend.get_state(app_id, addr)
    }

    pub fn send_intent(&mut self, app_id: AppId, intent: Intent) -> Result<(), String> {
        self.backend.send_intent(app_id, intent)
    }

    pub fn draw(&mut self, app_id: AppId, glyph_id: GlyphId, local_x: u32, local_y: u32) -> Result<(), String> {
        self.backend.draw(app_id, glyph_id, local_x, local_y)
    }
    
    pub fn step(&mut self) -> Result<(), String> {
        self.backend.step()
    }

    pub fn get_context(&mut self, app_id: AppId) -> Result<[u32; 10], String> {
        // This requires WgpuBackend specifically, or we add it to the trait
        // For debugging, we'll try to cast or just add to trait if it's generally useful.
        // Let's add it to the backend trait for now as a "debug" method.
        self.backend.get_context(app_id)
    }
}
