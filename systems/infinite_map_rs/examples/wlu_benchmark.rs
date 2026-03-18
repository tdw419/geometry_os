//! WLU Backend Performance Benchmark
//!
//! Compares CPU vs GPU Wave Logic Unit performance to validate GPU acceleration.
//!
//! Run: cargo run --package infinite_map_rs --example wlu_benchmark --release

use std::time::Instant;

use infinite_map_rs::backend::wgpu::wlu_wgpu::WluWgpuResources;
use infinite_map_rs::wave_logic_unit::{WaveLogicBackend, WaveLogicUnit};

const DEFAULT_GRID_SIZE: u32 = 256;
const BENCHMARK_FRAMES: u32 = 100;
const DT: f32 = 0.016; // ~60fps timestep

fn benchmark_cpu_backend() -> (f64, f32) {
    println!("\n=== CPU Backend Benchmark ===");
    println!("Grid size: {}x{}", DEFAULT_GRID_SIZE, DEFAULT_GRID_SIZE);
    println!("Frames: {}", BENCHMARK_FRAMES);
    
    let mut cpu_wlu: Box<dyn WaveLogicBackend> = Box::new(WaveLogicUnit::new());
    cpu_wlu.set_oscillator_a_frequency(1.0);
    cpu_wlu.set_oscillator_a_amplitude(1.0);
    
    // Warmup
    for _ in 0..10 {
        cpu_wlu.update(DT);
    }
    
    let start = Instant::now();
    
    for _ in 0..BENCHMARK_FRAMES {
        cpu_wlu.update(DT);
    }
    
    let elapsed = start.elapsed();
    let frames_per_second = BENCHMARK_FRAMES as f64 / elapsed.as_secs_f64();
    let final_sensor_value = cpu_wlu.get_sensor_value();
    
    println!("Total time: {:.2?}", elapsed);
    println!("Frames per second: {:.2}", frames_per_second);
    println!("Time per frame: {:.2?}", elapsed / BENCHMARK_FRAMES);
    println!("Final sensor value: {:.4}", final_sensor_value);
    
    (frames_per_second, final_sensor_value)
}

async fn benchmark_gpu_backend() -> Option<(f64, f32)> {
    println!("\n=== GPU Backend Benchmark ===");
    println!("Grid size: {}x{}", DEFAULT_GRID_SIZE, DEFAULT_GRID_SIZE);
    println!("Frames: {}", BENCHMARK_FRAMES);
    
    // Try to create wgpu device
    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
        backends: wgpu::Backends::all(),
        dx12_shader_compiler: wgpu::Dx12Compiler::Fxc,
        ..Default::default()
    });
    
    let adapter = instance
        .request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::HighPerformance,
            force_fallback_adapter: false,
            compatible_surface: None,
        })
        .await?;
    
    let (device, queue) = adapter
        .request_device(
            &wgpu::DeviceDescriptor {
                label: Some("WLU Benchmark Device"),
                required_features: wgpu::Features::empty(),
                required_limits: wgpu::Limits::default(),
            },
            None,
        )
        .await
        .ok()?;
    
    let mut gpu_wlu: Box<dyn WaveLogicBackend> = Box::new(
        WluWgpuResources::new(device, queue, Some(DEFAULT_GRID_SIZE)).ok()?
    );
    gpu_wlu.set_oscillator_a_frequency(1.0);
    gpu_wlu.set_oscillator_a_amplitude(1.0);
    
    // Warmup
    for _ in 0..10 {
        gpu_wlu.update(DT);
    }
    
    let start = Instant::now();
    
    for _ in 0..BENCHMARK_FRAMES {
        gpu_wlu.update(DT);
    }
    
    let elapsed = start.elapsed();
    let frames_per_second = BENCHMARK_FRAMES as f64 / elapsed.as_secs_f64();
    let final_sensor_value = gpu_wlu.get_sensor_value();
    
    println!("Total time: {:.2?}", elapsed);
    println!("Frames per second: {:.2}", frames_per_second);
    println!("Time per frame: {:.2?}", elapsed / BENCHMARK_FRAMES);
    println!("Final sensor value: {:.4}", final_sensor_value);
    
    Some((frames_per_second, final_sensor_value))
}

#[tokio::main]
async fn main() {
    println!("╔════════════════════════════════════════════════════════╗");
    println!("║   WLU Backend Performance Benchmark                   ║");
    println!("╚════════════════════════════════════════════════════════╝");
    
    // Benchmark CPU backend
    let (cpu_fps, cpu_sensor) = benchmark_cpu_backend();
    
    // Benchmark GPU backend
    let gpu_result = benchmark_gpu_backend().await;
    
    // Print comparison
    println!("\n╔════════════════════════════════════════════════════════╗");
    println!("║   Results Comparison                                   ║");
    println!("╚════════════════════════════════════════════════════════╝");
    
    if let Some((gpu_fps, gpu_sensor)) = gpu_result {
        let speedup = gpu_fps / cpu_fps;
        println!("CPU FPS:    {:.2}", cpu_fps);
        println!("GPU FPS:    {:.2}", gpu_fps);
        println!("Speedup:    {:.2}x", speedup);
        println!("\nCPU sensor: {:.4}", cpu_sensor);
        println!("GPU sensor: {:.4}", gpu_sensor);
        println!("Difference: {:.6}", (cpu_sensor - gpu_sensor).abs());
        
        if speedup > 1.5 {
            println!("\n✓ GPU backend shows significant speedup ({:.1}x)", speedup);
        } else if speedup > 1.0 {
            println!("\n⚠ GPU backend shows modest speedup ({:.1}x)", speedup);
        } else {
            println!("\n✗ GPU backend is slower than CPU ({:.1}x)", speedup);
        }
        
        // Check sensor value consistency
        let sensor_diff = (cpu_sensor - gpu_sensor).abs();
        if sensor_diff < 0.1 {
            println!("✓ Sensor values are consistent (diff: {:.6})", sensor_diff);
        } else {
            println!("⚠ Sensor values differ significantly (diff: {:.6})", sensor_diff);
        }
    } else {
        println!("CPU FPS:    {:.2}", cpu_fps);
        println!("GPU:        NOT AVAILABLE");
        println!("\nGPU backend requires wgpu feature and compatible hardware.");
    }
    
    println!("\nBenchmark complete!");
}
