//! Geometry OS - Ouroboros Daemon (Self-Hosting HAL)
//!
//! This shim provides the physical link between the network and the GPU.
//! It handles the bulk VRAM upload and orchestrates the VM lifecycle.

use std::io::Write;
use std::fs;
use std::io::Read;
use std::net::TcpListener;
use std::os::unix::net::UnixListener;
use std::sync::{Arc, Mutex};
use std::thread;
use std::time::{Duration, Instant};

use infinite_map_rs::brain_bridge::{BrainBridge, BrainBridgeConfig};
use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};

fn main() {
    println!("I AM STARTING"); std::io::stdout().flush().unwrap();
    println!("CWD: {:?}", std::env::current_dir().unwrap()); std::io::stdout().flush().unwrap();
    println!("============================================================"); std::io::stdout().flush().unwrap();
    println!("  GEOMETRY OS - OUROBOROS DAEMON (Phase 43)"); std::io::stdout().flush().unwrap();
    println!("============================================================"); std::io::stdout().flush().unwrap();

    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor::default());
    let adapter =
        pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions::default()))
            .unwrap();
    let (device, queue) = pollster::block_on(adapter.request_device(
        &wgpu::DeviceDescriptor {
            label: Some("Ouroboros GPU"),
            required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
            required_limits: wgpu::Limits::default(),
        },
        None,
    ))
    .unwrap();

    let device = Arc::new(device);
    let queue = Arc::new(queue);
    let scheduler = Arc::new(Mutex::new(GlyphVmScheduler::new(
        device.clone(),
        queue.clone(),
    )));

    let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
        label: Some("Unified RAM"),
        size: wgpu::Extent3d {
            width: 4096,
            height: 4096,
            depth_or_array_layers: 1,
        },
        mip_level_count: 1,
        sample_count: 1,
        dimension: wgpu::TextureDimension::D2,
        format: wgpu::TextureFormat::Rgba8Uint,
        usage: wgpu::TextureUsages::all(),
        view_formats: &[],
    }));
    scheduler.lock().unwrap().set_ram_texture(&ram_texture);

    // Initial Substrate Setup
    let mut substrate = vec![0u8; 4096 * 4096 * 4];
    // (Optional: Pre-load Daemon and Emulator here)

    println!("[BOOT] Substrate initialized."); std::io::stdout().flush().unwrap();

    let bridge_config = BrainBridgeConfig::default();
    let brain_bridge = Arc::new(BrainBridge::new(
        bridge_config,
        device.clone(),
        queue.clone(),
        ram_texture.clone(),
    ));

    let q_clone = queue.clone();
    let t_clone = ram_texture.clone();
    let d_clone = device.clone();
    let s_clone = scheduler.clone();
    let b_clone = brain_bridge.clone();

    // API Server
    let q_clone = queue.clone();
    let t_clone = ram_texture.clone();
    let d_clone = device.clone();
    let s_clone = scheduler.clone();
    let b_clone = brain_bridge.clone();
    thread::spawn(move || {
        let rt = tokio::runtime::Runtime::new().unwrap();
        rt.block_on(async {
            let listener = TcpListener::bind("127.0.0.1:8769").unwrap();
            println!("[API] 🚀 Ouroboros API listening on http://127.0.0.1:8769"); std::io::stdout().flush().unwrap();
            for stream in listener.incoming() {
                if let Ok(mut stream) = stream {
                    handle_hal_request(&mut stream, &q_clone, &t_clone, &d_clone, &s_clone, &b_clone);
                }
            }
        });
    });

    // Unix Socket Server
    let socket_path = "/tmp/gpu_daemon.sock";
    if fs::metadata(socket_path).is_ok() {
        let _ = fs::remove_file(socket_path);
    }
    let listener = UnixListener::bind(socket_path).unwrap();
    println!("[API] 🚀 Ouroboros Unix socket listening on {}", socket_path); std::io::stdout().flush().unwrap();
    let q_clone_unix = queue.clone();
    let t_clone_unix = ram_texture.clone();
    let d_clone_unix = device.clone();
    let s_clone_unix = scheduler.clone();
    let b_clone_unix = brain_bridge.clone();
    thread::spawn(move || {
        let rt = tokio::runtime::Runtime::new().unwrap();
        rt.block_on(async {
            for stream in listener.incoming() {
                if let Ok(mut stream) = stream {
                    handle_hal_request(
                        &mut stream,
                        &q_clone_unix,
                        &t_clone_unix,
                        &d_clone_unix,
                        &s_clone_unix,
                        &b_clone_unix,
                    );
                }
            }
        });
    });

    // Brain Bridge Thread
    let b_clone_loop = brain_bridge.clone();
    thread::spawn(move || {
        let rt = tokio::runtime::Runtime::new().unwrap();
        rt.block_on(async {
            b_clone_loop.start().await;
        });
    });

    // Substrate Heartbeat
    println!("I AM INITIALIZED"); std::io::stdout().flush().unwrap();
    println!("[EXEC] Substrate pulse starting..."); std::io::stdout().flush().unwrap();
    loop {
        println!("I AM IN THE LOOP"); std::io::stdout().flush().unwrap();
        let start = Instant::now();
        scheduler.lock().unwrap().execute_frame();
        if let Some(delay) = Duration::from_micros(16667).checked_sub(start.elapsed()) {
            thread::sleep(delay);
        }
    }
}

fn handle_hal_request<S: Read + Write>(
    stream: &mut S,
    queue: &wgpu::Queue,
    texture: &wgpu::Texture,
    device: &wgpu::Device,
    scheduler: &Arc<Mutex<GlyphVmScheduler>>,
    brain_bridge: &Arc<BrainBridge>,
) {
    let mut full_buffer = Vec::with_capacity(65536);
    let mut chunk = [0u8; 8192];
    
    // Initial read
    if let Ok(size) = stream.read(&mut chunk) {
        if size == 0 { return; }
        full_buffer.extend_from_slice(&chunk[..size]);
    } else { return; }

    let mut request_str = String::from_utf8_lossy(&full_buffer).to_string();
    
    // Check if we need more data for POST body
    if request_str.starts_with("POST") {
        if let Some(content_length_pos) = request_str.find("Content-Length: ") {
            let start = content_length_pos + 16;
            let end_pos = request_str[start..].find("\r\n").unwrap_or(0) + start;
            if let Ok(len) = request_str[start..end_pos].trim().parse::<usize>() {
                if let Some(body_start_idx) = request_str.find("\r\n\r\n") {
                    let body_received = full_buffer.len() - (body_start_idx + 4);
                    if body_received < len {
                        let mut remaining = vec![0u8; len - body_received];
                        let _ = stream.read_exact(&mut remaining);
                        full_buffer.extend_from_slice(&remaining);
                        request_str = String::from_utf8_lossy(&full_buffer).to_string();
                    }
                }
            }
        }
    }

    let request = &request_str;

    if request.starts_with("GET /brain/health") {
            let healthy = pollster::block_on(brain_bridge.test_connection()).unwrap_or(false);
            let response = format!("HTTP/1.1 200 OK\r\n\r\n{{\"lm_studio\": {}}}\n", healthy);
            let _ = stream.write_all(response.as_bytes());
            return;
        } else if request.starts_with("GET /brain/state") {
            let entropy = pollster::block_on(brain_bridge.read_gpu_u32(0x0400)).unwrap_or(0);
            let cycles = pollster::block_on(brain_bridge.read_gpu_u32(0x0304)).unwrap_or(0);
            let response = format!(
                "HTTP/1.1 200 OK\r\n\r\n{{\"entropy\": {}, \"cycles\": {}}}\n",
                entropy, cycles
            );
            let _ = stream.write_all(response.as_bytes());
            return;
        } else if request.starts_with("GET /brain/stats") {
            // Read VM 0 stats from scheduler
            let stats = scheduler.lock().unwrap().read_stats();
            let vm0 = stats[0];
            let response = format!(
                "HTTP/1.1 200 OK\r\n\r\n{{\"pc\": {}, \"cycles\": {}, \"halted\": {}, \"state\": {}}}\n",
                vm0.pc, vm0.cycles, vm0.halted, vm0.state
            );
            let _ = stream.write_all(response.as_bytes());
            return;
        } else if request.starts_with("POST /brain/inject") {
            let body_start = request.find("\r\n\r\n").unwrap_or(0) + 4;
            let intent = &request[body_start..];
            let intent_bytes = intent.as_bytes();
            for (i, &byte) in intent_bytes.iter().enumerate().take(32) {
                pollster::block_on(brain_bridge.write_gpu_u32(0x0300 + i as u32, byte as u32)).ok();
            }
            let _ = stream.write_all(b"HTTP/1.1 200 OK\r\n\r\nIntent injected\n");
            return;
        }

        if request.starts_with("GET /force_peek") {
            let addr = request
                .split("addr=")
                .nth(1)
                .map(|s| s.split('&').next().unwrap_or(s))
                .and_then(|s| s.split(' ').next())
                .unwrap_or("0x0000");
            let size = request
                .split("size=")
                .nth(1)
                .map(|s| s.split('&').next().unwrap_or(s))
                .and_then(|s| s.split(' ').next())
                .unwrap_or("1");
            let addr_val = u32::from_str_radix(addr.trim_start_matches("0x"), 16).unwrap_or(0);
            let size_val = size.parse::<u32>().unwrap_or(1).min(64);

            let bytes_per_row = (size_val * 4 + 255) & !255;
            let staging = device.create_buffer(&wgpu::BufferDescriptor {
                label: None,
                size: bytes_per_row as u64,
                usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
                mapped_at_creation: false,
            });

            let (tx, ty) = hilbert_d2xy(4096, addr_val);
            let mut encoder =
                device.create_command_encoder(&wgpu::CommandEncoderDescriptor { label: None });
            encoder.copy_texture_to_buffer(
                wgpu::ImageCopyTexture {
                    texture,
                    mip_level: 0,
                    origin: wgpu::Origin3d { x: tx, y: ty, z: 0 },
                    aspect: wgpu::TextureAspect::All,
                },
                wgpu::ImageCopyBuffer {
                    buffer: &staging,
                    layout: wgpu::ImageDataLayout {
                        offset: 0,
                        bytes_per_row: Some(bytes_per_row),
                        rows_per_image: Some(1),
                    },
                },
                wgpu::Extent3d {
                    width: size_val,
                    height: 1,
                    depth_or_array_layers: 1,
                },
            );
            queue.submit(Some(encoder.finish()));

            let slice = staging.slice(..);
            let (tx_chan, rx) = std::sync::mpsc::channel();
            slice.map_async(wgpu::MapMode::Read, move |res| {
                tx_chan.send(res).ok();
            });
            device.poll(wgpu::Maintain::Wait);

            let mut hex = String::new();
            if let Ok(Ok(())) = rx.recv() {
                {
                    let data = slice.get_mapped_range();
                    for chunk in data.chunks_exact(4).take(size_val as usize) {
                        hex.push_str(&format!(
                            "{:08x} ",
                            u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]])
                        ));
                    }
                }
                staging.unmap();
            }
            let response = format!("HTTP/1.1 200 OK\r\n\r\n{}\n", hex);
            let _ = stream.write_all(response.as_bytes());
            return;
        }

        if request.starts_with("GET /peek") {
            let addr = request
                .split("addr=")
                .nth(1)
                .map(|s| s.split('&').next().unwrap_or(s))
                .and_then(|s| s.split(' ').next())
                .unwrap_or("0x0000");
            let size = request
                .split("size=")
                .nth(1)
                .map(|s| s.split('&').next().unwrap_or(s))
                .and_then(|s| s.split(' ').next())
                .unwrap_or("1");
            let addr_val = u32::from_str_radix(addr.trim_start_matches("0x"), 16).unwrap_or(0);
            let size_val = size.parse::<u32>().unwrap_or(1).min(64);

            // Read all pixels at once into a single buffer for efficiency
            let staging = device.create_buffer(&wgpu::BufferDescriptor {
                label: Some("peek staging"),
                size: 256 * size_val as u64, // 256 bytes per pixel
                usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
                mapped_at_creation: false,
            });

            // Copy all pixels at once
            let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
                label: Some("peek encoder"),
            });
            for i in 0..size_val {
                let (tx, ty) = hilbert_d2xy(4096, addr_val + i);
                encoder.copy_texture_to_buffer(
                    wgpu::ImageCopyTexture {
                        texture,
                        mip_level: 0,
                        origin: wgpu::Origin3d { x: tx, y: ty, z: 0 },
                        aspect: wgpu::TextureAspect::All,
                    },
                    wgpu::ImageCopyBuffer {
                        buffer: &staging,
                        layout: wgpu::ImageDataLayout {
                            offset: 256 * i as u64,
                            bytes_per_row: Some(256),
                            rows_per_image: Some(1),
                        },
                    },
                    wgpu::Extent3d {
                        width: 1,
                        height: 1,
                        depth_or_array_layers: 1,
                    },
                );
            }
            queue.submit(Some(encoder.finish()));

            // Map and read all values
            let slice = staging.slice(..);
            let (tx_chan, rx) = std::sync::mpsc::channel();
            slice.map_async(wgpu::MapMode::Read, move |res| {
                tx_chan.send(res).ok();
            });
            device.poll(wgpu::Maintain::Wait);

            let mut results = Vec::new();
            if let Ok(Ok(())) = rx.recv() {
                {
                    let data = slice.get_mapped_range();
                    for i in 0..size_val as usize {
                        let offset = i * 256;
                        let val = u32::from_le_bytes([
                            data[offset],
                            data[offset + 1],
                            data[offset + 2],
                            data[offset + 3],
                        ]);
                        results.push(format!("{:08x}", val));
                    }
                    // data dropped here when scope ends
                }
                staging.unmap();
            }
            let response = format!("HTTP/1.1 200 OK\r\n\r\n{}\n", results.join(" "));
            let _ = stream.write_all(response.as_bytes());
            return;
        } else if request.starts_with("GET /poke") {
            let addr = request
                .split("addr=")
                .nth(1)
                .map(|s| s.split('&').next().unwrap_or(s))
                .and_then(|s| s.split(' ').next())
                .unwrap_or("0x0000");
            let val = request
                .split("val=")
                .nth(1)
                .map(|s| s.split('&').next().unwrap_or(s))
                .and_then(|s| s.split(' ').next())
                .unwrap_or("0x00000000");

            let addr_val = u32::from_str_radix(addr.trim_start_matches("0x"), 16).unwrap_or(0);
            let val_u32 = u32::from_str_radix(val.trim_start_matches("0x"), 16).unwrap_or(0);

            let (tx, ty) = hilbert_d2xy(4096, addr_val);
            let data = val_u32.to_le_bytes();

            queue.write_texture(
                wgpu::ImageCopyTexture {
                    texture,
                    mip_level: 0,
                    origin: wgpu::Origin3d { x: tx, y: ty, z: 0 },
                    aspect: wgpu::TextureAspect::All,
                },
                &data,
                wgpu::ImageDataLayout {
                    offset: 0,
                    bytes_per_row: Some(4),
                    rows_per_image: Some(1),
                },
                wgpu::Extent3d {
                    width: 1,
                    height: 1,
                    depth_or_array_layers: 1,
                },
            );

            let response = format!(
                "HTTP/1.1 200 OK\r\n\r\nPoked 0x{:08x} at addr 0x{:08x}\n",
                val_u32, addr_val
            );
            let _ = stream.write_all(response.as_bytes());
            return;
        } else if request.starts_with("POST /write") {
            println!("[API] /write request received"); std::io::stdout().flush().unwrap();
            let body_start = request.find("\r\n\r\n").unwrap_or(0) + 4;
            let body = &request[body_start..];

            let addr_str = request
                .split("addr=")
                .nth(1)
                .map(|s| s.split('&').next().unwrap_or(s))
                .and_then(|s| s.split(' ').next())
                .unwrap_or("0x0000");
            let addr_val = u32::from_str_radix(addr_str.trim_start_matches("0x"), 16).unwrap_or(0);
            println!("[API] /write addr: 0x{:08x}", addr_val); std::io::stdout().flush().unwrap();

            // Body is expected to be hex string for simplicity in this dev tool
            let data_hex = body.trim();
            let mut data = Vec::new();
            for i in (0..data_hex.len()).step_by(8) {
                if i + 8 <= data_hex.len() {
                    if let Ok(val) = u32::from_str_radix(&data_hex[i..i + 8], 16) {
                        data.extend_from_slice(&val.to_le_bytes());
                    }
                }
            }

            let num_pixels = (data.len() / 4) as u32;
            println!("[API] /write pixels: {}", num_pixels); std::io::stdout().flush().unwrap();
            for i in 0..num_pixels {
                let (tx, ty) = hilbert_d2xy(4096, addr_val + i);
                queue.write_texture(
                    wgpu::ImageCopyTexture {
                        texture,
                        mip_level: 0,
                        origin: wgpu::Origin3d { x: tx, y: ty, z: 0 },
                        aspect: wgpu::TextureAspect::All,
                    },
                    &data[(i as usize * 4)..(i as usize * 4 + 4)],
                    wgpu::ImageDataLayout {
                        offset: 0,
                        bytes_per_row: Some(4),
                        rows_per_image: Some(1),
                    },
                    wgpu::Extent3d {
                        width: 1,
                        height: 1,
                        depth_or_array_layers: 1,
                    },
                );
            }
            println!("[API] /write texture calls done"); std::io::stdout().flush().unwrap();

            let response = format!(
                "HTTP/1.1 200 OK\r\n\r\nWrote {} pixels starting at addr 0x{:08x}\n",
                num_pixels, addr_val
            );
            let _ = stream.write_all(response.as_bytes());
            return;
        } else if request.starts_with("GET /pause") {
            // Pause VM execution by halting all VMs
            let mut s = scheduler.lock().unwrap();
            for i in 0..8u32 {
                let _ = s.halt_vm(i);
            }
            let _ = stream.write_all(b"HTTP/1.1 200 OK\r\n\r\nVMs paused\n");
            return;
        } else if request.starts_with("GET /vmstate") {
            // Read VM state from buffer
            let vm_id: u32 = request
                .split("vm=")
                .nth(1)
                .and_then(|s| s.split(' ').next())
                .unwrap_or("0")
                .parse()
                .unwrap_or(0);
            let s = scheduler.lock().unwrap();
            let state = s.get_vm_state(vm_id).unwrap_or(0xFF);
            let pc = s.get_vm_pc(vm_id).unwrap_or(0xFF);
            let response = format!(
                "HTTP/1.1 200 OK\r\n\r\n{{\"vm_id\": {}, \"state\": {}, \"pc\": {}}}\n",
                vm_id, state, pc
            );
            let _ = stream.write_all(response.as_bytes());
            return;
        } else if request.starts_with("GET /status") {
            // Health check endpoint - returns daemon status as JSON
            let status = format!(
                "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{{\n  \"daemon\": \"ouroboros\",\n  \"version\": \"Phase 43\",\n  \"status\": \"healthy\",\n  \"transports\": [\"tcp://127.0.0.1:8769\", \"unix:///tmp/gpu_daemon.sock\"],\n  \"substrate\": {{\n    \"width\": 4096,\n    \"height\": 4096,\n    \"format\": \"Rgba8Uint\"\n  }},\n  \"self_hosting\": true,\n  \"vcc_enabled\": true\n}}\n"
            );
            let _ = stream.write_all(status.as_bytes());
            return;
        } else if request.starts_with("POST /exec") {
            // Execute shell command with timeout protection
            let body_start = request.find("\r\n\r\n").unwrap_or(0) + 4;
            let cmd = request[body_start..].trim();

            // Parse cwd from query string (e.g., POST /exec?cwd=/path&timeout=60)
            let mut cwd: Option<&str> = None;
            let mut timeout_secs: u64 = 30; // default 30s timeout
            if let Some(first_line) = request.lines().next() {
                if let Some(query_part) = first_line.split('?').nth(1) {
                    // Remove HTTP version suffix (e.g., " HTTP/1.1")
                    let query_part = query_part.split(' ').next().unwrap_or(query_part);
                    for param in query_part.split('&') {
                        if let Some(equals) = param.find('=') {
                            let key = &param[..equals];
                            let value = &param[equals + 1..];
                            if key == "cwd" {
                                cwd = Some(value);
                            } else if key == "timeout" {
                                timeout_secs = value.parse().unwrap_or(30);
                            }
                        }
                    }
                }
            }

            // Use timeout command to prevent hung processes
            let mut command = std::process::Command::new("timeout");
            command.arg(format!("{}s", timeout_secs)).arg("bash").arg("-c").arg(cmd);
            if let Some(dir) = cwd {
                command.current_dir(dir);
            }

            let output = command.output();

            let response = match output {
                Ok(out) => {
                    let stdout = String::from_utf8_lossy(&out.stdout);
                    let stderr = String::from_utf8_lossy(&out.stderr);
                    let code = out.status.code().unwrap_or(-1);
                    // Exit code 124 means timeout was triggered
                    let status = if code == 124 { "TIMEOUT" } else { "OK" };
                    format!(
                        "HTTP/1.1 200 OK\r\n\r\n[exit:{}][{}]\n{}\n{}",
                        code, status, stdout, stderr
                    )
                },
                Err(e) => format!("HTTP/1.1 500 OK\r\n\r\nError: {}\n", e),
            };
            let _ = stream.write_all(response.as_bytes());
            return;
        } else if request.starts_with("POST /transformer/run") {
            println!("[DEBUG] /transformer/run request received"); std::io::stdout().flush().unwrap();
            let token_idx = request
                .split("token=")
                .nth(1)
                .map(|s| s.split('&').next().unwrap_or(s))
                .and_then(|s| s.split(' ').next())
                .unwrap_or("0")
                .parse::<u32>()
                .unwrap_or(0);

            println!("[DEBUG] Current CWD: {:?}", std::env::current_dir().unwrap()); std::io::stdout().flush().unwrap();
            let kernel_path = "systems/glyph_stratum/programs/transformer_inference.rts.png";
            println!("[TRANSFORMER] Running inference for token {}, kernel: {}", token_idx, kernel_path); std::io::stdout().flush().unwrap();

            let img_result = image::open(kernel_path).or_else(|e| {
                println!("[DEBUG] Failed to open relative path {}: {}", kernel_path, e);
                let abs_path = "/home/jericho/zion/projects/geometry_os/geometry_os/systems/glyph_stratum/programs/transformer_inference.rts.png";
                println!("[DEBUG] Trying absolute path: {}", abs_path);
                image::open(abs_path)
            });

            match img_result {
                Ok(img) => {
                    println!("[DEBUG] Kernel image opened successfully"); std::io::stdout().flush().unwrap();
                    let rgba = img.to_rgba8();
                    let (w, h) = rgba.dimensions();
                    println!("[DEBUG] Image dimensions: {}x{}", w, h); std::io::stdout().flush().unwrap();
                    queue.write_texture(
                        wgpu::ImageCopyTexture {
                            texture,
                            mip_level: 0,
                            origin: wgpu::Origin3d::ZERO,
                            aspect: wgpu::TextureAspect::All,
                        },
                        rgba.as_raw(),
                        wgpu::ImageDataLayout {
                            offset: 0,
                            bytes_per_row: Some(4 * w),
                            rows_per_image: Some(h),
                        },
                        wgpu::Extent3d {
                            width: w,
                            height: h,
                            depth_or_array_layers: 1,
                        },
                    );
                    println!("[DEBUG] Texture write submitted"); std::io::stdout().flush().unwrap();

                    let mut s = scheduler.lock().unwrap();
                    println!("[DEBUG] Scheduler lock acquired"); std::io::stdout().flush().unwrap();
                    s.reset_all();
                    println!("[DEBUG] s.reset_all() done"); std::io::stdout().flush().unwrap();

                    let mut regs = [0u32; 128];
                    regs[0] = token_idx;
                    let config = VmConfig {
                        entry_point: 0,
                        parent_id: 0xFF,
                        base_addr: 0,
                        bound_addr: 0,
                        initial_regs: regs,
                    };
                    println!("[DEBUG] Spawning VM 0 at entry 0"); std::io::stdout().flush().unwrap();
                    match s.spawn_vm(0, &config) {
                        Ok(_) => { println!("[DEBUG] VM 0 spawned OK"); std::io::stdout().flush().unwrap(); },
                        Err(e) => {
                            println!("[ERROR] spawn_vm failed: {}", e); std::io::stdout().flush().unwrap();
                            let _ = stream.write_all(format!("HTTP/1.1 500 OK\r\n\r\nSpawn failed: {}\n", e).as_bytes());
                            return;
                        }
                    }
                    drop(s); // Release lock for background execution
                    println!("[DEBUG] Scheduler lock released"); std::io::stdout().flush().unwrap();

                    // Poll for completion (max 60s)
                    let start_time = Instant::now();
                    let mut finished = false;
                    while start_time.elapsed() < Duration::from_secs(60) {
                        let state = scheduler.lock().unwrap().get_vm_state(0).unwrap_or(0);
                        if state == 2 { // HALTED
                            finished = true;
                            break;
                        }
                        thread::sleep(Duration::from_millis(50));
                    }

                    if finished {
                        // Peek results from ACT_BASE (0x8000)
                        // We'll read 128 words (D)
                        let addr_val = 0x8000;
                        let size_val = 128;
                        
                        // (Use the existing peek logic simplified)
                        let staging = device.create_buffer(&wgpu::BufferDescriptor {
                            label: None,
                            size: (size_val * 4) as u64,
                            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
                            mapped_at_creation: false,
                        });

                        let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor { label: None });
                        for i in 0..size_val {
                            let (tx, ty) = hilbert_d2xy(4096, addr_val + i);
                            encoder.copy_texture_to_buffer(
                                wgpu::ImageCopyTexture {
                                    texture,
                                    mip_level: 0,
                                    origin: wgpu::Origin3d { x: tx, y: ty, z: 0 },
                                    aspect: wgpu::TextureAspect::All,
                                },
                                wgpu::ImageCopyBuffer {
                                    buffer: &staging,
                                    layout: wgpu::ImageDataLayout {
                                        offset: (i * 4) as u64,
                                        bytes_per_row: Some(4),
                                        rows_per_image: Some(1),
                                    },
                                },
                                wgpu::Extent3d {
                                    width: 1,
                                    height: 1,
                                    depth_or_array_layers: 1,
                                },
                            );
                        }
                        queue.submit(Some(encoder.finish()));

                        let slice = staging.slice(..);
                        let (tx_chan, rx) = std::sync::mpsc::channel();
                        slice.map_async(wgpu::MapMode::Read, move |res| {
                            tx_chan.send(res).ok();
                        });
                        device.poll(wgpu::Maintain::Wait);

                        let mut hex_results = Vec::new();
                        if let Ok(Ok(())) = rx.recv() {
                            let data = slice.get_mapped_range();
                            for chunk in data.chunks_exact(4) {
                                hex_results.push(format!("{:08x}", u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]])));
                            }
                            drop(data);
                            staging.unmap();
                        }

                        let response = format!(
                            "HTTP/1.1 200 OK\r\n\r\n{{\"token\": {}, \"status\": \"complete\", \"embedding\": {:?}}}\n",
                            token_idx, hex_results
                        );
                        let _ = stream.write_all(response.as_bytes());
                    } else {
                        let _ = stream.write_all(b"HTTP/1.1 504 Gateway Timeout\r\n\r\nVM inference timed out\n");
                    }
                }
                Err(e) => {
                    println!("[ERROR] Failed to open kernel image: {}", e); std::io::stdout().flush().unwrap();
                    let _ = stream.write_all(format!("HTTP/1.1 404 Not Found\r\n\r\nKernel image not found: {}\n", e).as_bytes());
                }
            }
            return;
        } else if request.starts_with("POST /load") {
            // Full Reset Load
            let body_start = request.find("\r\n\r\n").unwrap_or(0) + 4;
            let path = request[body_start..].trim();
            println!("[LOAD] Attempting to load: {}", path); std::io::stdout().flush().unwrap();
            if let Ok(img) = image::open(path) {
                let rgba = img.to_rgba8();
                let (w, h) = rgba.dimensions();
                println!("[LOAD] Image loaded: {}x{}", w, h); std::io::stdout().flush().unwrap();

                // Debug: check first few pixels
                let raw = rgba.as_raw();
                println!("[LOAD] First 16 bytes: {:02x?}", &raw[..16.min(raw.len())]); std::io::stdout().flush().unwrap();

                queue.write_texture(
                    wgpu::ImageCopyTexture {
                        texture,
                        mip_level: 0,
                        origin: wgpu::Origin3d::ZERO,
                        aspect: wgpu::TextureAspect::All,
                    },
                    rgba.as_raw(),
                    wgpu::ImageDataLayout {
                        offset: 0,
                        bytes_per_row: Some(4 * w),
                        rows_per_image: Some(h),
                    },
                    wgpu::Extent3d {
                        width: w,
                        height: h,
                        depth_or_array_layers: 1,
                    },
                );
                queue.submit([]);
                device.poll(wgpu::Maintain::Wait);
                println!("[LOAD] Texture write submitted and polled"); std::io::stdout().flush().unwrap();

                // Debug: immediately read back address 0
                let (tx, ty) = hilbert_d2xy(4096, 0);
                let debug_staging = device.create_buffer(&wgpu::BufferDescriptor {
                    label: Some("debug staging"),
                    size: 256,
                    usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
                    mapped_at_creation: false,
                });
                let mut debug_encoder =
                    device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
                        label: Some("debug peek"),
                    });
                debug_encoder.copy_texture_to_buffer(
                    wgpu::ImageCopyTexture {
                        texture,
                        mip_level: 0,
                        origin: wgpu::Origin3d { x: tx, y: ty, z: 0 },
                        aspect: wgpu::TextureAspect::All,
                    },
                    wgpu::ImageCopyBuffer {
                        buffer: &debug_staging,
                        layout: wgpu::ImageDataLayout {
                            offset: 0,
                            bytes_per_row: Some(256),
                            rows_per_image: Some(1),
                        },
                    },
                    wgpu::Extent3d {
                        width: 1,
                        height: 1,
                        depth_or_array_layers: 1,
                    },
                );
                queue.submit(Some(debug_encoder.finish()));
                let slice = debug_staging.slice(..);
                let (debug_tx, debug_rx) = std::sync::mpsc::channel();
                slice.map_async(wgpu::MapMode::Read, move |res| {
                    debug_tx.send(res).ok();
                });
                device.poll(wgpu::Maintain::Wait);
                if let Ok(Ok(())) = debug_rx.recv() {
                    let data = slice.get_mapped_range();
                    println!("[LOAD] Immediate peek at 0: {:02x?}", &data[..4]); std::io::stdout().flush().unwrap();
                    drop(data);
                    debug_staging.unmap();
                }

                // --- THE HARD RESET ---
                let mut s = scheduler.lock().unwrap();
                s.reset_all();
                println!("[LOAD] reset_all() done"); std::io::stdout().flush().unwrap();

                // Debug: peek BEFORE spawning VM
                let staging_pre = device.create_buffer(&wgpu::BufferDescriptor {
                    label: Some("pre-spawn staging"),
                    size: 256 * 3,
                    usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
                    mapped_at_creation: false,
                });
                let (tx, ty) = hilbert_d2xy(4096, 0);
                let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
                    label: Some("pre-spawn encoder"),
                });
                encoder.copy_texture_to_buffer(
                    wgpu::ImageCopyTexture {
                        texture,
                        mip_level: 0,
                        origin: wgpu::Origin3d { x: tx, y: ty, z: 0 },
                        aspect: wgpu::TextureAspect::All,
                    },
                    wgpu::ImageCopyBuffer {
                        buffer: &staging_pre,
                        layout: wgpu::ImageDataLayout {
                            offset: 0,
                            bytes_per_row: Some(256),
                            rows_per_image: Some(1),
                        },
                    },
                    wgpu::Extent3d {
                        width: 1,
                        height: 1,
                        depth_or_array_layers: 1,
                    },
                );
                queue.submit(Some(encoder.finish()));
                let slice = staging_pre.slice(..);
                let (tx_chan, rx) = std::sync::mpsc::channel();
                slice.map_async(wgpu::MapMode::Read, move |res| {
                    tx_chan.send(res).ok();
                });
                device.poll(wgpu::Maintain::Wait);
                if let Ok(Ok(())) = rx.recv() {
                    let data = slice.get_mapped_range();
                    println!("[LOAD] Pre-spawn peek at 0: {:02x?}", &data[..4]); std::io::stdout().flush().unwrap();
                    drop(data);
                    staging_pre.unmap();
                }

                // Now spawn VM
                let mut regs = [0u32; 128];
                regs[0] = 0x18000; // Guest entry point for emulator
                let config = VmConfig {
                    entry_point: 0,
                    parent_id: 0xFF,
                    base_addr: 0,
                    bound_addr: 0,
                    initial_regs: regs,
                };
                s.spawn_vm(0, &config).unwrap();
                println!("[LOAD] VM spawned"); std::io::stdout().flush().unwrap();

                let _ =
                    stream.write_all(b"HTTP/1.1 200 OK\r\n\r\nSubstrate Reloaded and VM Spawned\n");
                return;
            }
    }
}

fn hilbert_d2xy(n: u32, d: u32) -> (u32, u32) {
    let (mut x, mut y, mut s, mut t) = (0, 0, 1, d);
    while s < n {
        let rx = 1 & (t / 2);
        let ry = 1 & (t ^ rx);
        if ry == 0 {
            if rx == 1 {
                x = s - 1 - x;
                y = s - 1 - y;
            }
            std::mem::swap(&mut x, &mut y);
        }
        x += s * rx;
        y += s * ry;
        t /= 4;
        s *= 2;
    }
    (x, y)
}
