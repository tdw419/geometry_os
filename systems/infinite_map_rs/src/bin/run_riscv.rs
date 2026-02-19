//! RISC-V GPU VM Test Runner
//!
//! CLI tool to run RISC-V programs encoded in .rts.png format on the GPU.
//! Streams UART output to the Visual Bridge for Neuro-Silicon integration.

use anyhow::Result;
use std::env;
use std::path::PathBuf;
use std::sync::Arc;
use tokio::sync::Mutex;

use infinite_map_rs::riscv::RiscvExecutor;

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

    // Load program
    println!("Loading program...");
    executor.load_program(&program_path)?;

    // Run
    println!("Running...");
    
    // Use a custom run loop to print UART output continuously
    let memory = executor.memory.as_ref()
        .ok_or_else(|| anyhow::anyhow!("No program loaded"))?;

    // Run init shader first
    let mut encoder = executor.device.create_command_encoder(&Default::default());
    {
        let mut pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor::default());
        pass.set_pipeline(&executor.pipeline.init_pipeline);
        pass.set_bind_group(0, &memory.bind_group, &[]);
        pass.dispatch_workgroups(1, 1, 1);
    }
    executor.queue.submit(Some(encoder.finish()));
    executor.device.poll(wgpu::MaintainBase::Wait);

    let mut cycles = 0;
    let batch_size = 10000;
    let mut uart_output = String::new();

    while cycles < max_cycles {
        let mut encoder = executor.device.create_command_encoder(&Default::default());
        {
            let mut pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor::default());
            pass.set_pipeline(&executor.pipeline.execute_pipeline);
            pass.set_bind_group(0, &memory.bind_group, &[]);
            pass.dispatch_workgroups(1, 1, 1);
        }
        executor.queue.submit(Some(encoder.finish()));
        executor.device.poll(wgpu::MaintainBase::Wait);

        // Debug: Check VM state every 50000 cycles
        if cycles % 50000 == 0 {
            let state_staging = executor.device.create_buffer(&wgpu::BufferDescriptor {
                label: None,
                size: 32, // ExecutionState size
                usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
                mapped_at_creation: false,
            });
            let mut state_encoder = executor.device.create_command_encoder(&wgpu::CommandEncoderDescriptor::default());
            state_encoder.copy_buffer_to_buffer(&memory.state_buffer, 0, &state_staging, 0, 32);
            executor.queue.submit(Some(state_encoder.finish()));
            executor.device.poll(wgpu::MaintainBase::Wait);

            let state_slice = state_staging.slice(..);
            state_slice.map_async(wgpu::MapMode::Read, |_| {});
            executor.device.poll(wgpu::MaintainBase::Wait);
            {
                let data = state_slice.get_mapped_range();
                let state_values: &[u32] = bytemuck::cast_slice(&data);
                eprintln!("[CYCLE {}] running={} cycle_count={} instr_count={} privilege={}",
                    cycles, state_values[0], state_values[2], state_values[3], state_values[4]);
                drop(data);
            }
            state_staging.unmap();
        }

        // Collect UART output and print immediately
        let old_len = uart_output.len();
        infinite_map_rs::riscv::RiscvExecutor::collect_uart_output_static(
            &executor.device,
            &executor.queue,
            &memory.stats_buffer,
            &mut executor.uart_head,
            &mut uart_output,
        );
        
        // Debug: Check for UART write indicator
        let stats_staging = executor.device.create_buffer(&wgpu::BufferDescriptor {
            label: None,
            size: 4 * 64, // Read entire stats buffer
            usage: wgpu::BufferUsages::MAP_READ | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        let mut stats_encoder = executor.device.create_command_encoder(&wgpu::CommandEncoderDescriptor::default());
        stats_encoder.copy_buffer_to_buffer(&memory.stats_buffer, 0, &stats_staging, 0, 4 * 64);
        executor.queue.submit(Some(stats_encoder.finish()));
        executor.device.poll(wgpu::MaintainBase::Wait);

        let stats_slice = stats_staging.slice(..);
        stats_slice.map_async(wgpu::MapMode::Read, |_| {});
        executor.device.poll(wgpu::MaintainBase::Wait);

        {
            let data = stats_slice.get_mapped_range();
            let stats_values: &[u32] = bytemuck::cast_slice(&data);
            // Print UART count on first iteration
            if cycles == 0 && (stats_values[0] > 0 || stats_values[63] != 0) {
                eprintln!("[DEBUG] UART writes: {}", stats_values[0]);
            }
            drop(data);
        }
        stats_staging.unmap();

        if uart_output.len() > old_len {
            let new_output = &uart_output[old_len..];
            print!("{}", new_output);
            std::io::Write::flush(&mut std::io::stdout())?;

            // Stream to Visual Bridge (Neuro-Silicon Bridge)
            let text = new_output.to_string();
            let sender = sender_clone.clone();
            tokio::spawn(async move {
                if let Some(tx) = sender.lock().await.as_mut() {
                    let msg = json!({
                        "type": "riscv_uart",
                        "text": text,
                        "timestamp": chrono::Utc::now().timestamp_millis(),
                        "vm_id": "riscv-gpu-vm"
                    });
                    let _ = tx.send(Message::Text(msg.to_string())).await;
                }
            });
        }

        cycles += batch_size;
    }

    let final_state = executor.is_halted(memory)?;
    let exit_code = executor.get_exit_code(memory)?;

    println!();
    println!("Results:");
    println!("--------");
    println!("Cycles: {}", cycles);
    println!("Exit Code: {}", exit_code);

    if !uart_output.is_empty() {
        println!();
        println!("UART Output:");
        println!("------------");
        println!("{}", uart_output);
    }

    // Exit with the program's exit code
    std::process::exit(exit_code as i32);
}
