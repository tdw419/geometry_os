use crate::backends::ExecutionBackend;
use crate::types::{AppId, AppLayout, GlyphId, Intent};
use std::collections::HashMap;
use std::sync::Arc;

#[cfg(feature = "drm")]
use infinite_map_rs::backend::drm::{DrmGlyphExecutor, GlyphError, GlyphOutput, KmsScanout};

#[cfg(feature = "drm")]
pub struct DrmBackend {
    executor: DrmGlyphExecutor,
    scanout: KmsScanout,
    apps: HashMap<AppId, DrmApp>,
    next_id: u64,
}

#[cfg(feature = "drm")]
struct DrmApp {
    #[allow(dead_code)]
    name: String,
    layout: AppLayout,
    spirv: Vec<u32>,
    inputs: Vec<u8>,
    output: Option<GlyphOutput>,
}

#[cfg(feature = "drm")]
impl DrmBackend {
    pub async fn new() -> Result<Self, String> {
        let instance = wgpu::Instance::default();
        let adapter = instance.request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::HighPerformance,
            compatible_surface: None,
            force_fallback_adapter: false,
        }).await.ok_or("Failed to find GPU adapter")?;

        let (device, queue) = adapter.request_device(&wgpu::DeviceDescriptor::default(), None)
            .await.map_err(|e| e.to_string())?;

        let device = Arc::new(device);
        let queue = Arc::new(queue);

        let executor = DrmGlyphExecutor::new(device, queue);
        let scanout = KmsScanout::new().map_err(|e| e.to_string())?;

        Ok(Self {
            executor,
            scanout,
            apps: HashMap::new(),
            next_id: 1,
        })
    }
}

#[cfg(feature = "drm")]
impl ExecutionBackend for DrmBackend {
    fn init(&mut self) -> Result<(), String> {
        Ok(())
    }

    fn spawn_app(&mut self, name: &str, layout: AppLayout) -> Result<AppId, String> {
        let id = AppId(self.next_id);
        self.next_id += 1;

        let app = DrmApp {
            name: name.to_string(),
            layout,
            spirv: Vec::new(),
            inputs: vec![0u8; 4096], // 1024 * 4
            output: None,
        };

        self.apps.insert(id, app);
        Ok(id)
    }

    fn set_state(&mut self, app_id: AppId, addr: u64, value: f32) -> Result<(), String> {
        let app = self.apps.get_mut(&app_id).ok_or("App not found")?;
        let byte_addr = (addr * 4) as usize;
        if byte_addr + 4 > app.inputs.len() {
            return Err("Address out of bounds".to_string());
        }
        let bytes = value.to_ne_bytes();
        app.inputs[byte_addr..byte_addr+4].copy_from_slice(&bytes);
        Ok(())
    }

    fn get_state(&mut self, app_id: AppId, addr: u64) -> Result<f32, String> {
        let app = self.apps.get(&app_id).ok_or("App not found")?;
        let byte_addr = (addr * 4) as usize;
        if byte_addr + 4 > app.inputs.len() {
            return Err("Address out of bounds".to_string());
        }
        let mut bytes = [0u8; 4];
        bytes.copy_from_slice(&app.inputs[byte_addr..byte_addr+4]);
        Ok(f32::from_ne_bytes(bytes))
    }

    fn get_state_range(&mut self, app_id: AppId, addr: u64, count: u64) -> Result<Vec<f32>, String> {
        let app = self.apps.get(&app_id).ok_or("App not found")?;
        let mut results = Vec::with_capacity(count as usize);
        for i in 0..count {
            let byte_addr = ((addr + i) * 4) as usize;
            if byte_addr + 4 > app.inputs.len() {
                return Err("Address out of bounds".to_string());
            }
            let mut bytes = [0u8; 4];
            bytes.copy_from_slice(&app.inputs[byte_addr..byte_addr+4]);
            results.push(f32::from_ne_bytes(bytes));
        }
        Ok(results)
    }

    fn send_intent(&mut self, _app_id: AppId, _intent: Intent) -> Result<(), String> {
        Ok(())
    }

    fn draw(&mut self, _app_id: AppId, _glyph_id: GlyphId, _local_x: u32, _local_y: u32) -> Result<(), String> {
        Ok(())
    }

    fn step(&mut self) -> Result<(), String> {
        for app in self.apps.values_mut() {
            if !app.spirv.is_empty() {
                self.executor.load_spirv(&app.spirv).map_err(|e| e.to_string())?;
                let (output, _memory) = self.executor.execute(&app.inputs, (app.layout.width, app.layout.height))
                    .map_err(|e| e.to_string())?;
                
                app.output = Some(output);
            }
        }
        Ok(())
    }

    fn load_spirv(&mut self, app_id: AppId, spirv: &[u32]) -> Result<(), String> {
        let app = self.apps.get_mut(&app_id).ok_or("App not found")?;
        app.spirv = spirv.to_vec();
        Ok(())
    }

    fn load_font_atlas(&mut self, _atlas_data: &[u8]) -> Result<(), String> {
        Ok(())
    }

    fn get_context(&mut self, _app_id: AppId) -> Result<[u32; 10], String> {
        Ok([0; 10])
    }
}
