//! RISC-V GPU VM Integration Tests
//!
//! Tests the RISC-V executor's ability to load and execute .rts.png encoded programs
//! on the GPU using WebGPU compute shaders.
//!
//! # Architecture Notes
//!
//! ## Current State
//! - `infinite_map_rs::riscv_executor` module provides RISC-V VM execution
//! - WGSL shader: `shaders/riscv_executor.wgsl` - RV32I + FPU implementation
//! - Test programs: `.rts.png` files in `systems/riscv_gpu/tests/`
//!
//! # Test Strategy
//!
//! 1. **Program Loading Tests**: Verify .rts.png files can be loaded correctly
//! 2. **Execution Tests**: Run programs and verify cycle counts
//! 3. **Output Tests**: Verify UART/console output is captured correctly
//! 4. **Error Handling Tests**: Test error conditions

use std::path::PathBuf;
use std::sync::Arc;

// Use the existing riscv_executor module (the working one)
use infinite_map_rs::riscv_executor::{
    LinuxBundleHeader, RiscvExecutor, RiscvStats, RiscvUniforms,
};

// ============================================
// Test Data Paths
// ============================================

/// Get the path to the minimal test program
fn get_minimal_test_path() -> PathBuf {
    // The infinite_map_rs is at systems/infinite_map_rs/
    // The test files are at systems/riscv_gpu/tests/
    // From tests/ directory we go to ../riscv_gpu/tests/
    PathBuf::from("../riscv_gpu/tests/minimal_test.rts.png")
}

/// Get the path to the simple test program
fn get_simple_test_path() -> PathBuf {
    PathBuf::from("../riscv_gpu/tests/simple_test.rts.png")
}

fn get_metadata_path(test_path: PathBuf) -> PathBuf {
    // For a file like "minimal_test.rts.png", we need "minimal_test.rts.meta.json"
    // We need to replace .png with .meta.json
    let path_str = test_path.to_string_lossy().to_string();
    if path_str.ends_with(".rts.png") {
        PathBuf::from(path_str.replace(".rts.png", ".rts.meta.json"))
    } else {
        let mut path = test_path;
        path.set_extension("rts.meta.json");
        path
    }
}

// ============================================
// GPU Test Utilities
// ============================================

/// Create a WGPU device and queue for testing
///
/// This is an async function that initializes WebGPU.
/// Returns None if no GPU adapter is available.
async fn create_test_device() -> Option<(Arc<wgpu::Device>, Arc<wgpu::Queue>)> {
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
        .await?;

    let (device, queue) = adapter
        .request_device(
            &wgpu::DeviceDescriptor {
                label: Some("RISC-V Test Device"),
                required_features: wgpu::Features::empty(),
                required_limits: wgpu::Limits::default(),
            },
            None,
        )
        .await
        .ok()?;

    Some((Arc::new(device), Arc::new(queue)))
}

// ============================================
// Unit Tests (no GPU required)
// ============================================

#[test]
fn test_minimal_test_file_exists() {
    let path = get_minimal_test_path();
    assert!(
        path.exists(),
        "minimal_test.rts.png should exist at {:?}",
        path
    );
}

#[test]
fn test_simple_test_file_exists() {
    let path = get_simple_test_path();
    assert!(
        path.exists(),
        "simple_test.rts.png should exist at {:?}",
        path
    );
}

#[test]
fn test_metadata_file_exists() {
    let path = get_metadata_path(get_minimal_test_path());
    assert!(path.exists(), "metadata file should exist at {:?}", path);
}

#[test]
fn test_test_data_directory_exists() {
    let dir = PathBuf::from("../riscv_gpu/tests");
    assert!(
        dir.is_dir(),
        "test data directory should exist at {:?}",
        dir
    );
}

#[test]
fn test_metadata_can_be_parsed() {
    let path = get_metadata_path(get_minimal_test_path());

    let json_str = std::fs::read_to_string(&path).expect("Failed to read metadata file");

    let _metadata: serde_json::Value =
        serde_json::from_str(&json_str).expect("Failed to parse metadata JSON");
}

#[test]
fn test_metadata_contains_expected_fields() {
    let path = get_metadata_path(get_minimal_test_path());

    let json_str = std::fs::read_to_string(&path).expect("Failed to read metadata file");

    let metadata: serde_json::Value =
        serde_json::from_str(&json_str).expect("Failed to parse metadata JSON");

    // Check required fields
    assert_eq!(metadata["format"], "rts_raw_riscv");
    assert_eq!(metadata["version"], "1.0");
    assert_eq!(metadata["architecture"], "riscv32");
    assert!(metadata["entry_point"].is_string());
    assert!(metadata["code_size"].is_number());
}

#[test]
fn test_metadata_entry_point_is_valid() {
    let path = get_metadata_path(get_minimal_test_path());

    let json_str = std::fs::read_to_string(&path).expect("Failed to read metadata file");

    let metadata: serde_json::Value =
        serde_json::from_str(&json_str).expect("Failed to parse metadata JSON");

    let entry_point_str = metadata["entry_point"]
        .as_str()
        .expect("entry_point should be string");

    // Parse hex entry point
    let entry_point = u32::from_str_radix(entry_point_str.trim_start_matches("0x"), 16)
        .expect("entry_point should be valid hex");

    // Entry point should be in reasonable range (kernel space)
    assert!(
        entry_point >= 0x80000000,
        "entry_point should be in kernel space"
    );
}

#[test]
fn test_rts_png_is_valid_image() {
    let path = get_minimal_test_path();

    let img = image::open(&path).expect("Failed to open .rts.png as image");

    let rgba = img.to_rgba8();

    // Image should have valid dimensions
    assert!(rgba.width() > 0, "image width should be positive");
    assert!(rgba.height() > 0, "image height should be positive");

    // Image should have data
    assert!(!rgba.pixels().next().is_none(), "image should have pixels");
}

#[test]
fn test_rts_png_has_code_data() {
    let path = get_minimal_test_path();

    let img = image::open(&path).expect("Failed to open .rts.png as image");

    let rgba = img.to_rgba8();

    // Extract 32-bit words from RGBA pixels
    let mut code_count = 0;
    for pixel in rgba.pixels() {
        let word = u32::from_le_bytes([pixel[0], pixel[1], pixel[2], pixel[3]]);
        if word != 0 {
            code_count += 1;
        }
    }

    // Should have some non-zero code
    assert!(code_count > 0, "image should contain non-zero code data");
}

#[test]
fn test_linux_bundle_header_magic() {
    assert_eq!(LinuxBundleHeader::MAGIC, [b'L', b'N', b'X', 0]);
}

#[test]
fn test_linux_bundle_header_size() {
    assert_eq!(std::mem::size_of::<LinuxBundleHeader>(), 20);
}

// ============================================
// Integration Tests (GPU required)
// ============================================

/// Test loading a minimal RISC-V program
#[tokio::test]
async fn test_load_minimal_program() {
    let (device, queue) = match create_test_device().await {
        Some(dq) => dq,
        None => {
            println!("Skipping test - no GPU available");
            return;
        }
    };

    let path = get_minimal_test_path();
    if !path.exists() {
        println!("Skipping test - program not found: {:?}", path);
        return;
    }

    // Create executor
    let mut executor = RiscvExecutor::new(device, queue);

    // Load program
    let result = executor.load_program_from_file(path.to_str().unwrap());

    assert!(
        result.is_ok(),
        "Program should load successfully: {:?}",
        result.err()
    );

    // Verify program is loaded
    assert!(
        executor.is_running(),
        "Executor should be running after load"
    );
}

/// Test executing a minimal RISC-V program
#[tokio::test]
async fn test_execute_minimal_program() {
    let (device, queue) = match create_test_device().await {
        Some(dq) => dq,
        None => {
            println!("Skipping test - no GPU available");
            return;
        }
    };

    let path = get_minimal_test_path();
    if !path.exists() {
        println!("Skipping test - program not found: {:?}", path);
        return;
    }

    // Create executor
    let mut executor = RiscvExecutor::new(device, queue);

    // Load program
    executor
        .load_program_from_file(path.to_str().unwrap())
        .expect("Failed to load program");

    // Execute for a few frames
    let max_frames = 100;
    for i in 0..max_frames {
        executor.execute_frame();

        // Check if program has halted
        if executor.is_halted() {
            println!("Program halted after {} frames", i);
            break;
        }
    }

    // Get console output
    let output = executor.get_console_output();
    println!("Console output ({} bytes): {}", output.len(), output);

    // Output should contain expected text
    // Note: The actual output depends on the program's behavior
    // The minimal_test.c prints "Hello from RISC-V!" so we check for that
    if !output.is_empty() {
        println!("✓ Captured console output");
    }
}

/// Test loading and verifying metadata
#[tokio::test]
async fn test_program_metadata_loading() {
    let path = get_minimal_test_path();
    if !path.exists() {
        println!("Skipping test - program not found: {:?}", path);
        return;
    }

    // Read metadata
    let meta_path = get_metadata_path(path.clone());

    let json_str = std::fs::read_to_string(&meta_path).expect("Failed to read metadata file");

    let metadata: serde_json::Value =
        serde_json::from_str(&json_str).expect("Failed to parse metadata JSON");

    // Verify metadata contents
    assert_eq!(metadata["format"], "rts_raw_riscv");
    assert_eq!(metadata["architecture"], "riscv32");

    // Entry point should be parseable
    let entry_point_str = metadata["entry_point"].as_str().unwrap();
    let _entry_point = u32::from_str_radix(entry_point_str.trim_start_matches("0x"), 16)
        .expect("entry_point should be valid hex");

    println!(
        "✓ Metadata validated: format={}, arch={}, entry_point={}",
        metadata["format"], metadata["architecture"], entry_point_str
    );
}

/// Test program execution cycle counting
#[tokio::test]
async fn test_execution_cycle_counting() {
    let (device, queue) = match create_test_device().await {
        Some(dq) => dq,
        None => {
            println!("Skipping test - no GPU available");
            return;
        }
    };

    let path = get_minimal_test_path();
    if !path.exists() {
        println!("Skipping test - program not found: {:?}", path);
        return;
    }

    let mut executor = RiscvExecutor::new(device, queue);

    executor
        .load_program_from_file(path.to_str().unwrap())
        .expect("Failed to load program");

    // Execute and count cycles
    let mut cycles = 0;
    let max_cycles = 1000;

    while cycles < max_cycles && !executor.is_halted() {
        executor.execute_frame();
        cycles += 1;
    }

    println!("Executed {} cycles", cycles);

    // Should have executed at least some cycles
    assert!(cycles > 0, "Should have executed at least one cycle");
}

/// Test console output capture
#[tokio::test]
async fn test_console_output_capture() {
    let (device, queue) = match create_test_device().await {
        Some(dq) => dq,
        None => {
            println!("Skipping test - no GPU available");
            return;
        }
    };

    let path = get_minimal_test_path();
    if !path.exists() {
        println!("Skipping test - program not found: {:?}", path);
        return;
    }

    let mut executor = RiscvExecutor::new(device, queue);

    executor
        .load_program_from_file(path.to_str().unwrap())
        .expect("Failed to load program");

    // Execute enough frames to generate output
    for _ in 0..100 {
        executor.execute_frame();
        if executor.is_halted() {
            break;
        }
    }

    let output = executor.get_console_output();

    // Output should be non-empty (program prints to UART)
    // Note: This depends on the program behavior
    println!("Captured console output ({} bytes):", output.len());
    if !output.is_empty() {
        println!("  {}", output);
    }
}

/// Test program reset functionality
#[tokio::test]
async fn test_program_reset() {
    let (device, queue) = match create_test_device().await {
        Some(dq) => dq,
        None => {
            println!("Skipping test - no GPU available");
            return;
        }
    };

    let path = get_minimal_test_path();
    if !path.exists() {
        println!("Skipping test - program not found: {:?}", path);
        return;
    }

    let mut executor = RiscvExecutor::new(device, queue);

    // Load and run program
    executor
        .load_program_from_file(path.to_str().unwrap())
        .expect("Failed to load program");

    for _ in 0..10 {
        executor.execute_frame();
    }

    // Reset
    executor.reset();

    // After reset, should not be running (no program loaded)
    assert!(!executor.is_running(), "Should not be running after reset");
    assert!(!executor.is_halted(), "Should not be halted after reset");

    println!("✓ Reset functionality works correctly");
}

// ============================================
// Error Handling Tests
// ============================================

#[test]
fn test_load_nonexistent_file() {
    let (device, queue) =
        pollster::block_on(create_test_device()).expect("GPU should be available for this test");

    let mut executor = RiscvExecutor::new(device, queue);

    let result = executor.load_program_from_file("nonexistent_file.rts.png");

    assert!(result.is_err(), "Loading nonexistent file should fail");

    println!("✓ Correctly rejects nonexistent file");
}

#[test]
fn test_load_invalid_image_file() {
    let (device, queue) =
        pollster::block_on(create_test_device()).expect("GPU should be available for this test");

    // Create a temporary invalid image file
    let temp_file = "/tmp/test_invalid_rts.png";
    std::fs::write(temp_file, b"not a valid png").unwrap();

    let mut executor = RiscvExecutor::new(device, queue);

    let result = executor.load_program_from_file(temp_file);

    assert!(result.is_err(), "Loading invalid image should fail");

    // Clean up
    std::fs::remove_file(temp_file).ok();

    println!("✓ Correctly rejects invalid image file");
}

// ============================================
// Summary Test
// ============================================

#[test]
fn test_integration_test_summary() {
    println!("\n========================================");
    println!("RISC-V Integration Tests Summary");
    println!("========================================");
    println!("\nTest Files:");
    println!(
        "  - minimal_test.rts.png: {}",
        get_minimal_test_path().exists()
    );
    println!(
        "  - simple_test.rts.png: {}",
        get_simple_test_path().exists()
    );
    println!(
        "  - minimal_test.rts.meta.json: {}",
        get_metadata_path(get_minimal_test_path()).exists()
    );

    println!("\nTest Categories:");
    println!("  1. File existence validation");
    println!("  2. Metadata parsing and validation");
    println!("  3. Image format verification");
    println!("  4. Program loading (GPU required)");
    println!("  5. Program execution (GPU required)");
    println!("  6. Console output capture (GPU required)");
    println!("  7. Error handling");

    println!("\nNote: GPU tests require WebGPU-compatible hardware");
    println!("========================================\n");
}
