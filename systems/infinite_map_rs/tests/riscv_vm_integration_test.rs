//! RISC-V GPU VM Integration Tests
//!
//! Integration tests for the RISC-V VM running on GPU.

use infinite_map_rs::riscv::{RiscvExecutor, RiscvProgram};
use std::path::PathBuf;

/// Test loading a minimal RISC-V program
#[test]
fn test_load_minimal_program() {
    let program_path = PathBuf::from("systems/riscv_gpu/tests/minimal_test.rts.png");

    if !program_path.exists() {
        println!(
            "Skipping test_load_minimal_program - file not found at {:?}",
            program_path
        );
        return;
    }

    let program = RiscvProgram::load_from_rts(&program_path).expect("Failed to load program");

    assert_eq!(program.entry_point, 0x800000f8);
    assert!(!program.code.is_empty());
    assert_eq!(program.metadata.architecture, "riscv32");
    assert_eq!(program.metadata.grid_size, 16);

    println!("Loaded program with {} instructions", program.code.len());
}

/// Test executing a minimal RISC-V program on GPU
#[tokio::test]
async fn test_execute_minimal_program() {
    let program_path = PathBuf::from("systems/riscv_gpu/tests/minimal_test.rts.png");

    if !program_path.exists() {
        println!(
            "Skipping test_execute_minimal_program - file not found at {:?}",
            program_path
        );
        return;
    }

    // Initialize WGPU
    let instance = wgpu::Instance::new(wgpu::InstanceDescriptor::default());

    let adapter = match instance
        .request_adapter(&wgpu::RequestAdapterOptions {
            power_preference: wgpu::PowerPreference::HighPerformance,
            compatible_surface: None,
            force_fallback_adapter: false,
        })
        .await
    {
        Some(a) => a,
        None => {
            println!("Skipping test_execute_minimal_program - no GPU available");
            return;
        }
    };

    println!("Using GPU: {}", adapter.get_info().name);

    let (device, queue) = adapter
        .request_device(&wgpu::DeviceDescriptor::default(), None)
        .await
        .expect("Failed to create device");

    let mut executor = RiscvExecutor::new(device, queue).expect("Failed to create executor");

    executor
        .load_program(&program_path)
        .expect("Failed to load program");

    let result = executor.run().expect("Failed to run program");

    // Verify execution completed
    println!("Executed {} cycles", result.cycles_executed);
    println!("Exit code: {}", result.exit_code);

    if !result.uart_output.is_empty() {
        println!("UART output: {}", result.uart_output);
    }

    assert!(
        result.cycles_executed > 0,
        "Program should execute at least one cycle"
    );
}
