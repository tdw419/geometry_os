//! Geometry OS - Ouroboros Daemon (Self-Hosting HAL)
//! 
//! This shim provides the physical link between the network and the GPU.
//! It handles the bulk VRAM upload and orchestrates the VM lifecycle.

use std::sync::{Arc, Mutex};
use std::time::{Duration, Instant};
use std::io::{Read, Write};
use std::net::{TcpListener, TcpStream};
use std::thread;
use std::fs;

use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};

fn main() {
    println!("============================================================");
    println!("  GEOMETRY OS - OUROBOROS DAEMON (Phase 43)");
    println!("============================================================");

    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor::default());
    let adapter = pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions::default())).unwrap();
    let (device, queue) = pollster::block_on(adapter.request_device(&wgpu::DeviceDescriptor {
        label: Some("Ouroboros GPU"),
        required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
        required_limits: wgpu::Limits::default(),
    }, None)).unwrap();
    
    let device = Arc::new(device);
    let queue = Arc::new(queue);
    let scheduler = Arc::new(Mutex::new(GlyphVmScheduler::new(device.clone(), queue.clone())));

    let ram_texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
        label: Some("Unified RAM"),
        size: wgpu::Extent3d { width: 4096, height: 4096, depth_or_array_layers: 1 },
        mip_level_count: 1, sample_count: 1, dimension: wgpu::TextureDimension::D2,
        format: wgpu::TextureFormat::Rgba8Uint,
        usage: wgpu::TextureUsages::all(),
        view_formats: &[],
    }));
    scheduler.lock().unwrap().set_ram_texture(&ram_texture);

    // Initial Substrate Setup
    let mut substrate = vec![0u8; 4096 * 4096 * 4];
    // (Optional: Pre-load Daemon and Emulator here)
    
    println!("[BOOT] Substrate initialized.");

    let q_clone = queue.clone();
    let t_clone = ram_texture.clone();
    let d_clone = device.clone();
    let s_clone = scheduler.clone();

    // API Server
    thread::spawn(move || {
        let listener = TcpListener::bind("127.0.0.1:8769").unwrap();
        println!("[API] 🚀 Ouroboros API listening on http://127.0.0.1:8769");
        for stream in listener.incoming() {
            if let Ok(mut stream) = stream {
                handle_hal_request(&mut stream, &q_clone, &t_clone, &d_clone, &s_clone);
            }
        }
    });

    // Substrate Heartbeat
    println!("[EXEC] Substrate pulse starting...");
    loop {
        let start = Instant::now();
        scheduler.lock().unwrap().execute_frame();
        if let Some(delay) = Duration::from_micros(16667).checked_sub(start.elapsed()) {
            thread::sleep(delay);
        }
    }
}

fn handle_hal_request(stream: &mut TcpStream, queue: &wgpu::Queue, texture: &wgpu::Texture, device: &wgpu::Device, scheduler: &Arc<Mutex<GlyphVmScheduler>>) {
    let mut buffer = [0; 65536];
    if let Ok(size) = stream.read(&mut buffer) {
        let request = String::from_utf8_lossy(&buffer[..size]);

        if request.starts_with("GET /force_peek") {
            let addr = request.split("addr=").nth(1).and_then(|s| s.split('&').next().or(s.split(' ').next())).unwrap_or("0x0000");
            let size = request.split("size=").nth(1).and_then(|s| s.split('&').next().or(s.split(' ').next())).unwrap_or("1");
            let addr_val = u32::from_str_radix(addr.trim_start_matches("0x"), 16).unwrap_or(0);
            let size_val = size.parse::<u32>().unwrap_or(1).min(64);

            let bytes_per_row = (size_val * 4 + 255) & !255;
            let staging = device.create_buffer(&wgpu::BufferDescriptor {
                label: None, size: bytes_per_row as u64,
                usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
                mapped_at_creation: false,
            });

            let (tx, ty) = hilbert_d2xy(4096, addr_val);
            let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor { label: None });
            encoder.copy_texture_to_buffer(
                wgpu::ImageCopyTexture { texture, mip_level: 0, origin: wgpu::Origin3d { x: tx, y: ty, z: 0 }, aspect: wgpu::TextureAspect::All },
                wgpu::ImageCopyBuffer { buffer: &staging, layout: wgpu::ImageDataLayout { offset: 0, bytes_per_row: Some(bytes_per_row), rows_per_image: Some(1) } },
                wgpu::Extent3d { width: size_val, height: 1, depth_or_array_layers: 1 },
            );
            queue.submit(Some(encoder.finish()));

            let slice = staging.slice(..);
            let (tx_chan, rx) = std::sync::mpsc::channel();
            slice.map_async(wgpu::MapMode::Read, move |res| { tx_chan.send(res).ok(); });
            device.poll(wgpu::Maintain::Wait);

            let mut hex = String::new();
            if let Ok(Ok(())) = rx.recv() {
                {
                    let data = slice.get_mapped_range();
                    for chunk in data.chunks_exact(4).take(size_val as usize) {
                        hex.push_str(&format!("{:08x} ", u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]])));
                    }
                }
                staging.unmap();
            }
            let response = format!("HTTP/1.1 200 OK\r\n\r\n{}\n", hex);
            let _ = stream.write_all(response.as_bytes());
            return;
        }

        if request.starts_with("GET /peek") {
            let addr = request.split("addr=").nth(1).and_then(|s| s.split('&').next().or(s.split(' ').next())).unwrap_or("0x0000");
            let size = request.split("size=").nth(1).and_then(|s| s.split('&').next().or(s.split(' ').next())).unwrap_or("1");
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
            let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor { label: Some("peek encoder") });
            for i in 0..size_val {
                let (tx, ty) = hilbert_d2xy(4096, addr_val + i);
                encoder.copy_texture_to_buffer(
                    wgpu::ImageCopyTexture { texture, mip_level: 0, origin: wgpu::Origin3d { x: tx, y: ty, z: 0 }, aspect: wgpu::TextureAspect::All },
                    wgpu::ImageCopyBuffer { buffer: &staging, layout: wgpu::ImageDataLayout { offset: 256 * i as u64, bytes_per_row: Some(256), rows_per_image: Some(1) } },
                    wgpu::Extent3d { width: 1, height: 1, depth_or_array_layers: 1 },
                );
            }
            queue.submit(Some(encoder.finish()));

            // Map and read all values
            let slice = staging.slice(..);
            let (tx_chan, rx) = std::sync::mpsc::channel();
            slice.map_async(wgpu::MapMode::Read, move |res| { tx_chan.send(res).ok(); });
            device.poll(wgpu::Maintain::Wait);

            let mut results = Vec::new();
            if let Ok(Ok(())) = rx.recv() {
                {
                    let data = slice.get_mapped_range();
                    for i in 0..size_val as usize {
                        let offset = i * 256;
                        let val = u32::from_le_bytes([data[offset], data[offset+1], data[offset+2], data[offset+3]]);
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
            let addr = request.split("addr=").nth(1).and_then(|s| s.split('&').next().or(s.split(' ').next())).unwrap_or("0x0000");
            let val = request.split("val=").nth(1).and_then(|s| s.split('&').next().or(s.split(' ').next())).unwrap_or("0x00000000");
            
            let addr_val = u32::from_str_radix(addr.trim_start_matches("0x"), 16).unwrap_or(0);
            let val_u32 = u32::from_str_radix(val.trim_start_matches("0x"), 16).unwrap_or(0);
            
            let (tx, ty) = hilbert_d2xy(4096, addr_val);
            let data = val_u32.to_le_bytes();
            
            queue.write_texture(
                wgpu::ImageCopyTexture { texture, mip_level: 0, origin: wgpu::Origin3d { x: tx, y: ty, z: 0 }, aspect: wgpu::TextureAspect::All },
                &data,
                wgpu::ImageDataLayout { offset: 0, bytes_per_row: Some(4), rows_per_image: Some(1) },
                wgpu::Extent3d { width: 1, height: 1, depth_or_array_layers: 1 },
            );
            
            let response = format!("HTTP/1.1 200 OK\r\n\r\nPoked 0x{:08x} at addr 0x{:08x}\n", val_u32, addr_val);
            let _ = stream.write_all(response.as_bytes());
            return;
        } else if request.starts_with("POST /write") {
            let body_start = request.find("\r\n\r\n").unwrap_or(0) + 4;
            let body = &request[body_start..];
            
            let addr_str = request.split("addr=").nth(1).and_then(|s| s.split('&').next().or(s.split(' ').next())).unwrap_or("0x0000");
            let addr_val = u32::from_str_radix(addr_str.trim_start_matches("0x"), 16).unwrap_or(0);
            
            // Body is expected to be hex string for simplicity in this dev tool
            let data_hex = body.trim();
            let mut data = Vec::new();
            for i in (0..data_hex.len()).step_by(8) {
                if i + 8 <= data_hex.len() {
                    if let Ok(val) = u32::from_str_radix(&data_hex[i..i+8], 16) {
                        data.extend_from_slice(&val.to_le_bytes());
                    }
                }
            }

            let num_pixels = (data.len() / 4) as u32;
            for i in 0..num_pixels {
                let (tx, ty) = hilbert_d2xy(4096, addr_val + i);
                queue.write_texture(
                    wgpu::ImageCopyTexture { texture, mip_level: 0, origin: wgpu::Origin3d { x: tx, y: ty, z: 0 }, aspect: wgpu::TextureAspect::All },
                    &data[(i as usize * 4)..(i as usize * 4 + 4)],
                    wgpu::ImageDataLayout { offset: 0, bytes_per_row: Some(4), rows_per_image: Some(1) },
                    wgpu::Extent3d { width: 1, height: 1, depth_or_array_layers: 1 },
                );
            }
            
            let response = format!("HTTP/1.1 200 OK\r\n\r\nWrote {} pixels starting at addr 0x{:08x}\n", num_pixels, addr_val);
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
            let vm_id: u32 = request.split("vm=").nth(1).and_then(|s| s.split(' ').next()).unwrap_or("0").parse().unwrap_or(0);
            let mut s = scheduler.lock().unwrap();
            // For now just return a simple status
            let _ = stream.write_all(format!("HTTP/1.1 200 OK\r\n\r\nVM {} state query (not implemented)\n", vm_id).as_bytes());
            return;
        } else if request.starts_with("POST /load") {
            // Full Reset Load
            let body_start = request.find("\r\n\r\n").unwrap_or(0) + 4;
            let path = request[body_start..].trim();
            println!("[LOAD] Attempting to load: {}", path);
            if let Ok(img) = image::open(path) {
                let rgba = img.to_rgba8();
                let (w, h) = rgba.dimensions();
                println!("[LOAD] Image loaded: {}x{}", w, h);

                // Debug: check first few pixels
                let raw = rgba.as_raw();
                println!("[LOAD] First 16 bytes: {:02x?}", &raw[..16.min(raw.len())]);

                queue.write_texture(
                    wgpu::ImageCopyTexture { texture, mip_level: 0, origin: wgpu::Origin3d::ZERO, aspect: wgpu::TextureAspect::All },
                    rgba.as_raw(),
                    wgpu::ImageDataLayout { offset: 0, bytes_per_row: Some(4 * w), rows_per_image: Some(h) },
                    wgpu::Extent3d { width: w, height: h, depth_or_array_layers: 1 },
                );
                queue.submit([]);
                device.poll(wgpu::Maintain::Wait);
                println!("[LOAD] Texture write submitted and polled");

                // Debug: immediately read back address 0
                let (tx, ty) = hilbert_d2xy(4096, 0);
                let debug_staging = device.create_buffer(&wgpu::BufferDescriptor {
                    label: Some("debug staging"),
                    size: 256,
                    usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
                    mapped_at_creation: false,
                });
                let mut debug_encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor { label: Some("debug peek") });
                debug_encoder.copy_texture_to_buffer(
                    wgpu::ImageCopyTexture { texture, mip_level: 0, origin: wgpu::Origin3d { x: tx, y: ty, z: 0 }, aspect: wgpu::TextureAspect::All },
                    wgpu::ImageCopyBuffer { buffer: &debug_staging, layout: wgpu::ImageDataLayout { offset: 0, bytes_per_row: Some(256), rows_per_image: Some(1) } },
                    wgpu::Extent3d { width: 1, height: 1, depth_or_array_layers: 1 },
                );
                queue.submit(Some(debug_encoder.finish()));
                let slice = debug_staging.slice(..);
                let (debug_tx, debug_rx) = std::sync::mpsc::channel();
                slice.map_async(wgpu::MapMode::Read, move |res| { debug_tx.send(res).ok(); });
                device.poll(wgpu::Maintain::Wait);
                if let Ok(Ok(())) = debug_rx.recv() {
                    let data = slice.get_mapped_range();
                    println!("[LOAD] Immediate peek at 0: {:02x?}", &data[..4]);
                    drop(data);
                    debug_staging.unmap();
                }
                
                // --- THE HARD RESET ---
                let mut s = scheduler.lock().unwrap();
                s.reset_all();
                println!("[LOAD] reset_all() done");

                // Debug: peek BEFORE spawning VM
                let staging_pre = device.create_buffer(&wgpu::BufferDescriptor {
                    label: Some("pre-spawn staging"),
                    size: 256 * 3,
                    usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
                    mapped_at_creation: false,
                });
                let (tx, ty) = hilbert_d2xy(4096, 0);
                let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor { label: Some("pre-spawn encoder") });
                encoder.copy_texture_to_buffer(
                    wgpu::ImageCopyTexture { texture, mip_level: 0, origin: wgpu::Origin3d { x: tx, y: ty, z: 0 }, aspect: wgpu::TextureAspect::All },
                    wgpu::ImageCopyBuffer { buffer: &staging_pre, layout: wgpu::ImageDataLayout { offset: 0, bytes_per_row: Some(256), rows_per_image: Some(1) } },
                    wgpu::Extent3d { width: 1, height: 1, depth_or_array_layers: 1 },
                );
                queue.submit(Some(encoder.finish()));
                let slice = staging_pre.slice(..);
                let (tx_chan, rx) = std::sync::mpsc::channel();
                slice.map_async(wgpu::MapMode::Read, move |res| { tx_chan.send(res).ok(); });
                device.poll(wgpu::Maintain::Wait);
                if let Ok(Ok(())) = rx.recv() {
                    let data = slice.get_mapped_range();
                    println!("[LOAD] Pre-spawn peek at 0: {:02x?}", &data[..4]);
                    drop(data);
                    staging_pre.unmap();
                }

                // Now spawn VM
                let mut regs = [0u32; 128];
                regs[0] = 0x18000; // Guest entry point for emulator
                let config = VmConfig { entry_point: 0, parent_id: 0xFF, base_addr: 0, bound_addr: 0, initial_regs: regs };
                s.spawn_vm(0, &config).unwrap();
                println!("[LOAD] VM spawned");

                let _ = stream.write_all(b"HTTP/1.1 200 OK\r\n\r\nSubstrate Reloaded and VM Spawned\n");
                return;
            }
        }
    }
}

fn hilbert_d2xy(n: u32, d: u32) -> (u32, u32) {
    let (mut x, mut y, mut s, mut t) = (0, 0, 1, d);
    while s < n {
        let rx = 1 & (t / 2);
        let ry = 1 & (t ^ rx);
        if ry == 0 {
            if rx == 1 { x = s - 1 - x; y = s - 1 - y; }
            std::mem::swap(&mut x, &mut y);
        }
        x += s * rx; y += s * ry; t /= 4; s *= 2;
    }
    (x, y)
}
