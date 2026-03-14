# Pixel CPU: GPU-Native RISC-V Emulator

Pixel CPU is a RISC-V emulator implemented in pure WebGPU Shading Language (WGSL). This project enables the execution of RISC-V instructions directly on the GPU substrate, leveraging massive parallelism for "Swarm Computing" and "Visual Intelligence".

## Architecture

The "Computer" is a 4096² RGBA float32 texture.
- **Red Channel**: Opcode
- **Green Channel**: Destination Register / Activation
- **Blue Channel**: Source Register 1
- **Alpha Channel**: Source Register 2 / Immediate

## Features

1.  **Instruction Execution**: Supports core RISC-V instructions (`ADD`, `SUB`, `MOV`, `JMP`, `CMP`, etc.).
2.  **Swarm Mode**: Can execute thousands of micro-kernels in parallel (64x64 pixel blocks).
3.  **Visual Debugging**: Memory states are visualized in real-time. Instructions glowing green, registers pulsing blue.
4.  **Statistics**: Tracks detailed execution metrics (instructions/sec, cache hits, branches).

## Usage

The Pixel CPU is interpreted by the **Optical Hypervisor** (`glass_boot`).

```rust
// In Cargo.toml
glass_boot = { path = "systems/glass_boot" }
```

### Running a Brick
```bash
# 1. Compile Glass Boot
cargo build --release -p glass_boot

# 2. Inject a Brick (e.g., Linux Kernel Micro-loader)
python3 systems/masonry/inject_masonry.py --slot 1 bricks/vmlinuz.brick

# 3. Boot
./target/release/glass_boot --rts-file geometry_os.rts
```
