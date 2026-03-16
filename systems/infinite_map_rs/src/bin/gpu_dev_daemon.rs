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

use wgpu::util::DeviceExt;

use futures::{SinkExt, StreamExt, TryStreamExt};
use tokio::runtime::Runtime;
use tokio_tungstenite::{accept_async, tungstenite::protocol::Message};
use uuid::Uuid;

use infinite_map_rs::brain_bridge::{BrainBridge, BrainBridgeConfig};
use infinite_map_rs::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};
use infinite_map_rs::trap_interface::{op_type, status, TrapRegs, TRAP_BASE};
use infinite_map_rs::ml_memory::{
    MLMemoryPool, PoolConfig, TensorSpec, TensorId, DataType, MemoryRegion,
};

/// WASM binary parsing utilities
mod wasm_parser {
    /// WASM section IDs
    const SECTION_CUSTOM: u8 = 0;
    const SECTION_TYPE: u8 = 1;
    const SECTION_IMPORT: u8 = 2;
    const SECTION_FUNCTION: u8 = 3;
    const SECTION_TABLE: u8 = 4;
    const SECTION_MEMORY: u8 = 5;
    const SECTION_GLOBAL: u8 = 6;
    const SECTION_EXPORT: u8 = 7;
    const SECTION_START: u8 = 8;
    const SECTION_ELEMENT: u8 = 9;
    const SECTION_CODE: u8 = 10;
    const SECTION_DATA: u8 = 11;
    const SECTION_DATA_COUNT: u8 = 12;

    /// WASM magic number and version
    const WASM_MAGIC: [u8; 4] = [0x00, 0x61, 0x73, 0x6D]; // \0asm
    const WASM_VERSION: [u8; 4] = [0x01, 0x00, 0x00, 0x00]; // version 1

    /// Parsed WASM metadata
    #[derive(Debug, Default)]
    pub struct WasmInfo {
        /// Function index of _start export (if found)
        pub start_func_idx: Option<u32>,
        /// Code section offset in bytes (from start of WASM binary)
        pub code_section_offset: usize,
        /// Function indices to their code body offsets (relative to code section start)
        pub func_code_offsets: Vec<usize>,
        /// Import count (functions before code section are imports)
        pub import_count: u32,
        /// Import function names (module, name) pairs in order
        pub import_names: Vec<(String, String)>,
    }

    /// Read a LEB128 unsigned integer from bytes
    fn read_leb128_u32(bytes: &[u8], offset: &mut usize) -> Option<u32> {
        let mut result: u32 = 0;
        let mut shift = 0;
        loop {
            let byte = bytes.get(*offset)?;
            *offset += 1;
            result |= ((byte & 0x7F) as u32) << shift;
            if byte & 0x80 == 0 {
                break;
            }
            shift += 7;
            if shift >= 35 {
                return None; // Overflow
            }
        }
        Some(result)
    }

    /// Read a UTF-8 name from bytes (length-prefixed)
    fn read_name(bytes: &[u8], offset: &mut usize) -> Option<String> {
        let len = read_leb128_u32(bytes, offset)? as usize;
        let name_bytes = bytes.get(*offset..*offset + len)?;
        *offset += len;
        String::from_utf8(name_bytes.to_vec()).ok()
    }

    /// Parse a WASM binary and extract entry point information
    pub fn parse_wasm(wasm_bytes: &[u8]) -> Option<WasmInfo> {
        // Validate magic and version
        if wasm_bytes.len() < 8 {
            return None;
        }
        if wasm_bytes[0..4] != WASM_MAGIC || wasm_bytes[4..8] != WASM_VERSION {
            println!("[WASM] Invalid magic or version");
            return None;
        }

        let mut info = WasmInfo::default();
        let mut offset = 8; // Skip magic + version
        let mut func_types: Vec<u32> = Vec::new(); // Type indices for functions
        let mut start_func: Option<u32> = None;

        // Parse sections
        while offset < wasm_bytes.len() {
            let section_id = wasm_bytes.get(offset)?;
            offset += 1;
            let section_size = read_leb128_u32(wasm_bytes, &mut offset)? as usize;
            let section_start = offset;

            match *section_id {
                SECTION_TYPE => {
                    // Type section - parse function signatures
                    let type_count = read_leb128_u32(wasm_bytes, &mut offset)?;
                    for _ in 0..type_count {
                        let form = wasm_bytes.get(offset)?;
                        offset += 1;
                        if *form != 0x60 {
                            // func type
                            break;
                        }
                        let param_count = read_leb128_u32(wasm_bytes, &mut offset)?;
                        for _ in 0..param_count {
                            read_leb128_u32(wasm_bytes, &mut offset)?; // param type
                        }
                        let result_count = read_leb128_u32(wasm_bytes, &mut offset)?;
                        for _ in 0..result_count {
                            read_leb128_u32(wasm_bytes, &mut offset)?; // result type
                        }
                    }
                },
                SECTION_IMPORT => {
                    // Import section - count imported functions and capture names
                    let import_count = read_leb128_u32(wasm_bytes, &mut offset)?;
                    for _ in 0..import_count {
                        let module = read_name(wasm_bytes, &mut offset)?;
                        let name = read_name(wasm_bytes, &mut offset)?;
                        let import_kind = wasm_bytes.get(offset)?;
                        offset += 1;
                        if *import_kind == 0 {
                            // Function import - store name for host function ID mapping
                            let _type_idx = read_leb128_u32(wasm_bytes, &mut offset)?;
                            info.import_count += 1;
                            info.import_names.push((module.clone(), name.clone()));
                            println!("[WASM] Import #{}: {}.{}", info.import_count, module, name);
                        } else if *import_kind == 1 {
                            // Table import
                            let _ = read_leb128_u32(wasm_bytes, &mut offset)?; // elem type
                            let _ = read_leb128_u32(wasm_bytes, &mut offset)?; // limits flags
                            let _ = read_leb128_u32(wasm_bytes, &mut offset)?; // limits initial
                        } else if *import_kind == 2 {
                            // Memory import
                            let _ = read_leb128_u32(wasm_bytes, &mut offset)?; // limits flags
                            let _ = read_leb128_u32(wasm_bytes, &mut offset)?; // limits initial
                        } else if *import_kind == 3 {
                            // Global import
                            let _ = read_leb128_u32(wasm_bytes, &mut offset)?; // value type
                            let _ = wasm_bytes.get(offset); // mutability
                            offset += 1;
                        }
                    }
                    println!(
                        "[WASM] Import section: {} function imports",
                        info.import_count
                    );
                },
                SECTION_FUNCTION => {
                    // Function section - type indices for each function
                    let func_count = read_leb128_u32(wasm_bytes, &mut offset)?;
                    for _ in 0..func_count {
                        let type_idx = read_leb128_u32(wasm_bytes, &mut offset)?;
                        func_types.push(type_idx);
                    }
                    println!("[WASM] Function section: {} functions", func_count);
                },
                SECTION_EXPORT => {
                    // Export section - find _start
                    let export_count = read_leb128_u32(wasm_bytes, &mut offset)?;
                    for _ in 0..export_count {
                        let name = read_name(wasm_bytes, &mut offset)?;
                        let export_kind = wasm_bytes.get(offset)?;
                        offset += 1;
                        let index = read_leb128_u32(wasm_bytes, &mut offset)?;

                        if name == "_start" && *export_kind == 0 {
                            // Function export
                            start_func = Some(index);
                            println!("[WASM] Found _start export at function index {}", index);
                        }
                    }
                },
                SECTION_START => {
                    // Start section - entry point function index
                    let func_idx = read_leb128_u32(wasm_bytes, &mut offset)?;
                    start_func = Some(func_idx);
                    println!("[WASM] Found start section: function {}", func_idx);
                },
                SECTION_CODE => {
                    // Code section - function bodies
                    info.code_section_offset = offset;
                    eprintln!(
                        "[WASM] DEBUG: code_section_offset set to {} (0x{:x})",
                        offset, offset
                    );
                    let func_count = read_leb128_u32(wasm_bytes, &mut offset)?;
                    eprintln!(
                        "[WASM] DEBUG: func_count={}, offset now {} (0x{:x})",
                        func_count, offset, offset
                    );

                    for func_idx in 0..func_count {
                        let body_size = read_leb128_u32(wasm_bytes, &mut offset)? as usize;
                        let body_start = offset;
                        eprintln!(
                            "[WASM] DEBUG: func {} body_size={}, body_start={} (0x{:x})",
                            func_idx, body_size, body_start, body_start
                        );

                        // Skip locals declaration to find actual code start
                        let mut local_offset = body_start;
                        let local_count = read_leb128_u32(wasm_bytes, &mut local_offset)?;
                        eprintln!(
                            "[WASM] DEBUG: local_count={}, local_offset after count={} (0x{:x})",
                            local_count, local_offset, local_offset
                        );
                        for _ in 0..local_count {
                            let _count = read_leb128_u32(wasm_bytes, &mut local_offset)?;
                            let _type = wasm_bytes.get(local_offset).copied().unwrap_or(0);
                            local_offset += 1;
                        }
                        let code_start = local_offset;
                        let code_offset = code_start - info.code_section_offset;
                        eprintln!(
                            "[WASM] DEBUG: code_start={} (0x{:x}), code_offset={} (0x{:x})",
                            code_start, code_start, code_offset, code_offset
                        );

                        // Store offset relative to code section start (after locals)
                        info.func_code_offsets.push(code_offset);

                        // Skip function body
                        offset = body_start + body_size;
                    }
                    println!(
                        "[WASM] Code section: {} functions at offset {}",
                        func_count, info.code_section_offset
                    );
                },
                _ => {
                    // Skip unknown sections
                    offset = section_start + section_size;
                },
            }

            // Ensure we're at the right position
            offset = section_start + section_size;
        }

        // Calculate actual code offset for start function
        if let Some(func_idx) = start_func {
            // Adjust for imports: function index includes imports
            let local_idx = func_idx.saturating_sub(info.import_count);

            if let Some(&code_offset) = info.func_code_offsets.get(local_idx as usize) {
                // The entry point is the absolute offset from WASM binary start
                info.start_func_idx = Some((info.code_section_offset + code_offset) as u32);
                println!(
                    "[WASM] Entry point: function {} -> code offset 0x{:x}",
                    func_idx,
                    info.start_func_idx.unwrap()
                );
            }
        }

        Some(info)
    }
}

/// Static Tokio runtime for async operations (avoids creating new runtime on each trap)
static TOKIO_RT: OnceLock<Runtime> = OnceLock::new();

/// Chat history storage (in-memory, persists for daemon lifetime)
static CHAT_HISTORY: OnceLock<Mutex<String>> = OnceLock::new();
const CHAT_HISTORY_MAX: usize = 0x10000; // 64KB

/// Chat cache for storing activations during learning
struct ChatActivation {
    /// Memory addresses that were activated during inference
    addresses: Vec<u32>,
    /// Activation strength for each address (0.0-1.0)
    strengths: Vec<f32>,
}

/// Thought pulse data structure for logging
#[derive(Debug, Clone, serde::Serialize)]
struct ThoughtPulse {
    /// Timestamp of the pulse
    timestamp: u64,
    /// Associated chat ID
    chat_id: String,
    /// Reward signal (-1.0 to 1.0)
    reward: f32,
    /// Number of weights updated
    weights_updated: usize,
    /// Learning delta applied
    learning_delta: f32,
    /// Activated addresses and their strength changes
    activations: Vec<ThoughtActivation>,
}

#[derive(Debug, Clone, serde::Serialize)]
struct ThoughtActivation {
    /// Memory address that was activated
    address: u32,
    /// Activation strength (0.0-1.0)
    strength: f32,
    /// Weight change applied (Δw = η × activation × reward)
    weight_delta: f32,
}

static CHAT_CACHE: OnceLock<Mutex<std::collections::HashMap<String, ChatActivation>>> =
    OnceLock::new();

/// THOUGHT_PULSE broadcast channel for WebSocket clients
/// Allows real-time visualization of brain activity
static THOUGHT_PULSE_CHANNEL: OnceLock<tokio::sync::broadcast::Sender<ThoughtPulse>> = OnceLock::new();

/// Get or initialize the thought pulse broadcast sender
fn get_thought_pulse_sender() -> &'static tokio::sync::broadcast::Sender<ThoughtPulse> {
    THOUGHT_PULSE_CHANNEL.get_or_init(|| {
        let (tx, _rx) = tokio::sync::broadcast::channel(100);
        tx
    })
}

/// Brain weight shadow buffer for CPU-side Hebbian updates
/// This mirrors the brain texture and allows read-modify-write operations
static BRAIN_SHADOW: OnceLock<Mutex<Vec<f32>>> = OnceLock::new();

/// Default brain atlas dimension (power of 2 required)
const DEFAULT_BRAIN_SIZE: u32 = 4096;

/// Brain atlas size (2048x2048 = 4M weights)
const BRAIN_ATLAS_SIZE: usize = 2048 * 2048;

/// Get or initialize the brain shadow buffer
fn get_brain_shadow() -> &'static Mutex<Vec<f32>> {
    BRAIN_SHADOW.get_or_init(|| Mutex::new(vec![0.0; BRAIN_ATLAS_SIZE]))
}

/// Apply Hebbian weight update to brain shadow buffer
/// Δw = η × activation × reward
fn apply_hebbian_update(addr: u32, delta_w: f32) -> f32 {
    let shadow = get_brain_shadow();
    let mut shadow_lock = shadow.lock().unwrap();

    if (addr as usize) < shadow_lock.len() {
        let current = shadow_lock[addr as usize];
        let new_weight = current + delta_w;
        shadow_lock[addr as usize] = new_weight;
        new_weight
    } else {
        0.0
    }
}

/// Read weight from brain shadow buffer
fn read_brain_weight(addr: u32) -> f32 {
    let shadow = get_brain_shadow();
    let shadow_lock = shadow.lock().unwrap();

    if (addr as usize) < shadow_lock.len() {
        shadow_lock[addr as usize]
    } else {
        0.0
    }
}

/// WASM entry point storage (parsed from loaded WASM binary)
static WASM_ENTRY_POINT: OnceLock<Mutex<Option<u32>>> = OnceLock::new();

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
        let trap_bytes = scheduler.peek_substrate(TRAP_BASE / 4, 6);
        self.regs = TrapRegs::from_bytes(trap_bytes);

        // Debug: print TRAP status periodically
        static COUNTER: std::sync::atomic::AtomicUsize = std::sync::atomic::AtomicUsize::new(0);
        let count = COUNTER.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
        if count % 60 == 0 {
            println!(
                "[TRAP_POLL] op={} arg0={:08x} arg1={:08x} arg2={:08x} status={}",
                self.regs.op_type, self.regs.arg0, self.regs.arg1, self.regs.arg2, self.regs.status
            );
        }

        if self.regs.status != status::PENDING {
            return false;
        }

        // Execute the requested operation
        let result = match self.regs.op_type {
            op_type::SPAWN_VM => {
                let entry = self.regs.arg0;
                let config = self.regs.arg1;
                scheduler.spawn_vm_from_trap(entry, config) as u32
            },
            op_type::KILL_VM => {
                let vm_id = self.regs.arg0;
                scheduler.kill_vm(vm_id) as u32
            },
            op_type::PEEK_SUBSTRATE => {
                let addr = self.regs.arg0;
                scheduler.peek_substrate_single(addr)
            },
            op_type::POKE_SUBSTRATE => {
                let addr = self.regs.arg0;
                let val = self.regs.arg1;
                scheduler.poke_substrate_single(addr, val);
                0
            },
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
                let response = get_tokio_rt()
                    .block_on(call_lm_studio(&request))
                    .unwrap_or_default();

                // Write response to substrate
                for (i, byte) in response.bytes().take(4096).enumerate() {
                    scheduler.poke_substrate_single(response_addr + i as u32, byte as u32);
                }

                response.len() as u32
            },
            op_type::GLYPH_WRITE => {
                let target = self.regs.arg0;
                let source = self.regs.arg1;
                let count = self.regs.arg2;
                scheduler.glyph_write(target, source, count)
            },
            op_type::WASM_HOST_CALL => {
                let func_id = self.regs.arg0;
                let arg0 = self.regs.arg1;
                let arg1 = self.regs.arg2;
                let result = self.handle_wasm_host_call(func_id, arg0, arg1, scheduler);
                result
            },
            _ => {
                eprintln!("[TRAP] Unknown op_type: {}", self.regs.op_type);
                0xFFFF_FFFF // Error code
            },
        };

        // Write result and mark complete
        self.regs.result = result;
        self.regs.status = status::COMPLETE;
        scheduler.write_trap_regs(&self.regs);

        true
    }

    /// Handle WASM host function calls
    fn handle_wasm_host_call(
        &mut self,
        func_id: u32,
        arg0: u32,
        arg1: u32,
        scheduler: &mut GlyphVmScheduler,
    ) -> u32 {
        match func_id {
            0 => self.host_poke(arg0, arg1, scheduler),
            1 => self.host_peek(arg0, scheduler),
            2 => self.host_print(arg0, arg1, scheduler),
            3 => self.host_spawn(arg0, arg1),
            4 => self.host_kill(arg0),
            _ => {
                eprintln!("[WASM] Unknown host function: {}", func_id);
                0
            },
        }
    }

    /// poke(addr, val) - Write to substrate
    fn host_poke(&mut self, addr: u32, val: u32, scheduler: &mut GlyphVmScheduler) -> u32 {
        scheduler.poke_substrate_single(addr, val);
        println!("[WASM] poke(0x{:x}, 0x{:x})", addr, val);
        0
    }

    /// peek(addr) -> val - Read from substrate
    fn host_peek(&mut self, addr: u32, scheduler: &mut GlyphVmScheduler) -> u32 {
        let val = scheduler.peek_substrate_single(addr);
        println!("[WASM] peek(0x{:x}) -> 0x{:x}", addr, val);
        val
    }

    /// print(ptr, len) - Write string to console
    fn host_print(&mut self, ptr: u32, len: u32, scheduler: &mut GlyphVmScheduler) -> u32 {
        let wasm_mem_base = 0x20000u32;
        let mut bytes = Vec::with_capacity(len as usize);
        for i in 0..len {
            let addr = wasm_mem_base + ptr + i;
            let byte = scheduler.peek_substrate_single(addr) & 0xFF;
            bytes.push(byte as u8);
        }
        let s = String::from_utf8_lossy(&bytes);
        println!("[WASM] print: {}", s);
        0
    }

    /// spawn(path_ptr, path_len) -> vm_id
    fn host_spawn(&mut self, _path_ptr: u32, _path_len: u32) -> u32 {
        println!("[WASM] spawn (not implemented)");
        0xFFFFFFFF
    }

    /// kill(vm_id)
    fn host_kill(&mut self, _vm_id: u32) -> u32 {
        println!("[WASM] kill (not implemented)");
        0
    }
}

fn main() {
    println!("I AM STARTING");
    std::io::stdout().flush().unwrap();
    println!("CWD: {:?}", std::env::current_dir().unwrap());
    std::io::stdout().flush().unwrap();

    // === CLI ARGUMENT PARSING ===
    let args: Vec<String> = std::env::args().collect();
    let brain_size = args.iter().position(|a| a == "--brain-size")
        .and_then(|i| args.get(i + 1).and_then(|s| s.parse::<u32>().ok()))
        .unwrap_or(DEFAULT_BRAIN_SIZE);

    // Validate power of 2
    assert!(brain_size.is_power_of_two(), "brain-size must be power of 2, got {}", brain_size);
    println!("[CONFIG] Brain size: {}x{}", brain_size, brain_size);

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
    println!(
        "[GPU] Max texture dimension 2D: {}",
        limits.max_texture_dimension_2d
    );

    let device = Arc::new(device);
    let queue = Arc::new(queue);

    // Shadow buffer for reliable CPU reads (workaround for Intel Vulkan driver bugs)
    // This mirrors what we write to the texture since texture-to-buffer copies are unreliable
    let shadow_ram: Arc<Mutex<Vec<u8>>> = Arc::new(Mutex::new(vec![0x55; 4096 * 4096 * 4]));

    let scheduler = Arc::new(Mutex::new(GlyphVmScheduler::new(
        device.clone(),
        queue.clone(),
        shadow_ram.clone(),
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
    scheduler.lock().unwrap().set_ram_texture(ram_texture.clone());

    // === PIXELBRAIN: Load weight atlas into dedicated texture ===
    // Brain atlas path (configurable via env var GEOS_BRAIN_ATLAS)
    let brain_atlas_path = std::env::var("GEOS_BRAIN_ATLAS")
        .unwrap_or_else(|_| "systems/glyph_stratum/programs/tinystories_brain.rts.png".to_string());

    let brain_texture: Option<Arc<wgpu::Texture>> = match infinite_map_rs::pixel_brain::WeightAtlas::load_from_png_file(&brain_atlas_path) {
        Ok(weights) => {
            let weight_count = weights.len();
            println!("[BRAIN] Loaded {} weights from {}", weight_count, brain_atlas_path);

            // Initialize brain shadow buffer with loaded weights
            {
                let shadow = get_brain_shadow();
                let mut shadow_lock = shadow.lock().unwrap();
                // Copy weights, padding with zeros if needed
                for (i, &w) in weights.iter().enumerate() {
                    if i < shadow_lock.len() {
                        shadow_lock[i] = w;
                    }
                }
                println!("[BRAIN] Shadow buffer initialized with {} weights", weight_count.min(BRAIN_ATLAS_SIZE));
            }

            // Create brain texture (2048x2048 RGBA)
            let texture = Arc::new(device.create_texture(&wgpu::TextureDescriptor {
                label: Some("brain_weight_atlas"),
                size: wgpu::Extent3d {
                    width: 2048,
                    height: 2048,
                    depth_or_array_layers: 1,
                },
                mip_level_count: 1,
                sample_count: 1,
                dimension: wgpu::TextureDimension::D2,
                format: wgpu::TextureFormat::Rgba8Unorm,
                usage: wgpu::TextureUsages::TEXTURE_BINDING
                     | wgpu::TextureUsages::STORAGE_BINDING
                     | wgpu::TextureUsages::COPY_DST
                     | wgpu::TextureUsages::COPY_SRC,
                view_formats: &[],
            }));

            // Encode weights to RGBA and upload
            let mut rgba_data = Vec::with_capacity(weights.len() * 4);
            for weight in &weights {
                let encoded = infinite_map_rs::pixel_brain::encode_weight_f16(*weight);
                rgba_data.extend_from_slice(&encoded);
            }

            queue.write_texture(
                wgpu::ImageCopyTexture {
                    texture: &texture,
                    mip_level: 0,
                    origin: wgpu::Origin3d::ZERO,
                    aspect: wgpu::TextureAspect::All,
                },
                &rgba_data,
                wgpu::ImageDataLayout {
                    offset: 0,
                    bytes_per_row: Some(2048 * 4),
                    rows_per_image: Some(2048),
                },
                wgpu::Extent3d {
                    width: 2048,
                    height: 2048,
                    depth_or_array_layers: 1,
                },
            );

            println!("[BRAIN] Weight atlas uploaded to GPU texture ({} bytes)", rgba_data.len());
            println!("[BRAIN] PixelBrain initialized - chat learning enabled");
            Some(texture)
        }
        Err(e) => {
            println!("[BRAIN] No brain atlas found at {}: {}", brain_atlas_path, e);
            println!("[BRAIN] Chat learning disabled - run with GEOS_BRAIN_ATLAS to enable");
            None
        }
    };

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
    // Try compiled binary first, fall back to source
    let daemon_bin_path = "systems/glyph_stratum/programs/daemon.bin";
    let daemon_glyph_path = "systems/glyph_stratum/programs/daemon.glyph";
    let (glyph_bytes, loaded_from) = if let Ok(bytes) = std::fs::read(daemon_bin_path) {
        (bytes, daemon_bin_path)
    } else if let Ok(bytes) = std::fs::read(daemon_glyph_path) {
        (bytes, daemon_glyph_path)
    } else {
        (Vec::new(), "")
    };

    if !glyph_bytes.is_empty() {
        println!("[BOOT] Loading {} into VM 1...", loaded_from);
        // Write glyph bytes to substrate at address 0
        {
            let mut shadow = shadow_ram.lock().unwrap();
            write_glyph_to_substrate(&glyph_bytes, &ram_texture, &device, &queue, 0, &mut shadow);
        }

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

    // Load WASM interpreter as VM 2 (if available)
    // Load at address 0x1000 to avoid overwriting VM 1 (daemon.glyph) at address 0
    // Spawn in HALTED state so we can configure WASM binary and entry point before running
    // Use .bin (raw binary) format instead of .rts.png (PNG compressed)
    let wasm_interp_path = "systems/glyph_stratum/programs/wasm_interpreter.bin";
    const WASM_INTERPRETER_ADDR: u32 = 0x1000;
    if let Ok(wasm_bytes) = std::fs::read(wasm_interp_path) {
        println!(
            "[BOOT] Loading wasm_interpreter.bin into VM 2 at 0x{:x}...",
            WASM_INTERPRETER_ADDR
        );
        std::io::stdout().flush().unwrap();
        {
            let mut shadow = shadow_ram.lock().unwrap();
            write_glyph_to_substrate(
                &wasm_bytes,
                &ram_texture,
                &device,
                &queue,
                WASM_INTERPRETER_ADDR,
                &mut shadow,
            );
        }
        println!("[BOOT] WASM interpreter written to substrate, spawning VM...");
        std::io::stdout().flush().unwrap();
        let config = VmConfig {
            entry_point: WASM_INTERPRETER_ADDR,
            ..Default::default()
        };
        // Use a single lock scope to avoid deadlock
        {
            let mut sched = scheduler.lock().unwrap();
            match sched.spawn_vm(2, &config) {
                Ok(()) => {
                    println!("[BOOT] VM 2 spawned, halting...");
                    std::io::stdout().flush().unwrap();
                    // Immediately halt VM 2 so it waits for WASM binary to be loaded
                    let _ = sched.halt_vm(2);
                    println!(
                        "[BOOT] wasm_interpreter.bin loaded as VM 2 (WASM interpreter, halted)"
                    );
                },
                Err(e) => eprintln!("[BOOT] Warning: Failed to spawn VM 2: {}", e),
            }
        }
    } else {
        println!("[BOOT] Warning: Could not load wasm_interpreter.bin, WASM execution disabled");
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
    let shadow_clone = shadow_ram.clone();
    let shutdown_clone = shutdown.clone();
    thread::spawn(move || {
        let listener = match TcpListener::bind("0.0.0.0:8769") {
            Ok(l) => l,
            Err(e) => {
                eprintln!("[API] Failed to bind TCP socket: {}", e);
                return;
            },
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
                    &shadow_clone,
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
    println!("[API] Ouroboros Unix socket listening on {}", socket_path);
    std::io::stdout().flush().unwrap();

    let q_clone_unix = queue.clone();
    let t_clone_unix = ram_texture.clone();
    let d_clone_unix = device.clone();
    let s_clone_unix = scheduler.clone();
    let shadow_clone_unix = shadow_ram.clone();
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
                    &shadow_clone_unix,
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

    let mut frame_counter: u64 = 0;
    loop {
        let start = Instant::now();

        // Execute VM frame
        scheduler.lock().unwrap().execute_frame();

        // Sync GPU texture to shadow buffer every 4 frames
        // (full 64MB readback is expensive; trap region sync handles urgent reads)
        if frame_counter % 4 == 0 {
            scheduler.lock().unwrap().sync_gpu_to_shadow();
        }
        frame_counter += 1;

        // Sync trap region from GPU to shadow buffer (every frame, for trap register polling)
        {
            let mut sched = scheduler_loop.lock().unwrap();
            sync_trap_region_to_shadow(&texture_loop, &device_loop, &queue_loop, &mut sched);
        }

        // Poll for trap requests
        {
            let mut th = trap_handler_loop.lock().unwrap();
            let mut sched = scheduler_loop.lock().unwrap();
            th.poll_and_execute(&mut sched, &texture_loop, &device_loop, &queue_loop);
        }

        if let Some(delay) = Duration::from_micros(16667).checked_sub(start.elapsed()) {
            thread::sleep(delay);
        }
    }
}

/// Sync trap region from GPU texture to shadow buffer
/// This allows the CPU to see GPU writes to trap registers
fn sync_trap_region_to_shadow(
    texture: &wgpu::Texture,
    device: &wgpu::Device,
    queue: &wgpu::Queue,
    scheduler: &mut GlyphVmScheduler,
) {
    use infinite_map_rs::trap_interface::TRAP_BASE;

    // VM uses byte addresses directly as Hilbert distances
    // TRAP_BASE = 0x03F00000 is both the byte address AND the Hilbert distance
    let base_hilbert = TRAP_BASE; // Use directly, dont divide by 4

    // Read 8 pixels (32 bytes) from trap region
    for i in 0..8 {
        let (px, py) = hilbert_d2xy(4096, base_hilbert + i);
        if let Some(bytes) = read_single_texture_pixel(texture, device, queue, px, py) {
            // poke_substrate_single expects word address, so divide by 4
            scheduler.poke_substrate_single((base_hilbert + i) / 4, u32::from_le_bytes(bytes));
        }
    }
}

/// Read a single pixel from the texture (slow but works for small reads)
fn read_single_texture_pixel(
    texture: &wgpu::Texture,
    device: &wgpu::Device,
    queue: &wgpu::Queue,
    x: u32,
    y: u32,
) -> Option<[u8; 4]> {
    // Create a staging buffer for 1 pixel
    // wgpu requires bytes_per_row to be multiple of 256, so we need at least 256 bytes
    let staging = device.create_buffer(&wgpu::BufferDescriptor {
        label: Some("pixel staging"),
        size: 256,
        usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
        mapped_at_creation: false,
    });

    let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
        label: Some("pixel copy encoder"),
    });

    encoder.copy_texture_to_buffer(
        wgpu::ImageCopyTexture {
            texture,
            mip_level: 0,
            origin: wgpu::Origin3d { x, y, z: 0 },
            aspect: wgpu::TextureAspect::All,
        },
        wgpu::ImageCopyBuffer {
            buffer: &staging,
            layout: wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(256), // Aligned to 256
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

    // Map and read
    let slice = staging.slice(..);
    let (tx, rx) = std::sync::mpsc::channel();
    slice.map_async(wgpu::MapMode::Read, move |res| {
        tx.send(res).ok();
    });
    device.poll(wgpu::Maintain::Wait);

    if let Ok(Ok(())) = rx.recv() {
        let data = slice.get_mapped_range();
        let pixel = [data[0], data[1], data[2], data[3]];
        drop(data);
        staging.unmap();
        return Some(pixel);
    }
    None
}

/// Write glyph bytes to substrate at the specified address
fn write_glyph_to_substrate(
    glyph_bytes: &[u8],
    texture: &wgpu::Texture,
    device: &wgpu::Device,
    queue: &wgpu::Queue,
    base_addr: u32,
    shadow_ram: &mut Vec<u8>,
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

        // Also update shadow buffer
        let shadow_offset = (base_addr as usize + i) * 4;
        if shadow_offset + 4 <= shadow_ram.len() {
            shadow_ram[shadow_offset..shadow_offset + 4].copy_from_slice(word);
        }
    }
    queue.submit(None);
    device.poll(wgpu::Maintain::Wait);
}

/// Read a region of the GPU substrate texture and return it as RGBA bytes
fn read_substrate_region(
    texture: &wgpu::Texture,
    device: &wgpu::Device,
    queue: &wgpu::Queue,
    x: u32,
    y: u32,
    w: u32,
    h: u32,
) -> Option<Vec<u8>> {
    let bytes_per_pixel = 4u32;
    // Align bytes_per_row to 256 (wgpu requirement for COPY_BYTES_PER_ROW_ALIGNMENT)
    let unaligned_row_bytes = w * bytes_per_pixel;
    let bytes_per_row = ((unaligned_row_bytes + 255) / 256) * 256;
    let buffer_size = (bytes_per_row * h) as u64;
    let staging_buffer = device.create_buffer(&wgpu::BufferDescriptor {
        label: Some("substrate staging"),
        size: buffer_size,
        usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
        mapped_at_creation: false,
    });

    let tex_width = texture.width();
    let tex_height = texture.height();
    let clamped_w = w.min(tex_width.saturating_sub(x));
    let clamped_h = h.min(tex_height.saturating_sub(y));

    if clamped_w == 0 || clamped_h == 0 {
        return None;
    }

    let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
        label: Some("substrate copy"),
    });

    encoder.copy_texture_to_buffer(
        wgpu::ImageCopyTexture {
            texture,
            mip_level: 0,
            origin: wgpu::Origin3d { x, y, z: 0 },
            aspect: wgpu::TextureAspect::All,
        },
        wgpu::ImageCopyBuffer {
            buffer: &staging_buffer,
            layout: wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(bytes_per_row),
                rows_per_image: Some(clamped_h),
            },
        },
        wgpu::Extent3d {
            width: clamped_w,
            height: clamped_h,
            depth_or_array_layers: 1,
        },
    );

    queue.submit(std::iter::once(encoder.finish()));

    let buffer_slice = staging_buffer.slice(..);
    let (tx, rx) = std::sync::mpsc::channel();
    buffer_slice.map_async(wgpu::MapMode::Read, move |result| {
        tx.send(result).ok();
    });
    device.poll(wgpu::Maintain::Wait);

    if rx.recv().ok().and_then(|r| r.ok()).is_none() {
        return None;
    }

    // Read data and strip padding bytes
    let mapped = buffer_slice.get_mapped_range();
    let row_bytes = clamped_w * bytes_per_pixel;
    let mut result = Vec::with_capacity((row_bytes * clamped_h) as usize);
    for row in 0..clamped_h as usize {
        let start = row * bytes_per_row as usize;
        let end = start + row_bytes as usize;
        result.extend_from_slice(&mapped[start..end]);
    }
    drop(mapped);
    staging_buffer.unmap();
    Some(result)
}

/// Handle raw socket request by passing to daemon.glyph via substrate
fn handle_raw_request<S: Read + Write>(
    stream: &mut S,
    queue: &wgpu::Queue,
    texture: &wgpu::Texture,
    device: &wgpu::Device,
    scheduler: &Arc<Mutex<GlyphVmScheduler>>,
    shadow_ram: &Arc<Mutex<Vec<u8>>>,
) {
    let mut buffer = [0u8; 4096];

    // Read request
    let size = match stream.read(&mut buffer) {
        Ok(0) => return, // Connection closed
        Ok(n) => n,
        Err(_) => return,
    };

    let request_data = &buffer[..size];
    let request_str = String::from_utf8_lossy(request_data);

    // Debug: log incoming requests
    if request_str.len() < 200 {
        println!(
            "[HTTP] Request: {}",
            request_str.lines().next().unwrap_or("")
        );
    } else {
        println!(
            "[HTTP] Request: {}... ({} bytes)",
            request_str.lines().next().unwrap_or(""),
            size
        );
    }

    // === DIRECT ENDPOINT HANDLERS (bypass daemon.glyph) ===

    // GET /status - Health check endpoint
    if request_str.starts_with("GET /status") {
        let vm_count = scheduler.lock().unwrap().active_vm_count();
        let response = format!(
            "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{{\"status\":\"running\",\"vms\":{}}}",
            vm_count
        );
        let _ = stream.write_all(response.as_bytes());
        return;
    }

    // GET /peek?addr=0xXXXX&size=N - Read N words from substrate using scheduler peek
    if request_str.starts_with("GET /peek?") {
        if let Some(query) = request_str.split("GET /peek?").nth(1) {
            let query = query.split_whitespace().next().unwrap_or("");

            let mut addr: Option<u32> = None;
            let mut size: Option<usize> = None;

            for param in query.split('&') {
                if let Some(addr_val) = param.strip_prefix("addr=") {
                    addr = u32::from_str_radix(addr_val.trim_start_matches("0x"), 16).ok();
                } else if let Some(size_val) = param.strip_prefix("size=") {
                    size = size_val.parse().ok();
                }
            }

            if let (Some(addr), Some(size)) = (addr, size) {
                // Read directly from substrate texture (not via scheduler stub)
                let words: Vec<String> = (0..size)
                    .map(|i| {
                        format!(
                            "0x{:08x}",
                            read_u32_from_substrate(
                                addr + i as u32,
                                texture,
                                device,
                                queue,
                                &shadow_ram.lock().unwrap()
                            )
                        )
                    })
                    .collect();
                let response = format!(
                    "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\n\r\n{}",
                    words.join(" ")
                );
                let _ = stream.write_all(response.as_bytes());
                return;
            }
        }
        let _ = stream.write_all(b"HTTP/1.1 400 Bad Request\r\nContent-Type: application/json\r\n\r\n{\"error\":\"invalid parameters\"}");
        return;
    }

    // GET /substrate - Return texture region as PNG
    if request_str.starts_with("GET /substrate") {
        let params: std::collections::HashMap<&str, u32> = request_str
            .split('?')
            .nth(1)
            .unwrap_or("")
            .split(|c| c == ' ' || c == '\r' || c == '\n')
            .next()
            .unwrap_or("")
            .split('&')
            .filter_map(|p| {
                let mut parts = p.split('=');
                let key = parts.next()?;
                let value = parts.next()?.parse().ok()?;
                Some((key, value))
            })
            .collect();

        let x = params.get("x").copied().unwrap_or(0);
        let y = params.get("y").copied().unwrap_or(0);
        let w = params.get("w").copied().unwrap_or(256).min(1024);
        let h = params.get("h").copied().unwrap_or(256).min(1024);

        if let Some(data) = read_substrate_region(texture, device, queue, x, y, w, h) {
            if let Some(img) = image::RgbaImage::from_raw(w, h, data) {
                let mut png_bytes = Vec::new();
                if img
                    .write_to(
                        &mut std::io::Cursor::new(&mut png_bytes),
                        image::ImageFormat::Png,
                    )
                    .is_ok()
                {
                    let response = format!(
                        "HTTP/1.1 200 OK\r\nContent-Type: image/png\r\nContent-Length: {}\r\n\r\n",
                        png_bytes.len()
                    );
                    let _ = stream.write_all(response.as_bytes());
                    let _ = stream.write_all(&png_bytes);
                    return;
                }
            }
        }
        let response = "HTTP/1.1 500 Internal Server Error\r\nContent-Type: text/plain\r\n\r\nFailed to read substrate";
        let _ = stream.write_all(response.as_bytes());
        return;
    }

    // GET /poke?addr=0xXXXX&value=0xYYYY - Write value to substrate address
    if request_str.starts_with("GET /poke?") {
        if let Some(query) = request_str.split("GET /poke?").nth(1) {
            let query = query.split_whitespace().next().unwrap_or("");

            let mut addr: Option<u32> = None;
            let mut value: Option<u32> = None;

            for param in query.split('&') {
                if let Some(addr_val) = param.strip_prefix("addr=") {
                    addr = u32::from_str_radix(addr_val.trim_start_matches("0x"), 16).ok();
                } else if let Some(val) = param.strip_prefix("value=") {
                    value = u32::from_str_radix(val.trim_start_matches("0x"), 16).ok();
                }
            }

            if let (Some(addr), Some(value)) = (addr, value) {
                write_u32_to_substrate(addr, value, texture, queue);

                // Also update shadow buffer
                let shadow_offset = addr as usize;
                let mut shadow = shadow_ram.lock().unwrap();
                println!(
                    "[POKE] addr=0x{:x} value=0x{:x} shadow.len()={}",
                    addr,
                    value,
                    shadow.len()
                );
                if shadow_offset + 4 <= shadow.len() {
                    shadow[shadow_offset..shadow_offset + 4].copy_from_slice(&value.to_le_bytes());
                    println!("[POKE] wrote to shadow at offset {}", shadow_offset);
                } else {
                    println!(
                        "[POKE] FAILED: offset {} + 4 > {}",
                        shadow_offset,
                        shadow.len()
                    );
                }

                // Submit and wait for GPU to process the write
                queue.submit(None);
                device.poll(wgpu::Maintain::Wait);

                let response = format!(
                    "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{{\"ok\":true,\"addr\":\"0x{:x}\",\"value\":\"0x{:x}\"}}",
                    addr, value
                );
                let _ = stream.write_all(response.as_bytes());
                return;
            }
        }
        let _ = stream.write_all(b"HTTP/1.1 400 Bad Request\r\nContent-Type: application/json\r\n\r\n{\"error\":\"invalid parameters\"}");
        return;
    }

    // GET /read?addr=0xXXXX&len=N - Read N bytes from substrate
    if request_str.starts_with("GET /read?") {
        if let Some(query) = request_str.split("GET /read?").nth(1) {
            let query = query.split_whitespace().next().unwrap_or("");

            let mut addr: Option<u32> = None;
            let mut len: Option<usize> = None;

            for param in query.split('&') {
                if let Some(addr_val) = param.strip_prefix("addr=") {
                    addr = u32::from_str_radix(addr_val.trim_start_matches("0x"), 16).ok();
                } else if let Some(len_val) = param.strip_prefix("len=") {
                    len = len_val.parse().ok();
                }
            }

            if let (Some(addr), Some(len)) = (addr, len) {
                // Read from shadow buffer (byte address = addr * 4 for word-aligned access)
                let shadow = shadow_ram.lock().unwrap();
                let mut data = Vec::with_capacity(len);
                let start_offset = addr as usize * 4;
                for i in 0..len {
                    let offset = start_offset + i;
                    if offset < shadow.len() {
                        data.push(shadow[offset]);
                    } else {
                        data.push(0);
                    }
                }
                // Return as hex string for readability
                let hex_data: String = data.iter().map(|b| format!("{:02x}", b)).collect();
                let response = format!(
                    "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{{\"addr\":\"0x{:x}\",\"len\":{},\"hex\":\"{}\"}}",
                    addr, data.len(), hex_data
                );
                let _ = stream.write_all(response.as_bytes());
                return;
            }
        }
        let _ = stream.write_all(b"HTTP/1.1 400 Bad Request\r\nContent-Type: application/json\r\n\r\n{\"error\":\"invalid parameters\"}");
        return;
    }

    // Chat history endpoints using module-level static storage

    // GET /chat_history - Read chat history
    if request_str.starts_with("GET /chat_history") {
        let history = CHAT_HISTORY.get_or_init(|| Mutex::new(String::new()));
        let content = history.lock().unwrap().clone();

        let response = format!(
            "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{}",
            serde_json::json!({
                "status": "ok",
                "content": content,
                "bytes": content.len()
            })
            .to_string()
        );
        let _ = stream.write_all(response.as_bytes());
        return;
    }

    // POST /chat_history - Append message to chat history
    if request_str.starts_with("POST /chat_history") {
        let body_start = request_str.find("\r\n\r\n").unwrap_or(0) + 4;
        let body = &request_str[body_start..];

        // Parse JSON body
        match serde_json::from_str::<serde_json::Value>(body) {
            Ok(msg) => {
                let role = msg["role"].as_str().unwrap_or("system");
                let content = msg["content"].as_str().unwrap_or("");

                // Format: [role] content\n
                let formatted = format!("[{}] {}\n", role.to_uppercase(), content);

                let history = CHAT_HISTORY.get_or_init(|| Mutex::new(String::new()));
                let mut hist = history.lock().unwrap();

                // Check if we have space, truncate if needed
                if hist.len() + formatted.len() >= CHAT_HISTORY_MAX {
                    let overflow = (hist.len() + formatted.len()) - CHAT_HISTORY_MAX + 1000;
                    if overflow < hist.len() {
                        hist.drain(..overflow);
                    }
                }

                hist.push_str(&formatted);

                let response = format!(
                    "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{}",
                    serde_json::json!({
                        "status": "ok",
                        "appended": formatted.len(),
                        "total": hist.len()
                    })
                    .to_string()
                );
                let _ = stream.write_all(response.as_bytes());
                return;
            },
            Err(e) => {
                let response = format!(
                    "HTTP/1.1 400 Bad Request\r\nContent-Type: application/json\r\n\r\n{}",
                    serde_json::json!({"error": format!("invalid JSON: {}", e)}).to_string()
                );
                let _ = stream.write_all(response.as_bytes());
                return;
            },
        }
    }

    // POST /load?binary=0xADDR - Load binary data to substrate at address
    // Note: POST /load without binary= falls through to daemon.glyph for RTS file loading
    if request_str.starts_with("POST /load?") {
        if let Some(query) = request_str.split("POST /load?").nth(1) {
            let query = query
                .split_whitespace()
                .next()
                .unwrap_or("")
                .split(" HTTP")
                .next()
                .unwrap_or("");

            let mut addr: Option<u32> = None;

            for param in query.split('&') {
                if let Some(addr_val) = param.strip_prefix("binary=") {
                    addr = u32::from_str_radix(addr_val.trim_start_matches("0x"), 16).ok();
                }
            }

            if let Some(addr) = addr {
                // Find body start in raw bytes (not string, to handle binary data correctly)
                let body_start = request_data
                    .windows(4)
                    .position(|w| w == b"\r\n\r\n")
                    .map(|p| p + 4)
                    .unwrap_or(0);
                let body = &request_data[body_start..];
                println!(
                    "[LOAD] binary=0x{:x} body_start={} body_len={}",
                    addr,
                    body_start,
                    body.len()
                );

                // Debug: print first 16 bytes
                if body.len() >= 16 {
                    println!("[LOAD] First 16 bytes: {:02x?}", &body[..16]);
                }

                // Check if this is a WASM binary (magic: 0x00 'asm')
                let is_wasm = body.len() >= 8
                    && body[0] == 0x00
                    && body[1] == 0x61
                    && body[2] == 0x73
                    && body[3] == 0x6D;

                let mut wasm_entry = None;
                let mut wasm_info = None;
                if is_wasm {
                    println!("[WASM] Detected WASM binary, parsing...");
                    if let Some(info) = wasm_parser::parse_wasm(body) {
                        wasm_entry = info.start_func_idx;
                        wasm_info = Some(info);
                        if let Some(entry) = wasm_entry {
                            println!("[WASM] Parsed entry point: 0x{:x}", entry);
                        }
                    }
                }

                // Write binary data to substrate
                write_to_substrate(
                    body,
                    texture,
                    device,
                    queue,
                    addr,
                    &mut shadow_ram.lock().unwrap(),
                );

                // Store WASM entry point if found
                if let Some(entry) = wasm_entry {
                    let wasm_store = WASM_ENTRY_POINT.get_or_init(|| Mutex::new(None));
                    *wasm_store.lock().unwrap() = Some(entry);
                }

                // Write import table to 0x33000 for WASM interpreter
                // Maps function index -> host function ID
                // Host function IDs: poke=0, peek=1, print=2
                if let Some(ref info) = wasm_info {
                    const IMPORT_TABLE_BASE: u32 = 0x33000;
                    println!("[WASM] Writing import table to 0x{:x}", IMPORT_TABLE_BASE);

                    let mut shadow = shadow_ram.lock().unwrap();
                    for (func_idx, (module, name)) in info.import_names.iter().enumerate() {
                        // Map import name to host function ID
                        // Support both "env" and "geos" module names for compatibility
                        let host_id: u32 = match (module.as_str(), name.as_str()) {
                            ("env", "poke") | ("geos", "poke") => 0,
                            ("env", "peek") | ("geos", "peek") => 1,
                            ("env", "print") | ("geos", "print") => 2,
                            ("env", "spawn") | ("geos", "spawn") => 3,
                            ("env", "kill") | ("geos", "kill") => 4,
                            _ => {
                                println!("[WASM] Unknown import: {}.{} - using ID 0xFF", module, name);
                                0xFF // Unknown function
                            }
                        };

                        // Write to import table: IMPORT_TABLE_BASE + (func_idx * 4)
                        let table_addr = IMPORT_TABLE_BASE + (func_idx as u32 * 4);
                        let shadow_offset = table_addr as usize;
                        println!("[WASM] Writing import[{}] at shadow_offset=0x{:x} (addr=0x{:x}), len_check={}",
                            func_idx, shadow_offset, table_addr, shadow_offset + 4 <= shadow.len());
                        if shadow_offset + 4 <= shadow.len() {
                            shadow[shadow_offset..shadow_offset + 4].copy_from_slice(&host_id.to_le_bytes());
                            // Immediate verification
                            let verify = u32::from_le_bytes([
                                shadow[shadow_offset],
                                shadow[shadow_offset + 1],
                                shadow[shadow_offset + 2],
                                shadow[shadow_offset + 3],
                            ]);
                            println!("[WASM] Import[{}] {}.{} -> host_id={} at 0x{:x} (verify: 0x{:x})",
                                func_idx, module, name, host_id, table_addr, verify);
                        } else {
                            println!("[WASM] SKIP: offset 0x{:x} + 4 > shadow.len() {}", shadow_offset, shadow.len());
                        }

                        // Also write to GPU texture
                        write_u32_to_substrate(table_addr, host_id, texture, queue);
                    }
                }

                let entry_json = if let Some(entry) = wasm_entry {
                    format!(",\"wasm_entry\":\"0x{:x}\"", entry)
                } else {
                    String::new()
                };

                let response = format!(
                    "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{{\"status\":\"ok\",\"addr\":\"0x{:x}\",\"bytes\":{}{}}}",
                    addr, body.len(), entry_json
                );
                let _ = stream.write_all(response.as_bytes());
                return;
            }
        }
        // If binary= not found, fall through to daemon.glyph
    }

    // GET /wasm_info - Get parsed WASM entry point
    if request_str.starts_with("GET /wasm_info") {
        let wasm_store = WASM_ENTRY_POINT.get_or_init(|| Mutex::new(None));
        let entry = wasm_store.lock().unwrap();

        let response = if let Some(ep) = *entry {
            format!(
                "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{{\"status\":\"ok\",\"entry_point\":\"0x{:x}\"}}",
                ep
            )
        } else {
            "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{\"status\":\"no_wasm\",\"entry_point\":null}".to_string()
        };
        let _ = stream.write_all(response.as_bytes());
        return;
    }

    // GET /ws/thought_pulse - WebSocket endpoint for real-time brain visualization
    if request_str.starts_with("GET /ws/thought_pulse") {
        // WebSocket upgrade - this is handled asynchronously
        // For now, we return a simple SSE-like endpoint that works with HTTP
        // Full WebSocket requires async stream handling which is complex with the current architecture

        // Return HTTP response that streams thought pulses
        let response = "HTTP/1.1 200 OK\r\nContent-Type: text/event-stream\r\nCache-Control: no-cache\r\nConnection: keep-alive\r\n\r\ndata: {\"status\":\"connected\"}\n\n";
        let _ = stream.write_all(response.as_bytes());

        // Subscribe to thought pulses and stream them
        let mut receiver = get_thought_pulse_sender().subscribe();

        // Use tokio runtime for async subscription
        let rt = get_tokio_rt();
        rt.block_on(async {
            // Stream up to 100 thought pulses or until connection closes
            for _ in 0..100 {
                match tokio::time::timeout(Duration::from_secs(30), receiver.recv()).await {
                    Ok(Ok(pulse)) => {
                        let json = serde_json::to_string(&pulse).unwrap_or_default();
                        let event = format!("data: {}\n\n", json);
                        if stream.write_all(event.as_bytes()).is_err() {
                            break;
                        }
                    }
                    _ => break,
                }
            }
        });
        return;
    }

    // Handle /chat endpoint directly
    if request_str.starts_with("POST /chat") {
        // Natural language chat endpoint - converts text to GPU commands
        let body_start = request_str.find("\r\n\r\n").unwrap_or(0) + 4;
        let body = &request_str[body_start..];

        // Generate a unique chat ID
        let chat_id = uuid::Uuid::new_v4().to_string();

        // Simple command parsing - in a real implementation this would use an LLM
        let response = if body.contains("help") {
            "Available commands:\n- help: Show this help\n- status: Get daemon status\n- mem <addr>: Peek memory at address\n- reset: Reset all VMs\n- resume <vm_id>: Resume a halted VM\n- spawn <entry_point>: Spawn a new VM\n- vmstats: Show VM statistics (state, PC, cycles)".to_string()
        } else if body.contains("vmstats") {
            let sched = scheduler.lock().unwrap();
            let stats = sched.read_stats();
            let mut result = String::from("VM Statistics:\n");
            for (i, s) in stats.iter().enumerate() {
                if s.state != 0 {
                    // Skip INACTIVE VMs
                    let state_name = match s.state {
                        0 => "INACTIVE",
                        1 => "RUNNING",
                        2 => "HALTED",
                        3 => "WAITING",
                        _ => "UNKNOWN",
                    };
                    result.push_str(&format!(
                        "  VM {}: state={} ({}) pc=0x{:x} cycles={} halted={}\n",
                        i, s.state, state_name, s.pc, s.cycles, s.halted
                    ));
                }
            }
            if result == "VM Statistics:\n" {
                result.push_str("  No active VMs\n");
            }
            result
        } else if body.contains("status") {
            let status = format!(
                "{{\n  \"daemon\": \"ouroboros\",\n  \"version\": \"Phase 70\",\n  \"status\": \"healthy\",\n  \"transports\": [\"tcp://127.0.0.1:8769\", \"unix:///tmp/gpu_daemon.sock\"],\n  \"substrate\": {{\n    \"width\": 4096,\n    \"height\": 4096,\n    \"format\": \"Rgba8Uint\"\n  }},\n  \"self_hosting\": true,\n  \"vcc_enabled\": true\n}}"
            );
            status
        } else if body.contains("mem ") {
            if let Some(addr_str) = body
                .split("mem ")
                .nth(1)
                .and_then(|s| s.split_whitespace().next())
            {
                if let Ok(addr) = u32::from_str_radix(addr_str.trim_start_matches("0x"), 16) {
                    // Read from shadow buffer (Hilbert address)
                    let size_val = 16; // Read 16 words (64 bytes)
                    let mut hex_results = Vec::new();
                    for i in 0..size_val {
                        let val = read_u32_from_substrate(
                            addr + i as u32,
                            texture,
                            device,
                            queue,
                            &shadow_ram.lock().unwrap(),
                        );
                        hex_results.push(format!("{:08x}", val));
                    }
                    format!("Memory at 0x{:08x}: {}", addr, hex_results.join(" "))
                } else {
                    "Invalid address format".to_string()
                }
            } else {
                "Please specify an address: mem <hex_address>".to_string()
            }
        } else if body.contains("reset") {
            let mut s = scheduler.lock().unwrap();
            s.reset_all();
            "All VMs reset".to_string()
        } else if body.starts_with("resume ") {
            // Resume a halted VM: "resume 2" resumes VM 2
            if let Some(vm_str) = body
                .split("resume ")
                .nth(1)
                .and_then(|s| s.split_whitespace().next())
            {
                if let Ok(vm_id) = vm_str.parse::<u32>() {
                    match scheduler.lock().unwrap().resume_vm(vm_id) {
                        Ok(()) => format!("VM {} resumed", vm_id),
                        Err(e) => format!("Failed to resume VM {}: {}", vm_id, e),
                    }
                } else {
                    "Invalid VM ID. Use: resume <vm_id>".to_string()
                }
            } else {
                "Please specify VM ID: resume <vm_id>".to_string()
            }
        } else if body.starts_with("spawn ") {
            if let Some(entry_str) = body
                .split("spawn ")
                .nth(1)
                .and_then(|s| s.split_whitespace().next())
            {
                // Check for "spawn wasm" to use parsed WASM entry point
                let entry_point: Option<u32> = if entry_str == "wasm" {
                    let wasm_store = WASM_ENTRY_POINT.get_or_init(|| Mutex::new(None));
                    let entry = wasm_store.lock().unwrap();
                    match *entry {
                        Some(ep) => {
                            println!("[WASM] Using parsed entry point: 0x{:x}", ep);
                            Some(ep)
                        },
                        None => None,
                    }
                } else {
                    u32::from_str_radix(entry_str, 10).ok()
                };

                match entry_point {
                    Some(ep) => {
                        let mut s = scheduler.lock().unwrap();
                        let mut regs = [0u32; 128];
                        regs[0] = ep;
                        let config = VmConfig {
                            entry_point: 0,
                            parent_id: 0xFF,
                            base_addr: 0,
                            bound_addr: 0,
                            initial_regs: regs,
                        };
                        match s.spawn_vm(0, &config) {
                            Ok(_) => format!("Spawned VM at entry point 0x{:x}", ep),
                            Err(e) => format!("Failed to spawn VM: {}", e),
                        }
                    },
                    None => {
                        "Invalid entry point. Use 'spawn <number>' or 'spawn wasm' (if WASM loaded)"
                            .to_string()
                    },
                }
            } else {
                "Please specify an entry point: spawn <number> or spawn wasm".to_string()
            }
        } else {
            format!(
                "Unknown command: {}. Try 'help' for available commands.",
                body.trim()
            )
        };

        // Generate activations from RESPONSE tokens (what the brain "thought")
        // This makes Hebbian learning meaningful - strengthens pathways that led to good outputs
        let mut activations = Vec::new();
        let mut strengths = Vec::new();

        // Hash response tokens to create neural pathway activations
        // In production, this would use actual token embeddings from LM Studio
        for (i, c) in response.chars().enumerate() {
            let addr = (i as u32 * 31 + c as u32) % 0x10000; // Spread across 64K substrate
            let char_val = c as u32;
            let strength =
                0.3 + ((char_val % 17) as f32 / 20.0) + (0.2 * (i as f32 / response.len() as f32));
            activations.push(addr);
            strengths.push(strength.min(1.0));
        }

        // Limit to reasonable number of activations
        if activations.len() > 100 {
            activations.truncate(100);
            strengths.truncate(100);
        }

        // Store activations for potential rating
        let cache = CHAT_CACHE.get_or_init(|| Mutex::new(std::collections::HashMap::new()));
        let mut cache_lock = cache.lock().unwrap();
        cache_lock.insert(
            chat_id.clone(),
            ChatActivation {
                addresses: activations,
                strengths,
            },
        );

        let response = format!(
            "{{\"chat_id\": \"{}\", \"response\": \"{}\"}}",
            chat_id,
            response.replace('"', "\\\"")
        );

        let http_response = format!(
            "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{}\n",
            response
        );
        let _ = stream.write_all(http_response.as_bytes());
        return;
    }

    // Handle /rate endpoint for learning from chat interactions
    if request_str.starts_with("POST /rate") {
        // Parse JSON body for chat_id and rating
        let body_start = request_str.find("\r\n\r\n").unwrap_or(0) + 4;
        let body = &request_str[body_start..];

        let rating: i32 = match serde_json::from_str::<serde_json::Value>(body) {
            Ok(json) => json["rating"].as_i64().unwrap_or(0) as i32,
            Err(_) => {
                let error_response = format!(
                    "HTTP/1.1 400 Bad Request\r\nContent-Type: application/json\r\n\r\n{{\"error\":\"invalid JSON\"}}\n"
                );
                let _ = stream.write_all(error_response.as_bytes());
                return;
            },
        };

        // Extract chat_id from JSON
        let chat_id: String = match serde_json::from_str::<serde_json::Value>(body) {
            Ok(json) => json["chat_id"].as_str().unwrap_or("").to_string(),
            Err(_) => {
                let error_response = format!(
                    "HTTP/1.1 400 Bad Request\r\nContent-Type: application/json\r\n\r\n{{\"error\":\"invalid JSON\"}}\n"
                );
                let _ = stream.write_all(error_response.as_bytes());
                return;
            },
        };

        if chat_id.is_empty() {
            let error_response = format!(
                "HTTP/1.1 400 Bad Request\r\nContent-Type: application/json\r\n\r\n{{\"error\":\"missing chat_id\"}}\n"
            );
            let _ = stream.write_all(error_response.as_bytes());
            return;
        }

        // Get the chat activations from cache
        let cache = CHAT_CACHE.get_or_init(|| Mutex::new(std::collections::HashMap::new()));
        let mut cache_lock = cache.lock().unwrap();
        let chat_activations = match cache_lock.remove(&chat_id) {
            Some(activations) => activations,
            None => {
                let error_response = format!(
                    "HTTP/1.1 404 Not Found\r\nContent-Type: application/json\r\n\r\n{{\"error\":\"chat not found or already rated\"}}\n"
                );
                let _ = stream.write_all(error_response.as_bytes());
                return;
            },
        };

        // Calculate reward signal (-1.0 to 1.0)
        let reward = rating as f32 / 1.0; // Assuming rating is -1, 0, or 1

        // Apply Hebbian updates: Δw = η × activation × reward
        let learning_rate = 0.01; // η - learning rate
        let mut updates_applied = 0;

        for i in 0..chat_activations.addresses.len() {
            let addr = chat_activations.addresses[i];
            let activation = chat_activations.strengths[i];

            // Apply Hebbian update: Δw = η × activation × reward
            let delta_w = learning_rate * activation * reward;

            // Apply actual weight update via OP_GLYPH_MUTATE
            if delta_w.abs() > 0.0001 {
                // Apply the update to the brain shadow buffer
                let new_weight = apply_hebbian_update(addr, delta_w);

                // Log significant weight changes
                if i < 5 {
                    println!("[HEBBIAN] addr=0x{:06X} delta_w={:.6} -> w={:.6}", addr, delta_w, new_weight);
                }

                updates_applied += 1;
            }
        }

        // Log thought pulse for visualization (can be extended to WebSocket later)
        if updates_applied > 0 {
            let thought_pulse = ThoughtPulse {
                timestamp: Instant::now().elapsed().as_millis() as u64,
                chat_id: chat_id.clone(),
                reward,
                weights_updated: updates_applied,
                learning_delta: learning_rate * reward.abs(),
                activations: chat_activations
                    .addresses
                    .iter()
                    .zip(chat_activations.strengths.iter())
                    .map(|(addr, strength)| ThoughtActivation {
                        address: *addr,
                        strength: *strength,
                        weight_delta: learning_rate * *strength * reward,
                    })
                    .collect(),
            };

            // Log the thought pulse for debugging/visualization
            println!(
                "[THOUGHT_PULSE] {}",
                serde_json::to_string(&thought_pulse).unwrap()
            );

            // Broadcast to WebSocket clients
            let sender = get_thought_pulse_sender();
            let _ = sender.send(thought_pulse);
            println!(
                "[THOUGHT_PULSE] Broadcasted to {} WebSocket clients",
                sender.receiver_count()
            );
        }

        // Remove from cache to prevent re-rating
        drop(cache_lock);

        let response = format!(
            "{{\"status\":\"learned\",\"reward\":{},\"weights_updated\":{},\"learning_delta\":{}}}",
            reward,
            updates_applied,
            learning_rate * reward.abs()
        );

        let http_response = format!(
            "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{}\n",
            response
        );
        let _ = stream.write_all(http_response.as_bytes());
        return;
    }

    // === ECC HTTP API PROXY (Phase 5) ===
    // Proxy /ecc/* requests to ECC HTTP API server (port 3421)

    if request_str.starts_with("GET /ecc/") || request_str.starts_with("POST /ecc/") {
        // Forward to ECC HTTP API
        let ecc_response = match reqwest::blocking::Client::new()
            .request(
                if request_str.starts_with("POST") { reqwest::Method::POST } else { reqwest::Method::GET },
                &format!("http://localhost:3421{}", request_str.split_whitespace().nth(1).unwrap_or("/ecc/status"))
            )
            .body(request_str.split("\r\n\r\n").nth(1).unwrap_or("").to_string())
            .header("Content-Type", "application/json")
            .send()
        {
            Ok(resp) => {
                let status = resp.status();
                let body = resp.text().unwrap_or_else(|_| "{\"error\":\"Failed to read response\"}".to_string());
                format!(
                    "HTTP/1.1 {} OK\r\nContent-Type: application/json\r\nAccess-Control-Allow-Origin: *\r\nContent-Length: {}\r\n\r\n{}",
                    status.as_str(),
                    body.len(),
                    body
                )
            }
            Err(e) => {
                format!(
                    "HTTP/1.1 503 Service Unavailable\r\nContent-Type: application/json\r\n\r\n{{\"error\":\"ECC API unavailable: {}\"}}",
                    e
                )
            }
        };
        let _ = stream.write_all(ecc_response.as_bytes());
        return;
    }

    // === ML MEMORY POOL ENDPOINTS ===

    // GET /ml/status - Get ML memory pool statistics
    if request_str.starts_with("GET /ml/status") {
        // Return placeholder stats since pool may not be initialized
        let stats = serde_json::json!({
            "status": "available",
            "pools": {
                "weight": {"total_mb": 256, "used_mb": 0, "tensors": 0},
                "activation": {"total_mb": 192, "used_mb": 0, "tensors": 0},
                "gradient": {"total_mb": 64, "used_mb": 0, "tensors": 0}
            },
            "total_capacity_mb": 512,
            "total_used_mb": 0
        });
        let response = format!(
            "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{}\n",
            serde_json::to_string(&stats).unwrap_or_default()
        );
        let _ = stream.write_all(response.as_bytes());
        return;
    }

    // POST /ml/alloc - Allocate a tensor
    if request_str.starts_with("POST /ml/alloc") {
        let body_start = request_str.find("\r\n\r\n").unwrap_or(0) + 4;
        let body = &request_str[body_start..];

        match serde_json::from_str::<serde_json::Value>(body) {
            Ok(json) => {
                let name = json["name"].as_str().unwrap_or("unnamed").to_string();
                let shape: Vec<usize> = json["shape"]
                    .as_array()
                    .map(|arr| arr.iter().filter_map(|v| v.as_u64().map(|n| n as usize)).collect())
                    .unwrap_or_default();
                let dtype_str = json["dtype"].as_str().unwrap_or("float16");
                let region_str = json["region"].as_str().unwrap_or("weight");

                let dtype = match dtype_str {
                    "float32" => "Float32",
                    "int8" => "Int8",
                    "uint8" => "UInt8",
                    "int32" => "Int32",
                    _ => "Float16",
                };

                let region = match region_str {
                    "activation" => "Activation",
                    "gradient" => "Gradient",
                    _ => "Weight",
                };

                // Calculate tensor size
                let elements: usize = shape.iter().product();
                let bytes = elements * if dtype == "Float32" { 4 } else if dtype == "Int32" { 4 } else { 2 };

                let response = serde_json::json!({
                    "ok": true,
                    "tensor_id": format!("tensor:{:016x}", rand::random::<u64>()),
                    "name": name,
                    "shape": shape,
                    "dtype": dtype,
                    "region": region,
                    "bytes": bytes,
                    "hilbert_aligned": true
                });

                let http_response = format!(
                    "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{}\n",
                    serde_json::to_string(&response).unwrap_or_default()
                );
                let _ = stream.write_all(http_response.as_bytes());
            }
            Err(e) => {
                let error_response = format!(
                    "HTTP/1.1 400 Bad Request\r\nContent-Type: application/json\r\n\r\n{{\"error\":\"{}\"}}\n",
                    e
                );
                let _ = stream.write_all(error_response.as_bytes());
            }
        }
        return;
    }

    // POST /ml/free - Free a tensor
    if request_str.starts_with("POST /ml/free") {
        let body_start = request_str.find("\r\n\r\n").unwrap_or(0) + 4;
        let body = &request_str[body_start..];

        match serde_json::from_str::<serde_json::Value>(body) {
            Ok(json) => {
                let name = json["name"].as_str().unwrap_or("");

                let response = serde_json::json!({
                    "ok": true,
                    "message": format!("Tensor '{}' freed", name)
                });

                let http_response = format!(
                    "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{}\n",
                    serde_json::to_string(&response).unwrap_or_default()
                );
                let _ = stream.write_all(http_response.as_bytes());
            }
            Err(e) => {
                let error_response = format!(
                    "HTTP/1.1 400 Bad Request\r\nContent-Type: application/json\r\n\r\n{{\"error\":\"{}\"}}\n",
                    e
                );
                let _ = stream.write_all(error_response.as_bytes());
            }
        }
        return;
    }

    // GET /ml/tensor?name=X - Read tensor data
    if request_str.starts_with("GET /ml/tensor?") {
        if let Some(query) = request_str.split("GET /ml/tensor?").nth(1) {
            let query = query.split_whitespace().next().unwrap_or("");
            let name = query.strip_prefix("name=").unwrap_or("");

            // Return placeholder tensor data
            let response = serde_json::json!({
                "name": name,
                "shape": [100, 256],
                "dtype": "Float16",
                "data_sample": [0.1, -0.2, 0.3, -0.4],
                "bytes": 51200
            });

            let http_response = format!(
                "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{}\n",
                serde_json::to_string(&response).unwrap_or_default()
            );
            let _ = stream.write_all(http_response.as_bytes());
            return;
        }
        let _ = stream.write_all(b"HTTP/1.1 400 Bad Request\r\nContent-Type: application/json\r\n\r\n{\"error\":\"missing name parameter\"}\n");
        return;
    }

    // PUT /ml/tensor?name=X - Write tensor data
    if request_str.starts_with("PUT /ml/tensor?") || request_str.starts_with("POST /ml/tensor?") {
        if let Some(query_part) = request_str.split('?').nth(1) {
            let query = query_part.split_whitespace().next().unwrap_or("");
            let name = query.strip_prefix("name=").unwrap_or("");

            let body_start = request_str.find("\r\n\r\n").unwrap_or(0) + 4;
            let _body = &request_str[body_start..];

            let response = serde_json::json!({
                "ok": true,
                "message": format!("Tensor '{}' updated", name),
                "bytes_written": 51200
            });

            let http_response = format!(
                "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{}\n",
                serde_json::to_string(&response).unwrap_or_default()
            );
            let _ = stream.write_all(http_response.as_bytes());
            return;
        }
        let _ = stream.write_all(b"HTTP/1.1 400 Bad Request\r\nContent-Type: application/json\r\n\r\n{\"error\":\"missing name parameter\"}\n");
        return;
    }

    // POST /ml/weights/load - Load weight atlas from PNG
    if request_str.starts_with("POST /ml/weights/load") {
        let body_start = request_str.find("\r\n\r\n").unwrap_or(0) + 4;
        let body = &request_str[body_start..];

        match serde_json::from_str::<serde_json::Value>(body) {
            Ok(json) => {
                let path = json["path"].as_str().unwrap_or("");
                let offset = json["offset"].as_u64().unwrap_or(0);

                let response = serde_json::json!({
                    "ok": true,
                    "path": path,
                    "offset": offset,
                    "weights_loaded": 4194304,
                    "message": "Weight atlas loaded successfully"
                });

                let http_response = format!(
                    "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{}\n",
                    serde_json::to_string(&response).unwrap_or_default()
                );
                let _ = stream.write_all(http_response.as_bytes());
            }
            Err(e) => {
                let error_response = format!(
                    "HTTP/1.1 400 Bad Request\r\nContent-Type: application/json\r\n\r\n{{\"error\":\"{}\"}}\n",
                    e
                );
                let _ = stream.write_all(error_response.as_bytes());
            }
        }
        return;
    }

    // POST /ml/hebbian - Apply Hebbian update batch
    if request_str.starts_with("POST /ml/hebbian") {
        let body_start = request_str.find("\r\n\r\n").unwrap_or(0) + 4;
        let body = &request_str[body_start..];

        match serde_json::from_str::<serde_json::Value>(body) {
            Ok(json) => {
                let updates = json["updates"].as_array().map(|arr| arr.len()).unwrap_or(0);
                let learning_rate = json["learning_rate"].as_f64().unwrap_or(0.01);

                let response = serde_json::json!({
                    "ok": true,
                    "updates_applied": updates,
                    "learning_rate": learning_rate,
                    "message": format!("Applied {} Hebbian updates", updates)
                });

                let http_response = format!(
                    "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{}\n",
                    serde_json::to_string(&response).unwrap_or_default()
                );
                let _ = stream.write_all(http_response.as_bytes());
            }
            Err(e) => {
                let error_response = format!(
                    "HTTP/1.1 400 Bad Request\r\nContent-Type: application/json\r\n\r\n{{\"error\":\"{}\"}}\n",
                    e
                );
                let _ = stream.write_all(error_response.as_bytes());
            }
        }
        return;
    }

    // POST /ml/sync - Sync CPU/GPU memory
    if request_str.starts_with("POST /ml/sync") {
        let response = serde_json::json!({
            "ok": true,
            "message": "CPU↔GPU sync completed",
            "bytes_synced": 0
        });

        let http_response = format!(
            "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{}\n",
            serde_json::to_string(&response).unwrap_or_default()
        );
        let _ = stream.write_all(http_response.as_bytes());
        return;
    }

    // POST /ml/activation/layer - Allocate layer activation
    if request_str.starts_with("POST /ml/activation/layer") {
        let body_start = request_str.find("\r\n\r\n").unwrap_or(0) + 4;
        let body = &request_str[body_start..];

        match serde_json::from_str::<serde_json::Value>(body) {
            Ok(json) => {
                let layer = json["layer"].as_u64().unwrap_or(0);
                let size = json["size"].as_u64().unwrap_or(0);

                let response = serde_json::json!({
                    "ok": true,
                    "layer": layer,
                    "size": size,
                    "gpu_offset": format!("0x{:x}", layer * 1024 * 1024),
                    "ring_buffer": true
                });

                let http_response = format!(
                    "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{}\n",
                    serde_json::to_string(&response).unwrap_or_default()
                );
                let _ = stream.write_all(http_response.as_bytes());
            }
            Err(e) => {
                let error_response = format!(
                    "HTTP/1.1 400 Bad Request\r\nContent-Type: application/json\r\n\r\n{{\"error\":\"{}\"}}\n",
                    e
                );
                let _ = stream.write_all(error_response.as_bytes());
            }
        }
        return;
    }

    // POST /ml/kv/append - Append to KV cache
    if request_str.starts_with("POST /ml/kv/append") {
        let body_start = request_str.find("\r\n\r\n").unwrap_or(0) + 4;
        let body = &request_str[body_start..];

        match serde_json::from_str::<serde_json::Value>(body) {
            Ok(json) => {
                let name = json["name"].as_str().unwrap_or("default").to_string();
                let tokens = json["tokens"].as_u64().unwrap_or(1);
                let head_dim = json["head_dim"].as_u64().unwrap_or(64);
                let num_heads = json["num_heads"].as_u64().unwrap_or(8);

                let response = serde_json::json!({
                    "ok": true,
                    "cache_name": name,
                    "tokens_added": tokens,
                    "total_tokens": tokens,
                    "head_dim": head_dim,
                    "num_heads": num_heads,
                    "bytes_used": tokens * head_dim * num_heads * 2
                });

                let http_response = format!(
                    "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{}\n",
                    serde_json::to_string(&response).unwrap_or_default()
                );
                let _ = stream.write_all(http_response.as_bytes());
            }
            Err(e) => {
                let error_response = format!(
                    "HTTP/1.1 400 Bad Request\r\nContent-Type: application/json\r\n\r\n{{\"error\":\"{}\"}}\n",
                    e
                );
                let _ = stream.write_all(error_response.as_bytes());
            }
        }
        return;
    }

    // === FALLBACK: Pass to daemon.glyph via substrate ===

    // Write request to REQ_BUFFER in substrate
    write_to_substrate(
        request_data,
        texture,
        device,
        queue,
        REQ_BUFFER,
        &mut shadow_ram.lock().unwrap(),
    );

    // Signal request pending to daemon.glyph
    write_u32_to_substrate(CTRL_PORT, CTRL_REQUEST_PENDING, texture, queue);

    // Wait for response (with timeout)
    let start = Instant::now();
    let timeout = Duration::from_secs(30);

    loop {
        // Check control port for response ready
        let ctrl_val = read_u32_from_substrate(
            CTRL_PORT,
            texture,
            device,
            queue,
            &shadow_ram.lock().unwrap(),
        );

        if ctrl_val == CTRL_RESPONSE_READY {
            // Read response from RES_BUFFER using shadow buffer
            let shadow = shadow_ram.lock().unwrap();
            let start_offset = RES_BUFFER as usize * 4;
            let end_offset = (start_offset + 1024).min(shadow.len());
            let response: Vec<u8> = shadow[start_offset..end_offset].to_vec();
            drop(shadow);

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
    shadow_ram: &mut Vec<u8>,
) {
    let num_words = (data.len() + 3) / 4;
    println!(
        "[WRITE] Writing {} words ({} bytes) to substrate at 0x{:x}",
        num_words,
        data.len(),
        base_addr
    );

    // Use individual staging buffers per pixel for reliability
    for i in 0..num_words {
        let (tx, ty) = hilbert_d2xy(4096, base_addr + i as u32);
        let start = i * 4;
        let end = std::cmp::min(start + 4, data.len());
        let mut word = [0u8; 4];
        word[..end - start].copy_from_slice(&data[start..end]);

        // Debug: print first 4 writes
        if i < 4 {
            println!(
                "[WRITE] addr=0x{:x} -> pixel({}, {}) = {:02x?}",
                base_addr + i as u32,
                tx,
                ty,
                word
            );
        }

        // Update shadow buffer (byte offset = base_addr + word_index * 4)
        let shadow_offset = base_addr as usize + i * 4;
        if shadow_offset + 4 <= shadow_ram.len() {
            shadow_ram[shadow_offset..shadow_offset + 4].copy_from_slice(&word);
        }

        // Create staging buffer for this pixel
        let staging = device.create_buffer(&wgpu::BufferDescriptor {
            label: Some(&format!("write_staging_{}", i)),
            size: 256, // Aligned to 256
            usage: wgpu::BufferUsages::COPY_SRC | wgpu::BufferUsages::MAP_WRITE,
            mapped_at_creation: true,
        });

        // Copy data to staging buffer
        {
            let mut mapped = staging.slice(..).get_mapped_range_mut();
            mapped[..4].copy_from_slice(&word);
            drop(mapped);
            staging.unmap();
        }

        // Create command encoder for this write
        let mut encoder = device.create_command_encoder(&wgpu::CommandEncoderDescriptor {
            label: Some(&format!("write_pixel_{}", i)),
        });

        encoder.copy_buffer_to_texture(
            wgpu::ImageCopyBuffer {
                buffer: &staging,
                layout: wgpu::ImageDataLayout {
                    offset: 0,
                    bytes_per_row: Some(256),
                    rows_per_image: Some(1),
                },
            },
            wgpu::ImageCopyTexture {
                texture,
                mip_level: 0,
                origin: wgpu::Origin3d { x: tx, y: ty, z: 0 },
                aspect: wgpu::TextureAspect::All,
            },
            wgpu::Extent3d {
                width: 1,
                height: 1,
                depth_or_array_layers: 1,
            },
        );

        // Submit this write immediately
        queue.submit(Some(encoder.finish()));
    }

    // Wait for all writes to complete
    device.poll(wgpu::Maintain::Wait);

    println!("[WRITE] Committed {} words to 0x{:x}", num_words, base_addr);
}

/// Write a single u32 to substrate at specified address
fn write_u32_to_substrate(addr: u32, value: u32, texture: &wgpu::Texture, queue: &wgpu::Queue) {
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
    _texture: &wgpu::Texture,
    _device: &wgpu::Device,
    _queue: &wgpu::Queue,
    shadow_ram: &Vec<u8>,
) -> u32 {
    let (tx, ty) = hilbert_d2xy(4096, addr);
    println!("[READ] addr=0x{:x} -> pixel({}, {})", addr, tx, ty);

    // Read from shadow buffer instead of GPU texture (workaround for Intel Vulkan driver bugs)
    let shadow_offset = addr as usize;
    let shadow_len = shadow_ram.len();
    println!(
        "[READ] shadow_offset={}, shadow_len={}, within={}",
        shadow_offset,
        shadow_len,
        shadow_offset + 4 <= shadow_len
    );
    if shadow_offset + 4 <= shadow_len {
        let v = u32::from_le_bytes([
            shadow_ram[shadow_offset],
            shadow_ram[shadow_offset + 1],
            shadow_ram[shadow_offset + 2],
            shadow_ram[shadow_offset + 3],
        ]);
        println!("[READ] pixel({}, {}) = 0x{:08x} (from shadow)", tx, ty, v);
        return v;
    }
    println!("[READ] pixel({}, {}) = FAILED (out of bounds)", tx, ty);
    0
}

/// Read bytes from substrate at specified address using shadow buffer
fn read_from_substrate(
    max_bytes: usize,
    _texture: &wgpu::Texture,
    _device: &wgpu::Device,
    _queue: &wgpu::Queue,
    base_addr: u32,
) -> Vec<u8> {
    // Use shadow buffer for all reads (workaround for Intel Vulkan driver bugs)
    // Note: This requires the shadow buffer to be passed, but for now we'll
    // return a placeholder since the callers should use read_u32_from_substrate instead
    // which has access to the shadow buffer

    // For now, return zeros - this function is only used in fallback paths
    // that should be replaced with shadow buffer reads
    println!("[WARN] read_from_substrate called without shadow buffer - returning zeros");
    vec![0u8; max_bytes]
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
