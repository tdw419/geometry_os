//! RISC-V GPU VM Test Runner
//!
//! CLI tool to run RISC-V programs encoded in .rts.png format on the GPU.
//! Streams UART output to the Visual Bridge for Neuro-Silicon integration.
//! Sends heat map updates for Visual Hotspot Debugger.

use anyhow::Result;
use std::env;
use std::path::PathBuf;
use std::sync::Arc;
use tokio::sync::Mutex;

use infinite_map_rs::riscv::{RiscvExecutor, AsciiSceneHook, WebSocketHook, HeatHook, RiscvHookBroadcaster};

// WebSocket streaming to Visual Bridge
use tokio_tungstenite::{connect_async, tungstenite::protocol::Message};
use futures_util::{sink::SinkExt, stream::StreamExt};
use serde_json::json;

#[tokio::main]
async fn main() -> Result<()> {
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        eprintln!("RISC-V GPU VM Test Runner");
        eprintln!("========================");
        eprintln!();
        eprintln!("Usage: {} <program.rts.png>", args[0]);
        eprintln!();
        eprintln!("Example:");
        eprintln!("  {} ../../riscv_gpu/tests/minimal_test.rts.png", args[0]);
        eprintln!();
        eprintln!("Options:");
        eprintln!("  --max-cycles N  Set maximum execution cycles (default: 100000)");
        std::process::exit(1);
    }

    let program_path = PathBuf::from(&args[1]);

    if !program_path.exists() {
        anyhow::bail!("Program not found: {}", program_path.display());
    }

    // Parse options
    let mut max_cycles = 100000u32;
    for i in 2..args.len() {
        match args[i].as_str() {
            "--max-cycles" if i + 1 < args.len() => {
                max_cycles = args[i + 1].parse()
                    .map_err(|_| anyhow::anyhow!("Invalid max-cycles value"))?;
            }
            _ => {}
        }
    }

    println!("RISC-V GPU VM Test Runner");
    println!("========================");
    println!("Program: {}", program_path.display());
    println!("Max cycles: {}", max_cycles);
    println!();

    // Connect to Visual Bridge for UART streaming (Neuro-Silicon Bridge)
    let bridge_url = "ws://localhost:8768";

    // Type alias for WebSocket sender
    type WsSender = futures_util::stream::SplitSink<
        tokio_tungstenite::WebSocketStream<tokio_tungstenite::MaybeTlsStream<tokio::net::TcpStream>>,
        Message
    >;

    let ws_sender: Arc<Mutex<Option<WsSender>>> = Arc::new(Mutex::new(None));

    match connect_async(bridge_url).await {
        Ok((ws_stream, _)) => {
            println!("🦾 Connected to Visual Bridge at {}", bridge_url);
            let (ws_tx, _) = ws_stream.split();
            *ws_sender.lock().await = Some(ws_tx);
        }
        Err(e) => {
            eprintln!("⚠️  Visual Bridge not available: {} (UART will still print to console)", e);
        }
    }

    // Clone for use in spawn
    let sender_clone = ws_sender.clone();

    // Initialize WGPU
    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
        backends: wgpu::Backends::all(),
        ..Default::default()
    });

    let adapter = instance
        .request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::HighPerformance,
            compatible_surface: None,
            force_fallback_adapter: false,
        })
        .await
        .ok_or_else(|| anyhow::anyhow!("Failed to find GPU adapter"))?;

    println!("GPU: {}", adapter.get_info().name);
    println!();

    let (device, queue) = adapter
        .request_device(
            &wgpu::DeviceDescriptor {
                label: Some("RISC-V GPU Device"),
                required_features: wgpu::Features::empty(),
                required_limits: wgpu::Limits::default(),
            },
            None,
        )
        .await?;

    // Create executor
    let mut executor = RiscvExecutor::new(device, queue)?
        .with_max_cycles(max_cycles);

    // Initialize Multi-Hook Broadcaster
    let mut broadcaster = RiscvHookBroadcaster::new();

    // 1. ASCII Scene Hook for AI perception
    let ascii_dir = PathBuf::from("systems/riscv_gpu/ascii_scene");
    let ascii_hook = AsciiSceneHook::new(ascii_dir);
    broadcaster.add_hook(Box::new(ascii_hook));

    // 2. WebSocket Hook for Visual Bridge streaming
    let websocket_hook = WebSocketHook::new(ws_sender.clone());
    broadcaster.add_hook(Box::new(websocket_hook));

    // 3. Heat Hook for Visual Hotspot Debugger
    let heat_hook = HeatHook::new(ws_sender.clone());
    broadcaster.add_hook(Box::new(heat_hook));

    executor.hooks = Some(Box::new(broadcaster));

    // Load program
    println!("Loading program...");
    executor.load_program(&program_path)?;

    // Run
    println!("Running...");
    
    let result = executor.run()?;

    println!();
    println!("Results:");
    println!("--------");
    println!("Cycles: {}", result.cycles_executed);
    println!("Exit Code: {}", result.exit_code);

    if !result.uart_output.is_empty() {
        println!();
        println!("UART Output:");
        println!("------------");
        println!("{}", result.uart_output);
    }

    // Exit with the program's exit code
    std::process::exit(result.exit_code as i32);
}
