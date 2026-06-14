//! Glyph VM Boot - Bare-metal Geometry OS Loader
//!
//! This is the "last human-written code" (~100 lines).
//! It initializes the GPU, loads the Glyph VM kernel, and boots a .rts.png program.

use anyhow::Result;
use std::sync::Arc;
use infinite_map_rs::backend::drm::GlyphVmExecutor;

#[tokio::main]
async fn main() -> Result<()> {
    env_logger::init();
    let program_path = std::env::args().nth(1).unwrap_or_else(|| "examples/hello.glyph.rts.png".to_string());
    
    // 1. Initialize GPU
    let instance = wgpu::Instance::default();
    let adapter = instance.request_adapter(&wgpu::RequestAdapterOptions::default()).await
        .ok_or_else(|| anyhow::anyhow!("No GPU adapter found"))?;
    let (device, queue) = adapter.request_device(&wgpu::DeviceDescriptor {
        required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
        ..Default::default()
    }, None).await?;
    let device = Arc::new(device);
    let queue = Arc::new(queue);

    // 2. Load Glyph VM Executor (The Kernel)
    let vm = GlyphVmExecutor::new(Arc::clone(&device), Arc::clone(&queue))?;
    println!("Glyph VM Kernel Loaded.");

    // 3. Load Program (.rts.png) into Texture (RAM)
    let img = image::open(&program_path)?.to_rgba8();
    let (width, height) = img.dimensions();
    let texture_desc = wgpu::TextureDescriptor {
        label: Some("Glyph RAM"),
        size: wgpu::Extent3d { width, height, depth_or_array_layers: 1 },
        mip_level_count: 1,
        sample_count: 1,
        dimension: wgpu::TextureDimension::D2,
        format: wgpu::TextureFormat::Rgba8Uint,
        usage: wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::COPY_SRC,
        view_formats: &[],
    };
    let ram_texture = device.create_texture(&texture_desc);
    queue.write_texture(
        wgpu::ImageCopyTexture { texture: &ram_texture, mip_level: 0, origin: wgpu::Origin3d::ZERO, aspect: wgpu::TextureAspect::All },
        &img,
        wgpu::ImageDataLayout { offset: 0, bytes_per_row: Some(width * 4), rows_per_image: Some(height) },
        texture_desc.size,
    );
    let ram_view = ram_texture.create_view(&wgpu::TextureViewDescriptor::default());
    println!("Program '{}' loaded into spatial memory.", program_path);

    // 4. Execution Loop
    println!("Booting Bare-Metal Geometry OS...");
    loop {
        let state = vm.step(&ram_view, 100)?; // Execute 100 cycles per host step
        if state.halted != 0 {
            println!("VM Halted. Status: {}, Cycles: {}", state.halted, state.cycles);
            break;
        }
        // Minimal feedback
        print!("\rCycles: {} | PC: {}", state.cycles, state.pc);
        std::io::Write::flush(&mut std::io::stdout())?;
        
        // Optional: Slow down for visualization
        // std::thread::sleep(std::time::Duration::from_millis(16));
    }

    Ok(())
}
