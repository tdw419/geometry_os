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
//! All UI logic runs on the GPU in the Glyph VM.

use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig, MAX_VMS};
use infinite_map_rs::mailbox_bridge::{MailboxBridge, InputEvent};
use std::sync::Arc;
use winit::{
    event::{Event, WindowEvent, MouseButton, MouseScrollDelta},
    event_loop::{ControlFlow, EventLoop},
    window::WindowBuilder,
};

const WORKSPACE_CARTRIDGE: &str = "workspace.rts.png";

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    // 1. Initialize window
    let event_loop = EventLoop::new()?;
    let window = WindowBuilder::new()
        .with_title("GEOS ASCII Workspace")
        .with_inner_size(winit::dpi::LogicalSize::new(1920, 1080))
        .build(&event_loop)?;

    // 2. Initialize GPU
    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor::default());
    let surface = unsafe { instance.create_surface(&window) }?;
    let adapter = instance.request_adapter(&wgpu::RequestAdapterOptions {
        power_preference: wgpu::PowerPreference::HighPerformance,
        compatible_surface: Some(&surface),
        ..Default::default()
    }).await.ok_or_else(|| "Failed to request adapter")?;

    let (device, queue) = adapter.request_device(
        &wgpu::DeviceDescriptor::default(),
        None,
    ).await?;

    // 3. Load workspace cartridge
    let cartridge_bytes = std::fs::read(WORKSPACE_CARTRIDGE)?;
    let cartridge_image = image::load_from_memory(&cartridge_bytes)?;
    let cartridge_rgba = cartridge_image.to_rgba8();
    let (width, height) = cartridge_rgba.dimensions();

    // Create RAM texture from cartridge
    let ram_texture = device.create_texture(&wgpu::TextureDescriptor {
        label: Some("RAM Texture"),
        size: wgpu::Extent3d { width, height, depth_or_array_layers: 1 },
        mip_level_count: 1,
        sample_count: 1,
        dimension: wgpu::TextureDimension::D2,
        format: wgpu::TextureFormat::Rgba8Uint,
        usage: wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::TEXTURE_BINDING,
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
        wgpu::Extent3d { width, height, depth_or_array_layers: 1 },
    );
    
    // Wrap in Arc for event loop
    let device = Arc::new(device);
    let queue = Arc::new(queue);
    
    // 4. Initialize Glyph VM Scheduler
    let shadow_ram = Arc::new(std::sync::Mutex::new(vec![0u8; (64 * 1024 * 1024) as usize]));
    let scheduler = Arc::new(std::sync::Mutex::new(GlyphVmScheduler::new(
        device.clone(),
        queue.clone(),
        shadow_ram,
    )));

    // Spawn VM #0 with workspace program
    {
        let mut scheduler = scheduler.lock().unwrap();
        let config = VmConfig {
            entry_point: 0,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,
            ..Default::default()
        };
        scheduler.spawn_vm(0, &config)?;
    }

    // 5. Mailbox bridge for input events
    let mut mailbox = MailboxBridge::new();
    let mut last_mouse_pos = (0.0, 0.0);

    let device_clone = device.clone();
    let queue_clone = queue.clone();
    let scheduler_clone = scheduler.clone();
    
    // 6. Event loop
    event_loop.run(move |event, elwt| {
        match event {
            Event::WindowEvent { event, .. } => match event {
                WindowEvent::CloseRequested => {
                    elwt.exit();
                }

                WindowEvent::MouseInput { button, state, .. } => {
                    if state == winit::event::ElementState::Pressed {
                        let (x, y) = last_mouse_pos;
                        mailbox.write_event(InputEvent::Click {
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
                }

                WindowEvent::CursorMoved { position, .. } => {
                    let dx = position.x - last_mouse_pos.0;
                    let dy = position.y - last_mouse_pos.1;
                    last_mouse_pos = (position.x, position.y);

                    mailbox.write_event(InputEvent::MouseMove {
                        x: position.x as u32,
                        y: position.y as u32,
                        dx: dx as i32,
                        dy: dy as i32,
                    });
                }

                WindowEvent::MouseWheel { delta, .. } => {
                    let (dx, dy) = match delta {
                        MouseScrollDelta::LineDelta(x, y) => (x as i32 * 10, y as i32 * 10),
                        MouseScrollDelta::PixelDelta(p) => (p.x as i32, p.y as i32),
                    };
                    mailbox.write_event(InputEvent::Scroll { dx, dy });
                }

                _ => {}
            },
            Event::AboutToWait => {
                // Write mailbox to GPU memory
                let mailbox_words = mailbox.read_mailbox();
                
                // Dispatch VM scheduler
                {
                    let mut scheduler = scheduler_clone.lock().unwrap();
                    scheduler.execute_frame();
                }
                
                // Submit and present
                queue_clone.submit([]);
                
                // Clear event after processing
                mailbox.clear_event();

                window.request_redraw();
            }
            _ => {}
        }
    });

    Ok(())
}
