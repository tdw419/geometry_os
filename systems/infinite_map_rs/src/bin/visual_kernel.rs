//! Visual Kernel Boot CLI with Window Rendering
//!
//! Boots the Geometry OS Visual Kernel, which loads the Window Manager
//! as VM #0 and renders executing VMs as visible windows on screen.
//!
//! Usage:
//!   cargo run --release --bin visual_kernel [--headless] [--ubuntu path/to/ubuntu.rts.png]

use std::sync::Arc;
use std::time::{Duration, Instant};

use winit::{
    event::{Event, WindowEvent},
    event_loop::{ControlFlow, EventLoop},
    window::WindowBuilder,
};

use infinite_map_rs::glyph_window_renderer::{GlyphWindowRenderer, WindowInstance, get_state_color};
use infinite_map_rs::visual_kernel_boot::VisualKernelConfig;
use infinite_map_rs::glyph_vm_scheduler::vm_state;

fn main() {
    env_logger::Builder::from_env(env_logger::Env::default().default_filter_or("info")).init();

    // Parse arguments
    let args: Vec<String> = std::env::args().collect();
    let headless = args.iter().any(|a| a == "--headless");
    let ubuntu_path = args.iter()
        .position(|a| a == "--ubuntu")
        .and_then(|i| args.get(i + 1).map(|s| s.clone()));

    println!();
    println!("  ╔═══════════════════════════════════════════════════════════════╗");
    println!("  ║              GEOMETRY OS - Visual Kernel Boot                 ║");
    println!("  ║                                                               ║");
    println!("  ║   The screen IS the CPU. Every glyph IS an instruction.      ║");
    println!("  ║   This is not a simulation. This is the real thing.          ║");
    println!("  ╚═══════════════════════════════════════════════════════════════╝");
    println!();

    if headless {
        run_headless(ubuntu_path);
    } else {
        run_with_window(ubuntu_path);
    }
}

fn run_with_window(ubuntu_path: Option<String>) {
    println!("[GPU] Initializing WebGPU with window surface...");

    let event_loop = EventLoop::new().unwrap();
    let window = Arc::new(
        WindowBuilder::new()
            .with_title("Geometry OS - Visual Kernel")
            .with_inner_size(winit::dpi::LogicalSize::new(1280.0, 720.0))
            .build(&event_loop)
            .unwrap()
    );

    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
        backends: wgpu::Backends::all(),
        ..Default::default()
    });

    let surface = instance.create_surface(window.clone()).unwrap();

    let adapter = match pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
        power_preference: wgpu::PowerPreference::HighPerformance,
        compatible_surface: Some(&surface),
        force_fallback_adapter: false,
    })) {
        Some(a) => a,
        None => {
            eprintln!("[GPU] No suitable GPU adapter found");
            std::process::exit(1);
        }
    };

    let (device, queue) = match pollster::block_on(adapter.request_device(
        &wgpu::DeviceDescriptor {
            label: Some("Geometry OS GPU"),
            required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
            required_limits: wgpu::Limits::default(),
        },
        None,
    )) {
        Ok((d, q)) => (Arc::new(d), Arc::new(q)),
        Err(e) => {
            eprintln!("[GPU] Failed to create device: {}", e);
            std::process::exit(1);
        }
    };

    // Configure surface
    let surface_caps = surface.get_capabilities(&adapter);
    let surface_format = surface_caps.formats.iter()
        .find(|f| f.is_srgb())
        .copied()
        .unwrap_or(surface_caps.formats[0]);

    let window_size = window.inner_size();
    let mut config = wgpu::SurfaceConfiguration {
        usage: wgpu::TextureUsages::RENDER_ATTACHMENT,
        format: surface_format,
        width: window_size.width,
        height: window_size.height,
        present_mode: wgpu::PresentMode::Fifo,
        alpha_mode: wgpu::CompositeAlphaMode::Auto,
        view_formats: vec![],
        desired_maximum_frame_latency: 2,
    };
    surface.configure(&device, &config);

    println!("[GPU] ✓ GPU initialized successfully ({}x{})", config.width, config.height);
    println!();

    // Create Visual Kernel config
    let mut kernel_config = VisualKernelConfig::default();
    kernel_config.screen_width = config.width;
    kernel_config.screen_height = config.height;
    if let Some(path) = ubuntu_path {
        kernel_config.ubuntu_kernel_path = Some(path);
    }

    // Start API Server for remote control (Phase 41.5 Integration)
    let runtime_state = Arc::new(std::sync::Mutex::new(infinite_map_rs::api_server::RuntimeState::default()));
    let synaptic_layer = Arc::new(std::sync::Mutex::new(infinite_map_rs::synapse::SynapticLayer::new()));
    let rs_clone = Arc::clone(&runtime_state);
    let sl_clone = Arc::clone(&synaptic_layer);

    std::thread::spawn(move || {
        let rt = tokio::runtime::Builder::new_multi_thread()
            .enable_all()
            .build()
            .unwrap();
        rt.block_on(async {
            infinite_map_rs::api_server::start_api_server(
                3000,
                std::path::PathBuf::from("maps/default"),
                rs_clone,
                sl_clone,
            ).await;
        });
    });
    println!("[API] 🚀 Remote Control Server active on http://localhost:3000");

    // Boot the Visual Kernel
    let mut kernel = infinite_map_rs::visual_kernel_boot::VisualKernel::new(
        device.clone(),
        queue.clone(),
        kernel_config,
    );

    if let Err(e) = kernel.boot() {
        eprintln!("[BOOT] Failed to boot Visual Kernel: {}", e);
        std::process::exit(1);
    }

    // Spawn a demo child VM (counter_child.glyph)
    let workspace_root = std::path::Path::new(env!("CARGO_MANIFEST_DIR"))
        .parent().unwrap()
        .parent().unwrap();
    let counter_path = workspace_root.join("systems/glyph_stratum/programs/counter_child.glyph");

    if counter_path.exists() {
        println!("[SPAWN] Loading counter_child.glyph as VM #1...");
        if let Err(e) = kernel.spawn_child_vm(
            1,
            counter_path.to_str().unwrap(),
            100.0, 100.0,   // position
            400.0, 300.0,   // size
        ) {
            println!("[SPAWN] ⚠ Could not spawn counter child: {}", e);
        } else {
            println!("[SPAWN] ✓ Counter child spawned successfully");
        }
    }

    // Create window renderer
    let window_renderer = GlyphWindowRenderer::new(&device, surface_format);

    println!();
    println!("  ┌───────────────────────────────────────────────────────────────┐");
    println!("  │                    BOOT COMPLETE                             │");
    println!("  │                                                               │");
    println!("  │  VM #0: Window Manager (RUNNING) - Hit testing, event loop   │");
    println!("  │  VM #1: Counter Child (if available)                         │");
    println!("  │  VM #2-7: Available for child windows                        │");
    println!("  │                                                               │");
    println!("  │  Close window to shutdown                                    │");
    println!("  └───────────────────────────────────────────────────────────────┘");
    println!();

    let mut frame_count = 0u64;
    let start = Instant::now();

    event_loop.set_control_flow(ControlFlow::Poll);
    event_loop.run(move |event, elwt| {
        match event {
            Event::WindowEvent { event: WindowEvent::CloseRequested, .. } => {
                elwt.exit();
            }
            Event::WindowEvent { event: WindowEvent::Resized(size), .. } => {
                if size.width > 0 && size.height > 0 {
                    config.width = size.width;
                    config.height = size.height;
                    surface.configure(&device, &config);
                }
            }
            Event::WindowEvent { event: WindowEvent::RedrawRequested, .. } => {
                // Execute one frame
                kernel.execute_frame();
                frame_count += 1;

                // Build window instances from VM state
                let vm_stats = kernel.get_vm_stats();
                let windows = kernel.get_windows();

                let instances: Vec<WindowInstance> = windows.iter().map(|win| {
                    let state = if win.vm_id == 0 {
                        vm_state::RUNNING // Window manager always running
                    } else {
                        vm_state::RUNNING // Default to running for now
                    };

                    WindowInstance {
                        window_pos: [win.x, win.y],
                        window_size: [win.width, win.height],
                        border_color: get_state_color(state),
                        vm_id: win.vm_id,
                        state,
                    }
                }).collect();

                // Update renderer
                window_renderer.update_windows(&queue, &instances);

                // Render
                let output = match surface.get_current_texture() {
                    Ok(o) => o,
                    Err(_) => return,
                };
                let view = output.texture.create_view(&wgpu::TextureViewDescriptor::default());

                let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
                    label: Some("Visual Kernel Render Encoder"),
                });

                {
                    let mut render_pass = encoder.begin_render_pass(&wgpu::RenderPassDescriptor {
                        label: Some("Visual Kernel Render Pass"),
                        color_attachments: &[Some(wgpu::RenderPassColorAttachment {
                            view: &view,
                            resolve_target: None,
                            ops: wgpu::Operations {
                                load: wgpu::LoadOp::Clear(wgpu::Color {
                                    r: 0.02,
                                    g: 0.02,
                                    b: 0.04,
                                    a: 1.0,
                                }),
                                store: wgpu::StoreOp::Store,
                            },
                        })],
                        depth_stencil_attachment: None,
                        timestamp_writes: None,
                        occlusion_query_set: None,
                    });

                    // Render VM windows
                    window_renderer.render(&mut render_pass, instances.len() as u32);
                }

                queue.submit(std::iter::once(encoder.finish()));
                output.present();

                // Print status every 60 frames
                if frame_count % 60 == 0 {
                    let elapsed = start.elapsed();
                    let fps = (frame_count as f64) / elapsed.as_secs_f64();
                    let vm_list: Vec<String> = vm_stats.iter()
                        .map(|(id, name)| format!("VM#{}:{}", id, name))
                        .collect();
                    println!("[FRAME {:08}] FPS: {:.1} | Active: {}",
                        frame_count, fps, vm_list.join(", "));
                }
            }
            _ => {}
        }
    }).unwrap();
}

fn run_headless(ubuntu_path: Option<String>) {
    println!("[GPU] Initializing WebGPU (headless mode)...");

    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
        backends: wgpu::Backends::all(),
        ..Default::default()
    });

    let adapter = match pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions {
        power_preference: wgpu::PowerPreference::HighPerformance,
        compatible_surface: None,
        force_fallback_adapter: false,
    })) {
        Some(a) => a,
        None => {
            eprintln!("[GPU] No suitable GPU adapter found");
            std::process::exit(1);
        }
    };

    let (device, queue) = match pollster::block_on(adapter.request_device(
        &wgpu::DeviceDescriptor {
            label: Some("Geometry OS GPU"),
            required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
            required_limits: wgpu::Limits::default(),
        },
        None,
    )) {
        Ok((d, q)) => (Arc::new(d), Arc::new(q)),
        Err(e) => {
            eprintln!("[GPU] Failed to create device: {}", e);
            std::process::exit(1);
        }
    };

    println!("[GPU] ✓ GPU initialized successfully");
    println!();

    // Create Visual Kernel config
    let mut config = VisualKernelConfig::default();
    if let Some(path) = ubuntu_path {
        config.ubuntu_kernel_path = Some(path);
    }

    // Boot the Visual Kernel
    let mut kernel = infinite_map_rs::visual_kernel_boot::VisualKernel::new(
        device.clone(),
        queue.clone(),
        config,
    );

    if let Err(e) = kernel.boot() {
        eprintln!("[BOOT] Failed to boot Visual Kernel: {}", e);
        std::process::exit(1);
    }

    println!();
    println!("  ┌───────────────────────────────────────────────────────────────┐");
    println!("  │                    BOOT COMPLETE (Headless)                  │");
    println!("  │                                                               │");
    println!("  │  VM #0: Window Manager (RUNNING)                             │");
    println!("  │  Press Ctrl+C to shutdown                                    │");
    println!("  └───────────────────────────────────────────────────────────────┘");
    println!();

    // Run the main loop
    let frame_time = Duration::from_micros(16_667); // ~60 FPS
    let mut frame_count = 0u64;
    let start = Instant::now();

    println!("[EXEC] Starting execution loop (60 FPS target)...");
    println!();

    loop {
        let frame_start = Instant::now();

        // Execute one frame
        kernel.execute_frame();
        frame_count += 1;

        // Print status every 60 frames (~1 second)
        if frame_count % 60 == 0 {
            let elapsed = start.elapsed();
            let fps = (frame_count as f64) / elapsed.as_secs_f64();
            let vm_stats = kernel.get_vm_stats();
            let vm_list: Vec<String> = vm_stats.iter()
                .map(|(id, name)| format!("VM#{}:{}", id, name))
                .collect();

            println!("[FRAME {:08}] FPS: {:.1} | Active: {}",
                frame_count, fps, vm_list.join(", "));
        }

        // Sleep to maintain frame rate
        let elapsed = frame_start.elapsed();
        if elapsed < frame_time {
            std::thread::sleep(frame_time - elapsed);
        }
    }
}
