use std::sync::Arc;
use wgpu;
use winit::{
    event::{Event, WindowEvent, ElementState, MouseButton},
    event_loop::{ControlFlow, EventLoop},
    window::WindowBuilder,
};
use bytemuck;
use serde_json;
use std::fs;

use infinite_map_rs::gpu::glyph_vm::{GlyphVM, Glyph};

#[tokio::main]
async fn main() {
    env_logger::init();
    let event_loop = EventLoop::new().unwrap();
    let window = WindowBuilder::new()
        .with_title("Geometry OS - Native Glyph Window Demo")
        .with_inner_size(winit::dpi::LogicalSize::new(1024.0, 768.0))
        .build(&event_loop)
        .unwrap();

    let instance = wgpu::Instance::default();
    let surface = instance.create_surface(&window).unwrap();
    let adapter = instance
        .request_adapter(&wgpu::RequestAdapterOptions {
            compatible_surface: Some(&surface),
            ..Default::default()
        })
        .await
        .unwrap();

    let (device, queue) = adapter
        .request_device(&wgpu::DeviceDescriptor::default(), None)
        .await
        .unwrap();
    let device = Arc::new(device);
    let queue = Arc::new(queue);

    let config = surface.get_default_config(&adapter, 1024, 768).unwrap();
    surface.configure(&device, &config);

    // Create Atlas and Screen Textures
    let atlas_desc = wgpu::TextureDescriptor {
        label: Some("Glyph Atlas"),
        size: wgpu::Extent3d { width: 4096, height: 4096, depth_or_array_layers: 1 },
        mip_level_count: 1,
        sample_count: 1,
        dimension: wgpu::TextureDimension::D2,
        format: wgpu::TextureFormat::Rgba8Unorm,
        usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST,
        view_formats: &[],
    };
    let atlas = device.create_texture(&atlas_desc);
    let atlas_view = atlas.create_view(&wgpu::TextureViewDescriptor::default());

    let screen_desc = wgpu::TextureDescriptor {
        label: Some("Native Screen"),
        size: wgpu::Extent3d { width: 1024, height: 768, depth_or_array_layers: 1 },
        mip_level_count: 1,
        sample_count: 1,
        dimension: wgpu::TextureDimension::D2,
        format: wgpu::TextureFormat::Rgba8Unorm,
        usage: wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_SRC | wgpu::TextureUsages::TEXTURE_BINDING,
        view_formats: &[],
    };
    let screen = device.create_texture(&screen_desc);
    let screen_view = screen.create_view(&wgpu::TextureViewDescriptor::default());

    // Initialize Glyph VM
    let mut vm = GlyphVM::new(
        device.clone(),
        queue.clone(),
        atlas_view,
        screen_view,
        1024, // program size
        1024, // memory size
        256,  // stack size
    );

    // Load Program
    let program_data = fs::read_to_string("systems/glyph_stratum/native_window_program.json").unwrap();
    let payload: serde_json::Value = serde_json::from_str(&program_data).unwrap();
    
    let mut instructions = Vec::new();
    for i in payload["program"].as_array().unwrap() {
        instructions.push(Glyph {
            opcode: i[0].as_u64().unwrap() as u32,
            stratum: i[1].as_u64().unwrap() as u32,
            p1: i[2].as_f64().unwrap() as f32,
            p2: i[3].as_f64().unwrap() as f32,
            target: i[4].as_u64().unwrap() as u32,
        });
    }
    vm.upload_program(&instructions);

    let mut memory: Vec<f32> = payload["memory"].as_array().unwrap().iter().map(|v| v.as_f64().unwrap() as f32).collect();
    vm.upload_memory(&memory);

    let mut mouse_x = 0.0;
    let mut mouse_y = 0.0;
    let mut mouse_btn = 0.0;
    let mut last_mouse_x = 0.0;
    let mut last_mouse_y = 0.0;

    event_loop.set_control_flow(ControlFlow::Poll);
    event_loop.run(move |event, elwt| {
        match event {
            Event::WindowEvent { event: WindowEvent::CloseRequested, .. } => elwt.exit(),
            Event::WindowEvent { event: WindowEvent::CursorMoved { position, .. }, .. } => {
                mouse_x = position.x as f32;
                mouse_y = position.y as f32;
            }
            Event::WindowEvent { event: WindowEvent::MouseInput { state, button: MouseButton::Left, .. }, .. } => {
                mouse_btn = if state == ElementState::Pressed { 1.0 } else { 0.0 };
            }
            Event::WindowEvent { event: WindowEvent::RedrawRequested, .. } => {
                // Update Memory with Mouse State
                let dx = mouse_x - last_mouse_x;
                let dy = mouse_y - last_mouse_y;
                
                memory[0] = mouse_x;
                memory[1] = mouse_y;
                memory[2] = mouse_btn;
                memory[3] = dx;
                memory[4] = dy;
                
                vm.upload_memory(&memory);
                
                last_mouse_x = mouse_x;
                last_mouse_y = mouse_y;

                // Step VM
                let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor::default());
                vm.step(&mut encoder);
                
                // Copy screen to surface (simplified for demo)
                // In a real app, we'd use a separate render pass or copy_texture_to_texture
                
                queue.submit(Some(encoder.finish()));
                
                let output = surface.get_current_texture().unwrap();
                let view = output.texture.create_view(&wgpu::TextureViewDescriptor::default());
                
                // Final blit to surface
                // ... (omitted for brevity in this prototype, will focus on logic)
                
                output.present();
                window.request_redraw();
            }
            _ => {}
        }
    }).unwrap();
}
