//! Geometry OS - Ouroboros Daemon (Self-Hosting HAL)
//!
//! This shim provides the physical link between the network and the GPU.
//! It handles GPU initialization and trap dispatch for the glyph-based daemon.
//!
//! HTTP handling is delegated to daemon.glyph which runs on the GPU substrate.
//! This Rust code only handles:
//! - GPU/adapter initialization
//! - Trap polling and dispatch
//! - Raw socket I/O (passing data to glyph for processing)

use std::fs;
use std::io::Read;
use std::io::Write;
use std::net::TcpListener;
use std::os::unix::net::UnixListener;
use std::sync::atomic::{AtomicBool, Ordering};
use std::sync::{Arc, Mutex, OnceLock};
use std::thread;
use std::time::{Duration, Instant};

use tokio::runtime::Runtime;

use infinite_map_rs::brain_bridge::{BrainBridge, BrainBridgeConfig};
use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};
use infinite_map_rs::trap_interface::{TrapRegs, op_type, status, TRAP_BASE};

/// Static Tokio runtime for async operations (avoids creating new runtime on each trap)
static TOKIO_RT: OnceLock<Runtime> = OnceLock::new();

fn get_tokio_rt() -> &'static Runtime {
    TOKIO_RT.get_or_init(|| Runtime::new().expect("Failed to create tokio runtime"))
}

/// Call LM Studio for inference via HTTP
async fn call_lm_studio(request: &str) -> Result<String, Box<dyn std::error::Error + Send + Sync>> {
    let client = reqwest::Client::new();
    let response = client
        .post("http://localhost:1234/v1/chat/completions")
        .json(&serde_json::json!({
            "model": "qwen/qwen3.5-9b",
            "messages": [{"role": "user", "content": request}],
            "max_tokens": 50,
            "temperature": 0.9
        }))
        .timeout(std::time::Duration::from_secs(5))
        .send()
        .await?;

    if response.status().is_success() {
        let json: serde_json::Value = response.json().await?;
        let content = json["choices"][0]["message"]["content"]
            .as_str()
            .unwrap_or("")
            .to_string();
        Ok(content)
    } else {
        Err(format!("LM Studio error: {}", response.status()).into())
    }
}

/// Memory locations for daemon.glyph communication
const REQ_BUFFER: u32 = 0x4000;
const RES_BUFFER: u32 = 0x5000;
const CTRL_PORT: u32 = 0x6000;

/// Control port values
const CTRL_IDLE: u32 = 0;
const CTRL_REQUEST_PENDING: u32 = 1;
const CTRL_RESPONSE_READY: u32 = 2;

/// Handles trap requests from glyph programs
struct TrapHandler {
    regs: TrapRegs,
}

impl TrapHandler {
    fn new() -> Self {
        Self {
            regs: TrapRegs::default(),
        }
    }

    /// Check if a pending trap exists and execute it
    fn poll_and_execute(
        &mut self,
        scheduler: &mut GlyphVmScheduler,
        _texture: &wgpu::Texture,
        _device: &wgpu::Device,
        _queue: &wgpu::Queue,
    ) -> bool {
        // Read trap registers from substrate
        let trap_bytes = scheduler.peek_substrate(TRAP_BASE, 6);
        self.regs = TrapRegs::from_bytes(trap_bytes);

        if self.regs.status != status::PENDING {
            return false;
        }

        // Execute the requested operation
        let result = match self.regs.op_type {
            op_type::SPAWN_VM => {
                let entry = self.regs.arg0;
                let config = self.regs.arg1;
                scheduler.spawn_vm_from_trap(entry, config) as u32
            }
            op_type::KILL_VM => {
                let vm_id = self.regs.arg0;
                scheduler.kill_vm(vm_id) as u32
            }
            op_type::PEEK_SUBSTRATE => {
                let addr = self.regs.arg0;
                scheduler.peek_substrate_single(addr)
            }
            op_type::POKE_SUBSTRATE => {
                let addr = self.regs.arg0;
                let val = self.regs.arg1;
                scheduler.poke_substrate_single(addr, val);
                0
            }
            op_type::LM_STUDIO => {
                // arg0 = request_addr (in substrate)
                // arg1 = request_length
                // arg2 = response_addr (in substrate)
                let request_addr = self.regs.arg0;
                let request_len = self.regs.arg1 as usize;
                let response_addr = self.regs.arg2;

                // Read request from substrate
                let request_bytes: Vec<u8> = (0..request_len)
                    .map(|i| scheduler.peek_substrate_single(request_addr + i as u32) as u8)
                    .collect();
                let request = String::from_utf8_lossy(&request_bytes).to_string();

                // Call LM Studio
                let response = get_tokio_rt().block_on(call_lm_studio(&request)).unwrap_or_default();

                // Write response to substrate
                for (i, byte) in response.bytes().take(4096).enumerate() {
                    scheduler.poke_substrate_single(response_addr + i as u32, byte as u32);
                }

                response.len() as u32
            }
            _ => {
                eprintln!("[TRAP] Unknown op_type: {}", self.regs.op_type);
                0xFFFF_FFFF // Error code
            }
        };

        // Write result and mark complete
        self.regs.result = result;
        self.regs.status = status::COMPLETE;
        scheduler.write_trap_regs(&self.regs);

        true
    }
}

fn main() {
    println!("I AM STARTING");
    std::io::stdout().flush().unwrap();
    println!("CWD: {:?}", std::env::current_dir().unwrap());
    std::io::stdout().flush().unwrap();
    println!("============================================================");
    std::io::stdout().flush().unwrap();
    println!("  GEOMETRY OS - OUROBOROS DAEMON (Phase 70 - Glyph HTTP)");
    std::io::stdout().flush().unwrap();
    println!("============================================================");
    std::io::stdout().flush().unwrap();

    // === GPU INITIALIZATION ===
    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor::default());
    let adapter =
        pollster::block_on(instance.request_adapter(&wgpu::RequestAdapterOptions::default()))
            .unwrap();

    // Print adapter info
    let info = adapter.get_info();
    println!("[GPU] Adapter: {} ({:?})", info.name, info.backend);

    let (device, queue) = pollster::block_on(adapter.request_device(
        &wgpu::DeviceDescriptor {
            label: Some("Ouroboros GPU"),
            required_features: wgpu::Features::TEXTURE_ADAPTER_SPECIFIC_FORMAT_FEATURES,
            required_limits: wgpu::Limits::default(),
        },
        None,
    ))
    .unwrap();

    // Print device limits
    let limits = device.limits();
    println!("[GPU] Max texture dimension 2D: {}", limits.max_texture_dimension_2d);

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

    // Load scheduler.glyph into VM 0
    let scheduler_glyph_path = "systems/glyph_stratum/programs/scheduler.glyph";
    if let Ok(_glyph_bytes) = std::fs::read(scheduler_glyph_path) {
        println!("[BOOT] Loading scheduler.glyph into VM 0...");
        let config = VmConfig {
            entry_point: 0,
            ..Default::default()
        };
        match scheduler.lock().unwrap().spawn_vm(0, &config) {
            Ok(()) => println!("[BOOT] scheduler.glyph loaded as VM 0"),
            Err(e) => eprintln!("[BOOT] Warning: Failed to spawn VM 0: {}", e),
        }
    } else {
        println!("[BOOT] Warning: Could not load scheduler.glyph, running without meta-scheduler");
    }

    // Load daemon.glyph into VM 1 for HTTP handling
    let daemon_glyph_path = "systems/glyph_stratum/programs/daemon.glyph";
    if let Ok(glyph_bytes) = std::fs::read(daemon_glyph_path) {
        println!("[BOOT] Loading daemon.glyph into VM 1...");
        // Write glyph bytes to substrate at address 0
        write_glyph_to_substrate(&glyph_bytes, &ram_texture, &device, &queue, 0);

        let config = VmConfig {
            entry_point: 0,
            ..Default::default()
        };
        match scheduler.lock().unwrap().spawn_vm(1, &config) {
            Ok(()) => println!("[BOOT] daemon.glyph loaded as VM 1 (HTTP handler)"),
            Err(e) => eprintln!("[BOOT] Warning: Failed to spawn VM 1: {}", e),
        }
    } else {
        println!("[BOOT] Warning: Could not load daemon.glyph, HTTP handling disabled");
    }

    // Initial Substrate Setup
    let _substrate = vec![0u8; 4096 * 4096 * 4];

    println!("[BOOT] Substrate initialized.");
    std::io::stdout().flush().unwrap();

    let bridge_config = BrainBridgeConfig::default();
    let brain_bridge = Arc::new(BrainBridge::new(
        bridge_config,
        device.clone(),
        queue.clone(),
        ram_texture.clone(),
    ));

    let trap_handler = Arc::new(Mutex::new(TrapHandler::new()));
    println!("[TRAP] Handler initialized");

    // Shutdown flag for clean exit
    let shutdown = Arc::new(AtomicBool::new(false));

    // === TCP SOCKET SERVER ===
    let q_clone = queue.clone();
    let t_clone = ram_texture.clone();
    let d_clone = device.clone();
    let s_clone = scheduler.clone();
    let shutdown_clone = shutdown.clone();
    thread::spawn(move || {
        let listener = match TcpListener::bind("0.0.0.0:8769") {
            Ok(l) => l,
            Err(e) => {
                eprintln!("[API] Failed to bind TCP socket: {}", e);
                return;
            }
        };
        println!("[API] Ouroboros API listening on http://0.0.0.0:8769");
        std::io::stdout().flush().unwrap();

        for stream in listener.incoming() {
            if shutdown_clone.load(Ordering::Relaxed) {
                break;
            }
            if let Ok(mut stream) = stream {
                handle_raw_request(
                    &mut stream,
                    &q_clone,
                    &t_clone,
                    &d_clone,
                    &s_clone,
                );
            }
        }
    });

    // === UNIX SOCKET SERVER ===
    let socket_path = "/tmp/gpu_daemon.sock";
    if fs::metadata(socket_path).is_ok() {
        let _ = fs::remove_file(socket_path);
    }
    let listener = UnixListener::bind(socket_path).unwrap();
    println!(
        "[API] Ouroboros Unix socket listening on {}",
        socket_path
    );
    std::io::stdout().flush().unwrap();

    let q_clone_unix = queue.clone();
    let t_clone_unix = ram_texture.clone();
    let d_clone_unix = device.clone();
    let s_clone_unix = scheduler.clone();
    let shutdown_unix = shutdown.clone();
    thread::spawn(move || {
        for stream in listener.incoming() {
            if shutdown_unix.load(Ordering::Relaxed) {
                break;
            }
            if let Ok(mut stream) = stream {
                handle_raw_request(
                    &mut stream,
                    &q_clone_unix,
                    &t_clone_unix,
                    &d_clone_unix,
                    &s_clone_unix,
                );
            }
        }
    });

    // === BRAIN BRIDGE THREAD ===
    println!("[MAIN] About to spawn Brain Bridge thread...");
    std::io::stdout().flush().unwrap();
    let b_clone_loop = brain_bridge.clone();
    thread::spawn(move || {
        println!("[BRIDGE] Starting Brain Bridge thread...");
        std::io::stdout().flush().unwrap();
        let rt = tokio::runtime::Runtime::new().unwrap();
        rt.block_on(async {
            println!("[BRIDGE] Inside tokio runtime, calling start()...");
            std::io::stdout().flush().unwrap();
            b_clone_loop.start().await;
        });
    });
    println!("[MAIN] Brain Bridge thread spawned successfully");
    std::io::stdout().flush().unwrap();

    // === SUBSTRATE HEARTBEAT ===
    println!("I AM INITIALIZED");
    std::io::stdout().flush().unwrap();
    println!("[EXEC] Substrate pulse starting...");
    std::io::stdout().flush().unwrap();

    let trap_handler_loop = trap_handler.clone();
    let scheduler_loop = scheduler.clone();
    let texture_loop = ram_texture.clone();
    let device_loop = device.clone();
    let queue_loop = queue.clone();

    loop {
        println!("I AM IN THE LOOP");
        std::io::stdout().flush().unwrap();
        let start = Instant::now();

        // Execute VM frame
        scheduler.lock().unwrap().execute_frame();

        // Poll for trap requests
        {
            let mut th = trap_handler_loop.lock().unwrap();
            let mut sched = scheduler_loop.lock().unwrap();
            th.poll_and_execute(
                &mut sched,
                &texture_loop,
                &device_loop,
                &queue_loop,
            );
        }

        if let Some(delay) = Duration::from_micros(16667).checked_sub(start.elapsed()) {
            thread::sleep(delay);
        }
    }
}

/// Write glyph bytes to substrate at the specified address
fn write_glyph_to_substrate(
    glyph_bytes: &[u8],
    texture: &wgpu::Texture,
    device: &wgpu::Device,
    queue: &wgpu::Queue,
    base_addr: u32,
) {
    // Pad to 4-byte boundaries
    let padded_len = (glyph_bytes.len() + 3) & !3;
    let mut padded_data = vec![0u8; padded_len];
    padded_data[..glyph_bytes.len()].copy_from_slice(glyph_bytes);

    // Write each 4-byte word as a pixel
    let num_words = padded_len / 4;
    for i in 0..num_words {
        let (tx, ty) = hilbert_d2xy(4096, base_addr + i as u32);
        let word = &padded_data[i * 4..i * 4 + 4];
        queue.write_texture(
            wgpu::ImageCopyTexture {
                texture,
                mip_level: 0,
                origin: wgpu::Origin3d { x: tx, y: ty, z: 0 },
                aspect: wgpu::TextureAspect::All,
            },
            word,
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
    device.poll(wgpu::Maintain::Wait);
}

/// Handle raw socket request by passing to daemon.glyph via substrate
fn handle_raw_request<S: Read + Write>(
    stream: &mut S,
    queue: &wgpu::Queue,
    texture: &wgpu::Texture,
    device: &wgpu::Device,
    scheduler: &Arc<Mutex<GlyphVmScheduler>>,
) {
    let mut buffer = [0u8; 4096];

    // Read request
    let size = match stream.read(&mut buffer) {
        Ok(0) => return, // Connection closed
        Ok(n) => n,
        Err(_) => return,
    };

    let request_data = &buffer[..size];

    // Write request to REQ_BUFFER in substrate
    write_to_substrate(request_data, texture, device, queue, REQ_BUFFER);

    // Signal request pending to daemon.glyph
    write_u32_to_substrate(CTRL_PORT, CTRL_REQUEST_PENDING, texture, queue);

    // Wait for response (with timeout)
    let start = Instant::now();
    let timeout = Duration::from_secs(30);

    loop {
        // Check control port for response ready
        let ctrl_val = read_u32_from_substrate(CTRL_PORT, texture, device, queue);

        if ctrl_val == CTRL_RESPONSE_READY {
            // Read response from RES_BUFFER
            let response = read_from_substrate(1024, texture, device, queue, RES_BUFFER);

            // Send response back to client
            let _ = stream.write_all(&response);

            // Reset control port
            write_u32_to_substrate(CTRL_PORT, CTRL_IDLE, texture, queue);
            return;
        }

        if start.elapsed() > timeout {
            // Timeout - send simple error response
            let _ = stream.write_all(b"HTTP/1.1 504 Gateway Timeout\r\n\r\nGlyph daemon timeout\n");
            write_u32_to_substrate(CTRL_PORT, CTRL_IDLE, texture, queue);
            return;
        }

        // Small delay before polling again
        thread::sleep(Duration::from_millis(1));

        // Also execute a VM frame to allow daemon.glyph to process
        scheduler.lock().unwrap().execute_frame();
    }
}

/// Write bytes to substrate at specified address
fn write_to_substrate(
    data: &[u8],
    texture: &wgpu::Texture,
    device: &wgpu::Device,
    queue: &wgpu::Queue,
    base_addr: u32,
) {
    // Pad to 4-byte boundaries
    let padded_len = (data.len() + 3) & !3;
    let mut padded_data = vec![0u8; padded_len];
    padded_data[..data.len()].copy_from_slice(data);

    let num_words = padded_len / 4;
    for i in 0..num_words {
        let (tx, ty) = hilbert_d2xy(4096, base_addr + i as u32);
        let word = &padded_data[i * 4..i * 4 + 4];
        queue.write_texture(
            wgpu::ImageCopyTexture {
                texture,
                mip_level: 0,
                origin: wgpu::Origin3d { x: tx, y: ty, z: 0 },
                aspect: wgpu::TextureAspect::All,
            },
            word,
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
    device.poll(wgpu::Maintain::Wait);
}

/// Write a single u32 to substrate at specified address
fn write_u32_to_substrate(
    addr: u32,
    value: u32,
    texture: &wgpu::Texture,
    queue: &wgpu::Queue,
) {
    let (tx, ty) = hilbert_d2xy(4096, addr);
    let data = value.to_le_bytes();
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
}

/// Read a single u32 from substrate at specified address
fn read_u32_from_substrate(
    addr: u32,
    texture: &wgpu::Texture,
    device: &wgpu::Device,
    queue: &wgpu::Queue,
) -> u32 {
    let (tx, ty) = hilbert_d2xy(4096, addr);

    let staging = device.create_buffer(&wgpu::BufferDescriptor {
        label: Some("read_u32 staging"),
        size: 256,
        usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
        mapped_at_creation: false,
    });

    let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
        label: Some("read_u32 encoder"),
    });

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

    let slice = staging.slice(..);
    let (tx_chan, rx) = std::sync::mpsc::channel();
    slice.map_async(wgpu::MapMode::Read, move |res| {
        tx_chan.send(res).ok();
    });
    device.poll(wgpu::Maintain::Wait);

    if let Ok(Ok(())) = rx.recv() {
        let data = slice.get_mapped_range();
        let val = u32::from_le_bytes([data[0], data[1], data[2], data[3]]);
        drop(data);
        staging.unmap();
        val
    } else {
        0
    }
}

/// Read bytes from substrate at specified address
fn read_from_substrate(
    max_bytes: usize,
    texture: &wgpu::Texture,
    device: &wgpu::Device,
    queue: &wgpu::Queue,
    base_addr: u32,
) -> Vec<u8> {
    let num_words = (max_bytes + 3) / 4;

    let staging = device.create_buffer(&wgpu::BufferDescriptor {
        label: Some("read_from_substrate staging"),
        size: (num_words * 4) as u64,
        usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
        mapped_at_creation: false,
    });

    let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
        label: Some("read_from_substrate encoder"),
    });

    for i in 0..num_words as u32 {
        let (tx, ty) = hilbert_d2xy(4096, base_addr + i);
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

    let mut result = Vec::with_capacity(max_bytes);
    if let Ok(Ok(())) = rx.recv() {
        let data = slice.get_mapped_range();
        result.extend_from_slice(&data[..max_bytes.min(data.len())]);
        drop(data);
        staging.unmap();
    }
    result
}

/// Hilbert curve: distance to (x,y) coordinates
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
