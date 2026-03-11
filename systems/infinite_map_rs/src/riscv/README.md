# RISC-V GPU VM Module

## Overview
This module implements a RISC-V RV32IMA virtual machine that runs on the GPU using WebGPU compute shaders.

## Architecture
- **Program Loader** (`program.rs`): Loads .rts.png format files containing RISC-V programs
- **Memory Layout** (`memory.rs`): Manages GPU buffers and textures for VM state
- **Pipeline** (`pipeline.rs`): Creates compute pipelines for init/execute stages
- **Executor** (`executor.rs`): Orchestrates VM execution with init/execute loop

## Shader Compatibility Notes
The WGSL shader (`shaders/riscv_linux_vm.wgsl`) has been modified for WGSL compatibility:
- No i64/u64 types (replaced with 32-bit multiplication helpers: mulh_signed, mulh_unsigned)
- No reserved keywords (enable → interrupt_enable, target → jump_target)

## 64-bit Multiplication Helpers
Since WGSL doesn't support i64/u64, the shader implements MULH/MULHSU/MULHU using 32-bit operations:
- `mulh_signed(a, b)` - Returns high 32 bits of signed 64-bit multiplication
- `mulh_unsigned(a, b)` - Returns high 32 bits of unsigned 64-bit multiplication

These are implemented using 16-bit chunk decomposition with proper carry handling.

## Usage
```bash
# Build test runner
cargo build --bin run_riscv --release

# Run a RISC-V program
./target/release/run_riscv path/to/program.rts.png
```

## Testing
```bash
# Integration tests
cargo test --test riscv_vm_integration_test

# Multiplication helper tests
cargo test --test wgsl_mulh_test
```
