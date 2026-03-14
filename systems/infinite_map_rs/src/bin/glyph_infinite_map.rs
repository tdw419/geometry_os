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
use infinite_map_rs::glyph_stratum::glyph_compiler::compile_glyph_source;

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
        let program_data = self.compile_glyph(&glyph_source);

        // Calculate texture dimensions needed
        let pixel_count = program_data.len() / 4;
        let texture_size = (pixel_count as f64).sqrt().ceil() as u32;
        let texture_dim = texture_size.next_power_of_two().max(64);

        // Pad program data to match the texture dimensions
        let row_bytes = texture_dim * 4;
        let total_bytes = (texture_dim * texture_dim) as usize * 4;
        let mut padded_data = vec![0u8; total_bytes];

        // Copy program data row by row
        for (i, chunk) in program_data.chunks(4).enumerate() {
            let x = i as u32 % texture_dim;
            let y = i as u32 / texture_dim;
            let offset = (y * row_bytes + x * 4) as usize;
            if offset + 4 <= padded_data.len() {
                padded_data[offset..offset + 4].copy_from_slice(chunk);
            }
        }

        // Upload to RAM texture
        self.queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: &self.ram_texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            &padded_data,
            wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(row_bytes),
                rows_per_image: Some(texture_dim),
            },
            wgpu::Extent3d { width: texture_dim, height: texture_dim, depth_or_array_layers: 1 },
        );

        log::info!("Loaded glyph program: {} bytes into {}x{} texture",
            program_data.len(), texture_dim, texture_dim);
        Ok(())
    }

    /// Compile glyph source to binary using proper GlyphStratum compiler
    fn compile_glyph(&self, source: &str) -> Vec<u8> {
        match compile_glyph_source(source) {
            Ok(compiled) => {
                log::info!(
                    "Compiled {} instructions, entry point at Hilbert {}",
                    compiled.instruction_count,
                    compiled.entry_point
                );
                compiled.texture_data
            }
            Err(e) => {
                log::error!("Glyph compilation failed: {}", e);
                log::info!("Falling back to simple demo program");
                self.compile_simple_demo()
            }
        }
    }

    /// Simple demo program as fallback
    fn compile_simple_demo(&self) -> Vec<u8> {
        let mut program = Vec::new();

        // Simple program: count and halt
        // NOP (0), ADD (5), HALT (13)
        let instructions: [(u8, u8, u8, u8); 10] = [
            (0, 2, 0, 0),    // NOP
            (5, 2, 0, 1),    // ADD r1 = r0 + r1 (counter)
            (5, 2, 1, 1),    // ADD r1 = r1 + 1
            (5, 2, 1, 1),    // ADD r1 = r1 + 1
            (5, 2, 1, 1),    // ADD r1 = r1 + 1
            (5, 2, 1, 1),    // ADD r1 = r1 + 1
            (5, 2, 1, 1),    // ADD r1 = r1 + 1
            (5, 2, 1, 1),    // ADD r1 = r1 + 1
            (5, 2, 1, 1),    // ADD r1 = r1 + 1
            (13, 2, 0, 0),   // HALT
        ];

        for (opcode, stratum, p1, p2) in instructions {
            program.push(opcode);
            program.push(stratum);
            program.push(p1);
            program.push(p2);
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

    // Load glyph program - try multiple paths
    let glyph_paths = [
        "systems/glyph_stratum/programs/infinite_map.glyph",  // From project root
        "../../systems/glyph_stratum/programs/infinite_map.glyph",  // From systems/infinite_map_rs
        concat!(env!("CARGO_MANIFEST_DIR"), "/../../glyph_stratum/programs/infinite_map.glyph"),  // Absolute
    ];

    let mut loaded = false;
    for glyph_path in &glyph_paths {
        if std::path::Path::new(glyph_path).exists() {
            log::info!("Loading glyph program: {}", glyph_path);
            map.load_program(glyph_path)?;
            loaded = true;
            break;
        }
    }

    if !loaded {
        log::warn!("Glyph program not found in any location");
        log::info!("Running with minimal demo program");
    }

    // Run main loop
    map.run()?;

    log::info!("═══════════════════════════════════════════════════════════");
    log::info!("Glyph-Native Infinite Map Complete");
    log::info!("═══════════════════════════════════════════════════════════");

    Ok(())
}
