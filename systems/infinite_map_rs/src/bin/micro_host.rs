// src/bin/micro_host.rs
//! Micro-Host - Minimal GPU Bootloader for ASCII Workspace
//!
//! This is NOT a compositor. It's a thin shim that:
//! 1. Opens a window (winit)
//! 2. Initializes GPU (wgpu)
//! 3. Loads workspace.rts.png into texture
//! 4. Forwards input events to VM mailbox
//! 5. Dispatches compute shader 60 times/sec
//! 6. Blits RAM texture to screen
//!
//! All UI logic runs on the GPU in Glyph VM.

use std::sync::Arc;

use infinite_map_rs::glyph_vm_scheduler::GlyphVmScheduler;
use infinite_map_rs::mailbox_bridge::MailboxBridge;
use winit::{
    event::{Event, MouseButton, MouseScrollDelta, WindowEvent},
    event_loop::EventLoop,
    window::WindowBuilder,
};

const WORKSPACE_CARTRIDGE: &str = "workspace.rts.png";

fn main() -> Result<(), Box<dyn std::error::Error>> {
    // 1. Initialize window
    let event_loop = EventLoop::new().unwrap();
    let window = Arc::new(
        WindowBuilder::new()
            .with_title("GEOS ASCII Workspace")
            .with_inner_size(winit::dpi::LogicalSize::new(1920, 1080))
            .build(&event_loop)
            .unwrap(),
    );

    // 2. Initialize GPU
    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor::default());
    let surface = instance.create_surface(window.clone())?;
    let adapter = match pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
        power_preference: wgpu::PowerPreference::HighPerformance,
        compatible_surface: Some(&surface),
        ..Default::default()
    })) {
        Some(a) => a,
        None => {
            eprintln!("[GPU] No suitable GPU adapter found");
            std::process::exit(1);
        },
    };

    let (device, queue) = match pollster::block_on(
        adapter.request_device(&wgpu::DeviceDescriptor::default(), None),
    ) {
        Ok((d, q)) => (Arc::new(d), Arc::new(q)),
        Err(e) => {
            eprintln!("[GPU] Failed to create device: {}", e);
            std::process::exit(1);
        },
    };

    // 3. Load workspace cartridge
    let cartridge_bytes = std::fs::read(WORKSPACE_CARTRIDGE)?;
    let cartridge_image = image::load_from_memory(&cartridge_bytes)?;
    let cartridge_rgba = cartridge_image.to_rgba8();
    let (width, height) = cartridge_rgba.dimensions();

    // Create RAM texture from cartridge
    let ram_texture = device.create_texture(&wgpu::TextureDescriptor {
        label: Some("RAM Texture"),
        size: wgpu::Extent3d {
            width,
            height,
            depth_or_array_layers: 1,
        },
        mip_level_count: 1,
        sample_count: 1,
        dimension: wgpu::TextureDimension::D2,
        format: wgpu::TextureFormat::Rgba8Unorm,
        usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST,
        view_formats: &[],
    });

    queue.write_texture(
        wgpu::ImageCopyTexture {
            texture: &ram_texture,
            mip_level: 0,
            origin: wgpu::Origin3d::ZERO,
            aspect: wgpu::TextureAspect::All,
        },
        &cartridge_rgba,
        wgpu::ImageDataLayout {
            offset: 0,
            bytes_per_row: Some(width * 4),
            rows_per_image: Some(height),
        },
        wgpu::Extent3d {
            width,
            height,
            depth_or_array_layers: 1,
        },
    );

    // 4. Initialize Glyph VM Scheduler
    let shadow_ram = std::sync::Arc::new(std::sync::Mutex::new(vec![0u8; 64 * 1024 * 1024]));
    let mut scheduler = GlyphVmScheduler::new(device.clone(), queue.clone(), shadow_ram.clone());
    scheduler.set_ram_texture(std::sync::Arc::new(ram_texture));

    // Spawn VM #0 with workspace program
    let config = infinite_map_rs::glyph_vm_scheduler::VmConfig {
        entry_point: 0,
        parent_id: 0xFF,
        base_addr: 0,
        bound_addr: 0,
        ..Default::default()
    };
    scheduler.spawn_vm(0, &config)?;

    // 5. Mailbox bridge for input events
    let mut mailbox = MailboxBridge::new();
    let mut last_mouse_pos = (0.0, 0.0);

    // Configure surface
    let surface_caps = surface.get_capabilities(&adapter);
    let surface_format = surface_caps
        .formats
        .iter()
        .find(|f| f.is_srgb())
        .copied()
        .unwrap_or(surface_caps.formats[0]);

    let surface_config = wgpu::SurfaceConfiguration {
        usage: wgpu::TextureUsages::RENDER_ATTACHMENT,
        format: surface_format,
        width: 1920,
        height: 1080,
        present_mode: wgpu::PresentMode::Fifo,
        alpha_mode: wgpu::CompositeAlphaMode::Auto,
        view_formats: vec![],
        desired_maximum_frame_latency: 2,
    };
    surface.configure(&device, &surface_config);
    window.set_decorations(false);

    // 6. Event loop
    event_loop.run(move |event, elwt| {
        match event {
            Event::WindowEvent { event, .. } => match event {
                WindowEvent::CloseRequested => {
                    elwt.exit();
                },
                WindowEvent::MouseInput { button, state, .. } => {
                    if state == winit::event::ElementState::Pressed {
                        let (x, y) = last_mouse_pos;
                        mailbox.write_event(infinite_map_rs::mailbox_bridge::InputEvent::Click {
                            x: x as u32,
                            y: y as u32,
                            button: match button {
                                MouseButton::Left => 1,
                                MouseButton::Right => 2,
                                MouseButton::Middle => 3,
                                _ => 0,
                            },
                        });
                    }
                },
                WindowEvent::CursorMoved { position, .. } => {
                    let dx = position.x - last_mouse_pos.0;
                    let dy = position.y - last_mouse_pos.1;
                    last_mouse_pos = (position.x, position.y);

                    mailbox.write_event(infinite_map_rs::mailbox_bridge::InputEvent::MouseMove {
                        x: position.x as u32,
                        y: position.y as u32,
                        dx: dx as i32,
                        dy: dy as i32,
                    });
                },
                WindowEvent::MouseWheel { delta, .. } => {
                    let (dx, dy) = match delta {
                        MouseScrollDelta::LineDelta(x, y) => (x as i32 * 10, y as i32 * 10),
                        MouseScrollDelta::PixelDelta(p) => (p.x as i32, p.y as i32),
                    };
                    mailbox.write_event(infinite_map_rs::mailbox_bridge::InputEvent::Scroll {
                        dx,
                        dy,
                    });
                },
                _ => {},
            },
            Event::AboutToWait => {
                // Write mailbox to GPU shadow RAM
                let mailbox_words = mailbox.read_mailbox();
                scheduler.write_mailbox(0, &mailbox_words);

                // Dispatch VM scheduler
                scheduler.execute_frame();

                // Submit and present
                queue.submit([]);

                // Clear event after processing
                mailbox.clear_event();

                window.request_redraw();
            },
            _ => {},
        }
    })?;

    Ok(())
}
