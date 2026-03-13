use crate::backends::ExecutionBackend;
use crate::types::{AppId, AppLayout, GlyphId, Intent};

pub struct AppCoordinator<B: ExecutionBackend> {
    backend: B,
}

impl<B: ExecutionBackend> AppCoordinator<B> {
    pub fn new(mut backend: B) -> Result<Self, String> {
        backend.init()?;

        // Load font atlas
        let atlas_paths = [
            "systems/glyph_stratum/font_8x8.raw",
            "../glyph_stratum/font_8x8.raw",
            "../../systems/glyph_stratum/font_8x8.raw",
        ];

        let mut atlas_data = None;
        for path in atlas_paths {
            if let Ok(data) = std::fs::read(path) {
                atlas_data = Some(data);
                break;
            }
        }

        let atlas_data = atlas_data.ok_or_else(|| "Failed to find font_8x8.raw atlas file in any standard location".to_string())?;
        backend.load_font_atlas(&atlas_data)?;

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

    pub fn get_state_range(&mut self, app_id: AppId, addr: u64, count: u64) -> Result<Vec<f32>, String> {
        self.backend.get_state_range(app_id, addr, count)
    }

    /// Sync spatial state from the WindowManager (App #0) to the Coordinator.
    pub fn sync_spatial_state(&mut self) -> Result<(), String> {
        let system_app = AppId(0);
        
        // 1. Read FOCUSED_ID
        let focused_id = self.get_state(system_app, 11)?;
        log::debug!("Focused App ID: {}", focused_id);

        // 2. Read REGION_TABLE (First 10 entries for now)
        let app_count = self.get_state(system_app, 10)? as u64;
        if app_count > 0 {
            let region_data = self.get_state_range(system_app, 20, app_count * 5)?;
            for i in 0..app_count as usize {
                let base = i * 5;
                let x = region_data[base];
                let y = region_data[base+1];
                let w = region_data[base+2];
                let h = region_data[base+3];
                let id = region_data[base+4];
                log::debug!("App {} Registry: x={}, y={}, w={}, h={}", id, x, y, w, h);
                
                // Here we would update internal scanout state in the backend
            }
        }

        Ok(())
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

    pub fn load_spirv(&mut self, app_id: AppId, spirv: &[u32]) -> Result<(), String> {
        self.backend.load_spirv(app_id, spirv)
    }

    pub fn get_context(&mut self, app_id: AppId) -> Result<[u32; 10], String> {
        // This requires WgpuBackend specifically, or we add it to the trait
        // For debugging, we'll try to cast or just add to trait if it's generally useful.
        // Let's add it to the backend trait for now as a "debug" method.
        self.backend.get_context(app_id)
    }

    pub fn get_display_pixel(&mut self, x: u32, y: u32) -> Result<u32, String> {
        self.backend.get_display_pixel(x, y)
    }
}
