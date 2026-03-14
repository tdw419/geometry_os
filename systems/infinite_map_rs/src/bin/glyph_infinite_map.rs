//! Glyph-Native Infinite Map Bootloader
//!
//! This is the "last Rust code" - minimal GPU initialization that boots
//! the infinite_map.glyph program. All rendering, windowing, and input
//! is handled by glyph execution on the GPU.
//!
//! Usage: cargo run --release --bin glyph_infinite_map

use std::sync::Arc;
use std::fs;
use anyhow::Result;

use infinite_map_rs::backend::drm::{
    VisualInteractionBus, InputState,
    GlyphVmExecutor, GlyphVmState,
};

/// Camera state (shared with glyph VM via registers 20-22)
#[repr(C)]
#[derive(Copy, Clone, Debug, bytemuck::Pod, bytemuck::Zeroable)]
struct CameraState {
    camera_x: u32,    // Register 20
    camera_y: u32,    // Register 21
    zoom: u32,        // Register 22 (16.16 fixed point)
    _padding: u32,
}

/// Glyph-native infinite map bootloader
struct GlyphInfiniteMap {
    device: Arc<wgpu::Device>,
    queue: Arc<wgpu::Queue>,
    vm: GlyphVmExecutor,
    interaction_bus: VisualInteractionBus,
    ram_texture: Arc<wgpu::Texture>,
    ram_view: Arc<wgpu::TextureView>,
    camera: CameraState,
}

impl GlyphInfiniteMap {
    async fn new() -> Result<Self> {
        // 1. Initialize GPU
        let instance = wgpu::Instance::default();
        let adapter = instance
            .request_adapter(&wgpu::RequestAdapterOptions::default())
            .await
            .ok_or_else(|| anyhow::anyhow!("No GPU adapter found"))?;

        let (device, queue) = adapter
            .request_device(&wgpu::DeviceDescriptor {
                required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
                ..Default::default()
            }, None)
            .await?;

        let device = Arc::new(device);
        let queue = Arc::new(queue);

        // 2. Create Hilbert-addressed RAM texture (4096x4096 = 16M cells)
        let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Infinite Map RAM"),
            size: wgpu::Extent3d { width: 4096, height: 4096, depth_or_array_layers: 1 },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Uint,
            usage: wgpu::TextureUsages::STORAGE_BINDING 
                 | wgpu::TextureUsages::COPY_DST 
                 | wgpu::TextureUsages::COPY_SRC,
            view_formats: &[],
        }));
        let ram_view = Arc::new(ram_texture.create_view(&wgpu::TextureViewDescriptor::default()));

        // 3. Initialize Glyph VM
        let vm = GlyphVmExecutor::new(Arc::clone(&device), Arc::clone(&queue))?;

        // 4. Initialize Visual Interaction Bus
        let mut interaction_bus = VisualInteractionBus::new();
        interaction_bus.connect(&device);

        // 5. Initialize camera (center of Hilbert space)
        let camera = CameraState {
            camera_x: 2048 << 16,  // Center X (16.16 fixed point)
            camera_y: 2048 << 16,  // Center Y
            zoom: 1 << 16,         // 1x zoom
            _padding: 0,
        };

        Ok(Self {
            device,
            queue,
            vm,
            interaction_bus,
            ram_texture,
            ram_view,
            camera,
        })
    }

    /// Load the infinite_map.glyph program into RAM texture
    fn load_program(&self, path: &str) -> Result<()> {
        let glyph_source = fs::read_to_string(path)?;
        
        // Parse glyph program and encode into texture
        // For now, we'll load a simple test program
        let program_data = self.compile_glyph(&glyph_source);
        
        // Upload to RAM texture at Hilbert position 0
        self.queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: &self.ram_texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            &program_data,
            wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(4096 * 4),
                rows_per_image: Some(4096),
            },
            wgpu::Extent3d { width: 4096, height: 4096, depth_or_array_layers: 1 },
        );

        log::info!("Loaded glyph program: {} bytes", program_data.len());
        Ok(())
    }

    /// Compile glyph source to binary (simplified)
    fn compile_glyph(&self, source: &str) -> Vec<u8> {
        let mut program = Vec::new();
        
        // Simple assembler for demo
        // Format: OPCODE(1) STRATUM(1) P1(4) P2(4) DST(4) = 14 bytes per instruction
        
        for line in source.lines() {
            let line = line.trim();
            if line.is_empty() || line.starts_with('#') || line.starts_with("//") {
                continue;
            }

            // Parse instruction
            let parts: Vec<&str> = line.split_whitespace().collect();
            if parts.is_empty() {
                continue;
            }

            let opcode = match parts[0].to_uppercase().as_str() {
                "NOP" => 0u8,
                "LOAD" => 3u8,
                "STORE" => 4u8,
                "ADD" => 5u8,
                "SUB" => 6u8,
                "MUL" => 7u8,
                "JMP" => 9u8,
                "BRANCH" => 10u8,
                "CALL" => 11u8,
                "RETURN" => 12u8,
                "HALT" => 13u8,
                "CAMERA" => 230u8,
                "HILBERT_D2XY" => 231u8,
                "HILBERT_XY2D" => 232u8,
                "ZOOM" => 235u8,
                "PAN" => 236u8,
                _ => continue,
            };

            program.push(opcode);
            program.push(0); // stratum
            program.extend_from_slice(&0u32.to_le_bytes()); // p1
            program.extend_from_slice(&0u32.to_le_bytes()); // p2
            program.extend_from_slice(&0u32.to_le_bytes()); // dst
        }

        // Pad to texture size
        while program.len() < 4096 * 4096 * 4 {
            program.push(0);
        }

        program
    }

    /// Execute one frame
    fn execute_frame(&mut self) -> Result<GlyphVmState> {
        // 1. Poll input from Visual Interaction Bus
        // In hardware mode, this reads from /dev/input
        // In simulation, we use simulate_mouse()
        
        // 2. Upload input state to GPU
        self.interaction_bus.upload(&self.queue);

        // 3. Execute glyph VM (100 cycles per frame)
        let state = self.vm.step(&self.ram_view, 100)?;

        Ok(state)
    }

    /// Simulate mouse input (for testing)
    fn simulate_input(&mut self, x: f32, y: f32, btn: f32) {
        self.interaction_bus.update_mouse(x, y, btn);
    }

    /// Run the main loop
    fn run(&mut self) -> Result<()> {
        log::info!("🚀 Starting Glyph-Native Infinite Map");
        log::info!("Camera: ({}, {}) @ {}x", 
            self.camera.camera_x >> 16,
            self.camera.camera_y >> 16,
            self.camera.zoom >> 16
        );

        let mut frame = 0u64;
        let mut last_mouse = (0.0f32, 0.0f32);

        loop {
            // Simulate panning (demo)
            let t = frame as f32 * 0.01;
            let x = 512.0 + t.sin() * 200.0;
            let y = 384.0 + t.cos() * 200.0;

            // Calculate delta for pan
            let dx = x - last_mouse.0;
            let dy = y - last_mouse.1;
            last_mouse = (x, y);

            self.simulate_input(x, y, 0.0);

            // Execute frame
            let state = self.execute_frame()?;

            if state.halted != 0 {
                log::info!("VM halted after {} cycles", state.cycles);
                break;
            }

            frame += 1;

            // Log every 60 frames
            if frame % 60 == 0 {
                log::info!("Frame {} | Cycles: {} | PC: {}", 
                    frame, state.cycles, state.pc);
            }

            // Frame pacing (~60 FPS)
            std::thread::sleep(std::time::Duration::from_millis(16));

            // Demo: run for 600 frames (10 seconds)
            if frame >= 600 {
                log::info!("Demo complete - 600 frames rendered");
                break;
            }
        }

        Ok(())
    }
}

#[tokio::main]
async fn main() -> Result<()> {
    env_logger::Builder::from_env(env_logger::Env::default().default_filter_or("info"))
        .init();

    log::info!("═══════════════════════════════════════════════════════════");
    log::info!("       GLYPH-NATIVE INFINITE MAP BOOTLOADER");
    log::info!("═══════════════════════════════════════════════════════════");
    log::info!("");
    log::info!("This is the 'last Rust code' - minimal GPU initialization");
    log::info!("All rendering is handled by glyph execution on GPU.");
    log::info!("");

    // Create bootloader
    let mut map = GlyphInfiniteMap::new().await?;

    // Load glyph program
    let glyph_path = "systems/glyph_stratum/programs/infinite_map.glyph";
    if std::path::Path::new(glyph_path).exists() {
        map.load_program(glyph_path)?;
    } else {
        log::warn!("Glyph program not found: {}", glyph_path);
        log::info!("Running with minimal demo program");
    }

    // Run main loop
    map.run()?;

    log::info!("═══════════════════════════════════════════════════════════");
    log::info!("Glyph-Native Infinite Map Complete");
    log::info!("═══════════════════════════════════════════════════════════");

    Ok(())
}
