// ============================================
// RISC-V EXECUTOR v1.0 - BASELINE (Single-Threaded)
// ============================================
// This is the ORIGINAL single-threaded version for performance comparison.
// Use this to measure the speedup achieved by Phase 1 multi-workgroup execution.

// To use this shader instead of the multi-workgroup version:
// 1. Change RiscvExecutor::new() to load this WGSL file
// 2. Run benchmarks comparing the two

// Include all the same structures and functions as riscv_executor.wgsl
// but with @workgroup_size(1) in the main function

// For simplicity, this file references the main riscv_executor.wgsl
// and only modifies the workgroup_size attribute.

// In a production setup, you would:
// 1. Compile this shader separately with workgroup_size(1)
// 2. Load it in RiscvExecutor::new_baseline()
// 3. Compare performance with the multi-workgroup version

// The key difference is ONLY in the compute shader attribute:
//
// v1.0 (this file):    @compute @workgroup_size(1)
// v2.0 (main file):    @compute @workgroup_size(16)

// All other code (instruction decode, execute, etc.) remains identical.

// ============================================
// BASELINE MARKER
// ============================================
// This shader is intentionally kept minimal because it differs
// only in workgroup_size from riscv_executor.wgsl
//
// To implement baseline comparison:
//
// In riscv_executor.rs:
//
// pub fn create_baseline(device: Arc<Device>, queue: Arc<Queue>) -> Self {
//     // Load riscv_executor_v1.wgsl (workgroup_size=1)
//     let shader_source = include_str!("shaders/riscv_executor_v1.wgsl");
//     let module = device.create_shader_module(wgpu::ShaderModuleDescriptor {
//         label: Some("RISC-V v1.0 Baseline"),
//         source: wgpu::ShaderSource::Wgsl(shader_source.into()),
//     });
//     // ... rest of initialization
// }
//
// pub fn create_multi_workgroup(device: Arc<Device>, queue: Arc<Queue>) -> Self {
//     // Load riscv_executor.wgsl (workgroup_size=16)
//     // ... same as current implementation
// }
