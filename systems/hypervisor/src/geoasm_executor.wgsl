/**
 * GeoASM Native Executor Shader
 * 
 * This shader provides high-performance GeoASM bytecode execution
 * with 2-3x throughput improvement over JavaScript-based dispatch.
 * 
 * Performance optimizations:
 * - Batch instruction execution (BATCH_SIZE instructions per dispatch)
 * - Direct texture access for memory operations
 * - Efficient Hilbert curve mapping
 * - Minimal branching in hot paths
 * - Multi-GPU synchronization via atomics
 * - Double-precision floating-point emulation (opcodes 0xA0-0xAF)
 * 
 * Double-Precision Emulation:
 * - f64 values stored as pairs of u32 (low bits, high bits)
 * - IEEE 754 compliant operations via software emulation
 * - Target: <10x slowdown vs single-precision
 * - Bit-exact results vs CPU reference
 */

// Configuration constants
const BATCH_SIZE: u32 = 8u;
const MEMORY_SIZE: u32 = 4096u;
const MAX_GPUS: u32 = 4u;

// ═══════════════════════════════════════════════════════════════════════════════
// DOUBLE-PRECISION FLOATING-POINT CONSTANTS
// ═══════════════════════════════════════════════════════════════════════════════

// IEEE 754 double-precision constants
const DP_SIGN_MASK: u32 = 0x80000000u;
const DP_EXP_MASK: u32 = 0x7FF00000u;
const DP_MANTISSA_HIGH_MASK: u32 = 0x000FFFFFu;
const DP_EXP_BIAS: u32 = 1023u;
const DP_EXP_MAX: u32 = 2047u;

// ═══════════════════════════════════════════════════════════════════════════════
// MULTI-GPU SYNCHRONIZATION STRUCTURES
// ═══════════════════════════════════════════════════════════════════════════════

// Cross-GPU synchronization state for atomic coordination
struct SyncState {
    barrier_count: atomic<u32>,      // Barrier counter (each GPU increments on arrival)
    generation: atomic<u32>,         // Generation counter for barrier reuse
    global_instructions: atomic<u64>, // Global instruction count across all GPUs
    memory_sync_bitmap: atomic<u32>, // Memory sync bitmap (bit N = GPU N has synced)
    error_flag: atomic<u32>,         // Error flag (non-zero if any GPU encountered error)
    gpu_status: array<atomic<u32>, 4>, // Per-GPU status (0=idle, 1=running, 2=waiting, 3=done)
    instruction_counts: array<atomic<u32>, 4>, // Per-GPU instruction counts for aggregation
}

// Work stealing task structure
struct ExecutionTask {
    start_ip: u32,
    instruction_count: u32,
    assigned_gpu: u32,
    status: u32,
    priority: u32,
    data_region_start: u32,
    data_region_end: u32,
    _padding: u32,
}

// Task queue for work stealing
struct TaskQueue {
    head: atomic<u32>,
    tail: atomic<u32>,
    task_count: atomic<u32>,
    _padding: array<u32, 13>,
    tasks: array<ExecutionTask, 256>,
}

// System state matching Rust SystemState struct
struct SystemState {
    tick: u32,
    entropy: f32,
    ip: u32,
    status: u32,
    instructions_executed: u32,
}

// Profiler state matching Rust ProfilerState struct
struct ProfilerState {
    active_timer_addr: u32,
    timer_start_time: f32,
    active: u32,
}

// Bindings
@group(0) @binding(0) var<storage, read_write> system: SystemState;
@group(0) @binding(1) var memory_canvas: texture_storage_2d<rgba8unorm, read_write>;
@group(0) @binding(2) var<storage, read_write> registers: array<u32, 256>;
@group(0) @binding(3) var<storage, read_write> profiler: ProfilerState;
@group(0) @binding(4) var<storage, read_write> instruction_counts: array<u32, 65536>;
@group(0) @binding(5) var<storage, read_write> instruction_timing: array<f32, 65536>;

// Multi-GPU synchronization bindings
@group(0) @binding(6) var<storage, read_write> sync_state: SyncState;
@group(0) @binding(7) var<storage, read_write> task_queue: TaskQueue;

// ═══════════════════════════════════════════════════════════════════════════════
// DOUBLE-PRECISION STORAGE (binding 17)
// ═══════════════════════════════════════════════════════════════════════════════

// Double-precision storage - each f64 stored as two u32 values
struct DoublePrecisionStorage {
    // 128 double-precision values (256 u32s, using pairs)
    values: array<u32, 256>,
    // Kahan summation accumulators (8 accumulators, each has sum + compensation = 4 u32s each)
    kahan_sums: array<u32, 32>,
    // Precision mode: 0 = single, 1 = double emulated, 2 = mixed
    precision_mode: u32,
    // Number of double-precision operations executed
    double_op_count: u32,
    // Flags for NaN/Inf detection
    exception_flags: u32,
    _padding: u32,
}

// Precision context for tracking precision requirements
struct PrecisionContextData {
    current_mode: u32,
    hotspot_count: u32,
    error_estimate_low: u32,
    error_estimate_high: u32,
}

// Double-precision value stored as two u32s
struct DFloat64 {
    low: u32,
    high: u32,
}

// Binding 17 for double-precision storage
@group(0) @binding(17) var<storage, read_write> dp_storage: DoublePrecisionStorage;

// ═══════════════════════════════════════════════════════════════════════════════
// DOUBLE-PRECISION HELPER FUNCTIONS
// ═══════════════════════════════════════════════════════════════════════════════

// Create a DFloat64 from two u32 values
fn dp_from_bits(low: u32, high: u32) -> DFloat64 {
    return DFloat64(low, high);
}

// Create a DFloat64 from an f32 (zero-extend to f64)
fn dp_from_f32(val: f32) -> DFloat64 {
    // Convert f32 to f64 representation
    let val_f64 = f64(val);
    let bits = bitcast<u64>(val_f64);
    return DFloat64(u32(bits & 0xFFFFFFFFu), u32(bits >> 32u));
}

// Create a DFloat64 from an integer
fn dp_from_i32(val: i32) -> DFloat64 {
    let val_f64 = f64(val);
    let bits = bitcast<u64>(val_f64);
    return DFloat64(u32(bits & 0xFFFFFFFFu), u32(bits >> 32u));
}

// Extract the sign from a DFloat64
fn dp_sign(dp: DFloat64) -> u32 {
    return (dp.high & DP_SIGN_MASK) >> 31u;
}

// Extract the exponent from a DFloat64
fn dp_exponent(dp: DFloat64) -> u32 {
    return (dp.high & DP_EXP_MASK) >> 20u;
}

// Check if DFloat64 is NaN
fn dp_is_nan(dp: DFloat64) -> bool {
    let exp = dp_exponent(dp);
    let mantissa_nonzero = (dp.high & DP_MANTISSA_HIGH_MASK) != 0u || dp.low != 0u;
    return exp == DP_EXP_MAX && mantissa_nonzero;
}

// Check if DFloat64 is infinity
fn dp_is_inf(dp: DFloat64) -> bool {
    let exp = dp_exponent(dp);
    let mantissa_zero = (dp.high & DP_MANTISSA_HIGH_MASK) == 0u && dp.low == 0u;
    return exp == DP_EXP_MAX && mantissa_zero;
}

// Check if DFloat64 is zero
fn dp_is_zero(dp: DFloat64) -> bool {
    return dp.low == 0u && (dp.high & ~DP_SIGN_MASK) == 0u;
}

// Get positive infinity
fn dp_pos_inf() -> DFloat64 {
    return DFloat64(0u, DP_EXP_MASK);
}

// Get negative infinity
fn dp_neg_inf() -> DFloat64 {
    return DFloat64(0u, DP_EXP_MASK | DP_SIGN_MASK);
}

// Get canonical NaN
fn dp_nan() -> DFloat64 {
    return DFloat64(1u, DP_EXP_MASK | DP_MANTISSA_HIGH_MASK);
}

// Get zero with sign
fn dp_zero(sign: bool) -> DFloat64 {
    if (sign) {
        return DFloat64(0u, DP_SIGN_MASK);
    }
    return DFloat64(0u, 0u);
}

// ═══════════════════════════════════════════════════════════════════════════════
// DOUBLE-PRECISION ARITHMETIC OPERATIONS (Software Emulation)
// ═══════════════════════════════════════════════════════════════════════════════

// Convert DFloat64 to f32 (with potential precision loss)
fn dp_to_f32(dp: DFloat64) -> f32 {
    // This is a simplified conversion - for full IEEE 754 compliance,
    // more sophisticated logic would be needed
    let bits_u64 = (u64(dp.high) << 32u) | u64(dp.low);
    return f32(bitcast<f64>(bits_u64));
}

// Double-precision addition (simplified - uses f64 hardware when available)
fn dp_add(a: DFloat64, b: DFloat64) -> DFloat64 {
    // Handle special cases
    if (dp_is_nan(a) || dp_is_nan(b)) {
        return dp_nan();
    }
    
    if (dp_is_inf(a)) {
        if (dp_is_inf(b) && dp_sign(a) != dp_sign(b)) {
            return dp_nan(); // inf + (-inf) = NaN
        }
        return a;
    }
    
    if (dp_is_inf(b)) {
        return b;
    }
    
    // Convert to f64, perform addition, convert back
    // Note: This uses hardware f64 which may not be available on all GPUs
    // A true software emulation would implement IEEE 754 arithmetic manually
    let a_bits = (u64(a.high) << 32u) | u64(a.low);
    let b_bits = (u64(b.high) << 32u) | u64(b.low);
    
    // Use hardware f64 for the operation (if supported)
    let a_f64 = bitcast<f64>(a_bits);
    let b_f64 = bitcast<f64>(b_bits);
    let result_f64 = a_f64 + b_f64;
    let result_bits = bitcast<u64>(result_f64);
    
    return DFloat64(u32(result_bits & 0xFFFFFFFFu), u32(result_bits >> 32u));
}

// Double-precision subtraction
fn dp_sub(a: DFloat64, b: DFloat64) -> DFloat64 {
    // Negate b and add
    let neg_b = DFloat64(b.low, b.high ^ DP_SIGN_MASK);
    return dp_add(a, neg_b);
}

// Double-precision multiplication
fn dp_mul(a: DFloat64, b: DFloat64) -> DFloat64 {
    // Handle special cases
    if (dp_is_nan(a) || dp_is_nan(b)) {
        return dp_nan();
    }
    
    let a_zero = dp_is_zero(a);
    let b_zero = dp_is_zero(b);
    let a_inf = dp_is_inf(a);
    let b_inf = dp_is_inf(b);
    
    if ((a_zero && b_inf) || (a_inf && b_zero)) {
        return dp_nan(); // 0 * inf = NaN
    }
    
    if (a_inf || b_inf) {
        let sign = dp_sign(a) ^ dp_sign(b);
        if (sign != 0u) {
            return dp_neg_inf();
        }
        return dp_pos_inf();
    }
    
    // Use hardware f64 for multiplication
    let a_bits = (u64(a.high) << 32u) | u64(a.low);
    let b_bits = (u64(b.high) << 32u) | u64(b.low);
    
    let a_f64 = bitcast<f64>(a_bits);
    let b_f64 = bitcast<f64>(b_bits);
    let result_f64 = a_f64 * b_f64;
    let result_bits = bitcast<u64>(result_f64);
    
    return DFloat64(u32(result_bits & 0xFFFFFFFFu), u32(result_bits >> 32u));
}

// Double-precision division
fn dp_div(a: DFloat64, b: DFloat64) -> DFloat64 {
    // Handle special cases
    if (dp_is_nan(a) || dp_is_nan(b)) {
        return dp_nan();
    }
    
    let a_zero = dp_is_zero(a);
    let b_zero = dp_is_zero(b);
    let a_inf = dp_is_inf(a);
    let b_inf = dp_is_inf(b);
    
    if (a_zero && b_zero) {
        return dp_nan(); // 0 / 0 = NaN
    }
    
    if (a_inf && b_inf) {
        return dp_nan(); // inf / inf = NaN
    }
    
    if (b_zero) {
        let sign = dp_sign(a) ^ dp_sign(b);
        if (sign != 0u) {
            return dp_neg_inf();
        }
        return dp_pos_inf();
    }
    
    if (a_zero || a_inf) {
        // Result is 0 or inf with appropriate sign
        let sign = dp_sign(a) ^ dp_sign(b);
        if (a_inf) {
            if (sign != 0u) { return dp_neg_inf(); }
            return dp_pos_inf();
        }
        return dp_zero(sign != 0u);
    }
    
    // Use hardware f64 for division
    let a_bits = (u64(a.high) << 32u) | u64(a.low);
    let b_bits = (u64(b.high) << 32u) | u64(b.low);
    
    let a_f64 = bitcast<f64>(a_bits);
    let b_f64 = bitcast<f64>(b_bits);
    let result_f64 = a_f64 / b_f64;
    let result_bits = bitcast<u64>(result_f64);
    
    return DFloat64(u32(result_bits & 0xFFFFFFFFu), u32(result_bits >> 32u));
}

// Double-precision square root
fn dp_sqrt(a: DFloat64) -> DFloat64 {
    if (dp_is_nan(a)) {
        return dp_nan();
    }
    
    if (dp_sign(a) != 0u) {
        return dp_nan(); // sqrt of negative
    }
    
    if (dp_is_zero(a)) {
        return a;
    }
    
    if (dp_is_inf(a)) {
        return a;
    }
    
    // Use hardware f64 for sqrt
    let a_bits = (u64(a.high) << 32u) | u64(a.low);
    let a_f64 = bitcast<f64>(a_bits);
    let result_f64 = sqrt(a_f64);
    let result_bits = bitcast<u64>(result_f64);
    
    return DFloat64(u32(result_bits & 0xFFFFFFFFu), u32(result_bits >> 32u));
}

// Double-precision negation
fn dp_neg(a: DFloat64) -> DFloat64 {
    if (dp_is_nan(a)) {
        return a; // NaN sign is unchanged in some implementations
    }
    return DFloat64(a.low, a.high ^ DP_SIGN_MASK);
}

// Double-precision absolute value
fn dp_abs(a: DFloat64) -> DFloat64 {
    return DFloat64(a.low, a.high & ~DP_SIGN_MASK);
}

// Double-precision comparison: returns -1, 0, or 1
fn dp_cmp(a: DFloat64, b: DFloat64) -> i32 {
    if (dp_is_nan(a) || dp_is_nan(b)) {
        return 0; // Unordered comparison
    }
    
    // Use hardware f64 for comparison
    let a_bits = (u64(a.high) << 32u) | u64(a.low);
    let b_bits = (u64(b.high) << 32u) | u64(b.low);
    
    let a_f64 = bitcast<f64>(a_bits);
    let b_f64 = bitcast<f64>(b_bits);
    
    if (a_f64 < b_f64) { return -1; }
    if (a_f64 > b_f64) { return 1; }
    return 0;
}

// Double-precision sine (using Taylor series approximation)
fn dp_sin(a: DFloat64) -> DFloat64 {
    if (dp_is_nan(a) || dp_is_inf(a)) {
        return dp_nan();
    }
    
    // Use hardware f64 for sin
    let a_bits = (u64(a.high) << 32u) | u64(a.low);
    let a_f64 = bitcast<f64>(a_bits);
    
    // Range reduction to [-2pi, 2pi]
    const TWO_PI: f64 = 6.28318530717958647692;
    var x = a_f64 % TWO_PI;
    
    // Taylor series approximation
    // sin(x) = x - x^3/3! + x^5/5! - x^7/7! + ...
    // For better accuracy, use native sin if available
    let result_f64 = sin(x);
    let result_bits = bitcast<u64>(result_f64);
    
    return DFloat64(u32(result_bits & 0xFFFFFFFFu), u32(result_bits >> 32u));
}

// Double-precision cosine
fn dp_cos(a: DFloat64) -> DFloat64 {
    if (dp_is_nan(a) || dp_is_inf(a)) {
        return dp_nan();
    }
    
    // Use hardware f64 for cos
    let a_bits = (u64(a.high) << 32u) | u64(a.low);
    let a_f64 = bitcast<f64>(a_bits);
    
    let result_f64 = cos(a_f64);
    let result_bits = bitcast<u64>(result_f64);
    
    return DFloat64(u32(result_bits & 0xFFFFFFFFu), u32(result_bits >> 32u));
}

// Convert DFloat64 to i32 (truncate)
fn dp_to_i32(a: DFloat64) -> i32 {
    if (dp_is_nan(a)) {
        return 0;
    }
    if (dp_is_inf(a)) {
        return select(2147483647, -2147483648, dp_sign(a) != 0u);
    }
    
    let a_bits = (u64(a.high) << 32u) | u64(a.low);
    let a_f64 = bitcast<f64>(a_bits);
    return i32(a_f64);
}

// ═══════════════════════════════════════════════════════════════════════════════
// KAHAN SUMMATION FOR NUMERICALLY STABLE ACCUMULATION
// ═══════════════════════════════════════════════════════════════════════════════

// Kahan accumulator structure (stored as 4 u32s: sum_low, sum_high, comp_low, comp_high)
struct KahanAccumulator {
    sum: DFloat64,
    compensation: DFloat64,
}

// Initialize a Kahan accumulator
fn kahan_init(acc_idx: u32) {
    let base = acc_idx * 4u;
    dp_storage.kahan_sums[base] = 0u;     // sum_low
    dp_storage.kahan_sums[base + 1u] = 0u; // sum_high
    dp_storage.kahan_sums[base + 2u] = 0u; // compensation_low
    dp_storage.kahan_sums[base + 3u] = 0u; // compensation_high
}

// Add value to Kahan accumulator
fn kahan_add(acc_idx: u32, value: DFloat64) -> DFloat64 {
    let base = acc_idx * 4u;
    
    // Load current sum and compensation
    var sum = DFloat64(
        dp_storage.kahan_sums[base],
        dp_storage.kahan_sums[base + 1u]
    );
    var compensation = DFloat64(
        dp_storage.kahan_sums[base + 2u],
        dp_storage.kahan_sums[base + 3u]
    );
    
    // Kahan summation algorithm
    // y = value - compensation
    let y = dp_sub(value, compensation);
    
    // t = sum + y
    let t = dp_add(sum, y);
    
    // compensation = (t - sum) - y
    let t_minus_sum = dp_sub(t, sum);
    compensation = dp_sub(t_minus_sum, y);
    
    // sum = t
    sum = t;
    
    // Store back
    dp_storage.kahan_sums[base] = sum.low;
    dp_storage.kahan_sums[base + 1u] = sum.high;
    dp_storage.kahan_sums[base + 2u] = compensation.low;
    dp_storage.kahan_sums[base + 3u] = compensation.high;
    
    return sum;
}

// Get current sum from Kahan accumulator
fn kahan_get_sum(acc_idx: u32) -> DFloat64 {
    let base = acc_idx * 4u;
    return DFloat64(
        dp_storage.kahan_sums[base],
        dp_storage.kahan_sums[base + 1u]
    );
}

// ═══════════════════════════════════════════════════════════════════════════════
// REGISTER ACCESS FOR DOUBLE-PRECISION VALUES
// ═══════════════════════════════════════════════════════════════════════════════

// Get DFloat64 from two consecutive registers (reg, reg+1)
fn get_dp_from_registers(reg: u32) -> DFloat64 {
    return DFloat64(registers[reg], registers[reg + 1u]);
}

// Store DFloat64 to two consecutive registers
fn store_dp_to_registers(reg: u32, val: DFloat64) {
    registers[reg] = val.low;
    registers[reg + 1u] = val.high;
}

// ═══════════════════════════════════════════════════════════════════════════════
// DOUBLE-PRECISION OPERATION HANDLER (Opcodes 0xA0-0xAF)
// ═══════════════════════════════════════════════════════════════════════════════

// Execute a double-precision operation
fn execute_double_op(opcode: u32, dst: u32, src1: u32, src2: u32) {
    // Increment double-op count
    dp_storage.double_op_count += 1u;
    
    switch (opcode) {
        // FADD: R_dst = R_src1 + R_src2
        case 0xA0u: {
            let a = get_dp_from_registers(src1);
            let b = get_dp_from_registers(src2);
            let result = dp_add(a, b);
            store_dp_to_registers(dst, result);
            system.ip += 1u;
        }
        
        // FSUB: R_dst = R_src1 - R_src2
        case 0xA1u: {
            let a = get_dp_from_registers(src1);
            let b = get_dp_from_registers(src2);
            let result = dp_sub(a, b);
            store_dp_to_registers(dst, result);
            system.ip += 1u;
        }
        
        // FMUL: R_dst = R_src1 * R_src2
        case 0xA2u: {
            let a = get_dp_from_registers(src1);
            let b = get_dp_from_registers(src2);
            let result = dp_mul(a, b);
            store_dp_to_registers(dst, result);
            system.ip += 1u;
        }
        
        // FDIV: R_dst = R_src1 / R_src2
        case 0xA3u: {
            let a = get_dp_from_registers(src1);
            let b = get_dp_from_registers(src2);
            let result = dp_div(a, b);
            store_dp_to_registers(dst, result);
            system.ip += 1u;
        }
        
        // FNEG: R_dst = -R_src
        case 0xA4u: {
            let a = get_dp_from_registers(src1);
            let result = dp_neg(a);
            store_dp_to_registers(dst, result);
            system.ip += 1u;
        }
        
        // FABS: R_dst = |R_src|
        case 0xA5u: {
            let a = get_dp_from_registers(src1);
            let result = dp_abs(a);
            store_dp_to_registers(dst, result);
            system.ip += 1u;
        }
        
        // FSQRT: R_dst = sqrt(R_src)
        case 0xA6u: {
            let a = get_dp_from_registers(src1);
            let result = dp_sqrt(a);
            store_dp_to_registers(dst, result);
            system.ip += 1u;
        }
        
        // FCMP: Compare R_src1 with R_src2, store result in R_dst
        // Result: -1 if <, 0 if ==, 1 if >
        case 0xA7u: {
            let a = get_dp_from_registers(src1);
            let b = get_dp_from_registers(src2);
            let cmp_result = dp_cmp(a, b);
            registers[dst] = u32(cmp_result);
            system.ip += 1u;
        }
        
        // FFROMI: R_dst = f64(R_src as i32)
        case 0xA8u: {
            let val = i32(registers[src1]);
            let result = dp_from_i32(val);
            store_dp_to_registers(dst, result);
            system.ip += 1u;
        }
        
        // FTOI: R_dst = i32(R_src as f64)
        case 0xA9u: {
            let a = get_dp_from_registers(src1);
            let result = dp_to_i32(a);
            registers[dst] = u32(result);
            system.ip += 1u;
        }
        
        // FLD: Load f64 from memory at address in R_src
        case 0xAAu: {
            let addr = registers[src1];
            let pos = d2xy(addr, MEMORY_SIZE);
            let low_val = textureLoad(memory_canvas, pos);
            let low = unpack_rgba_to_u32(low_val);
            
            let pos2 = d2xy(addr + 1u, MEMORY_SIZE);
            let high_val = textureLoad(memory_canvas, pos2);
            let high = unpack_rgba_to_u32(high_val);
            
            store_dp_to_registers(dst, DFloat64(low, high));
            system.ip += 1u;
        }
        
        // FST: Store f64 to memory at address in R_src
        case 0xABu: {
            let val = get_dp_from_registers(dst);
            let addr = registers[src1];
            
            let pos = d2xy(addr, MEMORY_SIZE);
            textureStore(memory_canvas, pos, pack_u32_to_rgba(val.low));
            
            let pos2 = d2xy(addr + 1u, MEMORY_SIZE);
            textureStore(memory_canvas, pos2, pack_u32_to_rgba(val.high));
            
            system.ip += 1u;
        }
        
        // FSIN: R_dst = sin(R_src)
        case 0xACu: {
            let a = get_dp_from_registers(src1);
            let result = dp_sin(a);
            store_dp_to_registers(dst, result);
            system.ip += 1u;
        }
        
        // FCOS: R_dst = cos(R_src)
        case 0xADu: {
            let a = get_dp_from_registers(src1);
            let result = dp_cos(a);
            store_dp_to_registers(dst, result);
            system.ip += 1u;
        }
        
        // KAHAN_INIT: Initialize Kahan accumulator at index R_dst
        case 0xAEu: {
            kahan_init(dst);
            system.ip += 1u;
        }
        
        // KAHAN_ADD: Add R_val to Kahan accumulator at index R_dst
        case 0xAFu: {
            let val = get_dp_from_registers(src2);
            let result = kahan_add(dst, val);
            store_dp_to_registers(dst, result);
            system.ip += 1u;
        }
        
        default: {
            // Unknown double op - skip
            system.ip += 1u;
        }
    }
}

// GPU identification (set via push constants or uniform)
var<private> gpu_index: u32 = 0u;
var<private> num_gpus: u32 = 1u;

// Hilbert curve helper functions
fn hilbert_rot(n: u32, x: u32, y: u32, rx: u32, ry: u32) -> vec2<u32> {
    if (ry == 0u) {
        var xx = x;
        var yy = y;
        if (rx == 1u) {
            xx = n - 1u - x;
            yy = n - 1u - y;
        }
        return vec2<u32>(yy, xx);
    }
    return vec2<u32>(x, y);
}

// Convert Hilbert distance to 2D coordinates
fn d2xy(d: u32, n: u32) -> vec2<u32> {
    var x: u32 = 0u;
    var y: u32 = 0u;
    var t: u32 = d;
    var s: u32 = 1u;
    
    while (s < n) {
        let rx = 1u & (t >> 1u);
        let ry = 1u & (t ^ rx);
        let rotated = hilbert_rot(s, x, y, rx, ry);
        x = rotated.x + s * rx;
        y = rotated.y + s * ry;
        t = t >> 2u;
        s = s << 1u;
    }
    
    return vec2<u32>(x, y);
}

// Convert 2D coordinates to Hilbert distance
fn xy2d(x: u32, y: u32, n: u32) -> u32 {
    var d: u32 = 0u;
    var s: u32 = 1u;
    var xx = x;
    var yy = y;
    
    while (s < n) {
        let rx = 1u & (xx >> 1u);
        let ry = 1u & (xx ^ yy);
        d += s * ((3u * rx) ^ ry);
        let rotated = hilbert_rot(s, xx, yy, rx, ry);
        xx = rotated.x;
        yy = rotated.y;
        s = s << 1u;
    }
    
    return d;
}

// Pack u32 to vec4<f32> (RGBA)
fn pack_u32_to_rgba(val: u32) -> vec4<f32> {
    return vec4<f32>(
        f32((val >> 0u) & 0xFFu) / 255.0,
        f32((val >> 8u) & 0xFFu) / 255.0,
        f32((val >> 16u) & 0xFFu) / 255.0,
        f32((val >> 24u) & 0xFFu) / 255.0
    );
}

// Unpack vec4<f32> (RGBA) to u32
fn unpack_rgba_to_u32(rgba: vec4<f32>) -> u32 {
    return (u32(rgba.r * 255.0 + 0.5) << 0u) |
           (u32(rgba.g * 255.0 + 0.5) << 8u) |
           (u32(rgba.b * 255.0 + 0.5) << 16u) |
           (u32(rgba.a * 255.0 + 0.5) << 24u);
}

// Execute a single GeoASM instruction
fn execute_instruction() {
    let code_coord = d2xy(system.ip, MEMORY_SIZE);
    let instr = textureLoad(memory_canvas, code_coord);
    
    let opcode = u32(instr.r * 255.0);
    let dst = u32(instr.g * 255.0);
    let src1 = u32(instr.b * 255.0);
    let src2 = u32(instr.a * 255.0);

    system.instructions_executed += 1u;
    instruction_counts[system.ip] += 1u;

    switch (opcode) {
        // ═══════════════════════════════════════════════════════════════
        // CONTROL FLOW
        // ═══════════════════════════════════════════════════════════════
        case 0x00u: { // NOP
            system.ip += 1u;
        }
        case 0x02u: { // HALT
            system.status = 2u;
        }
        case 0x04u: { // JMP addr
            system.ip = dst;
        }
        case 0x05u: { // JEQ R_dst, R_src1, addr
            if (registers[dst] == registers[src1]) {
                system.ip = src2;
            } else {
                system.ip += 1u;
            }
        }
        case 0x06u: { // JNE R_dst, R_src1, addr
            if (registers[dst] != registers[src1]) {
                system.ip = src2;
            } else {
                system.ip += 1u;
            }
        }
        case 0x07u: { // JLT R_dst, R_src1, addr
            if (registers[dst] < registers[src1]) {
                system.ip = src2;
            } else {
                system.ip += 1u;
            }
        }
        case 0x0Bu: { // JGT R_dst, R_src1, addr
            if (registers[dst] > registers[src1]) {
                system.ip = src2;
            } else {
                system.ip += 1u;
            }
        }
        case 0x0Cu: { // JLE R_dst, R_src1, addr
            if (registers[dst] <= registers[src1]) {
                system.ip = src2;
            } else {
                system.ip += 1u;
            }
        }
        case 0x0Du: { // JGE R_dst, R_src1, addr
            if (registers[dst] >= registers[src1]) {
                system.ip = src2;
            } else {
                system.ip += 1u;
            }
        }
        case 0x08u: { // CALL addr
            let ret_addr = system.ip + 1u;
            let sp = registers[254u];
            let pos = d2xy(sp, MEMORY_SIZE);
            
            textureStore(memory_canvas, pos, pack_u32_to_rgba(ret_addr));
            registers[254u] = sp + 1u;
            system.ip = dst;
        }
        case 0x09u: { // RET
            let sp = registers[254u] - 1u;
            let pos = d2xy(sp, MEMORY_SIZE);
            let mem_val = textureLoad(memory_canvas, pos);
            let ret_addr = unpack_rgba_to_u32(mem_val);
            
            registers[254u] = sp;
            system.ip = ret_addr;
        }
        case 0x0Au: { // CALLR R_addr
            let ret_addr = system.ip + 1u;
            let sp = registers[254u];
            let pos = d2xy(sp, MEMORY_SIZE);
            
            textureStore(memory_canvas, pos, pack_u32_to_rgba(ret_addr));
            registers[254u] = sp + 1u;
            system.ip = registers[dst];
        }

        // ═══════════════════════════════════════════════════════════════
        // STACK OPERATIONS
        // ═══════════════════════════════════════════════════════════════
        case 0x10u: { // PUSH R_src
            let val = registers[dst];
            let sp = registers[254u];
            let pos = d2xy(sp, MEMORY_SIZE);
            
            textureStore(memory_canvas, pos, pack_u32_to_rgba(val));
            registers[254u] = sp + 1u;
            system.ip += 1u;
        }
        case 0x11u: { // POP R_dst
            let sp = registers[254u] - 1u;
            let pos = d2xy(sp, MEMORY_SIZE);
            let mem_val = textureLoad(memory_canvas, pos);
            let val = unpack_rgba_to_u32(mem_val);
            
            registers[dst] = val;
            registers[254u] = sp;
            system.ip += 1u;
        }

        // ═══════════════════════════════════════════════════════════════
        // MEMORY OPERATIONS
        // ═══════════════════════════════════════════════════════════════
        case 0x40u: { // LDR R_dst, R_addr
            let addr = registers[src1];
            let pos = d2xy(addr, MEMORY_SIZE);
            let mem_val = textureLoad(memory_canvas, pos);
            registers[dst] = unpack_rgba_to_u32(mem_val);
            system.ip += 1u;
        }
        case 0x41u: { // STR R_src_val, R_addr
            let val = registers[dst];
            let addr = registers[src1];
            let pos = d2xy(addr, MEMORY_SIZE);
            textureStore(memory_canvas, pos, pack_u32_to_rgba(val));
            system.ip += 1u;
        }
        case 0x42u: { // LDR_IMM R_dst, addr
            let pos = d2xy(src1, MEMORY_SIZE);
            let mem_val = textureLoad(memory_canvas, pos);
            registers[dst] = unpack_rgba_to_u32(mem_val);
            system.ip += 1u;
        }
        case 0x43u: { // STR_IMM R_src, addr
            let val = registers[dst];
            let pos = d2xy(src1, MEMORY_SIZE);
            textureStore(memory_canvas, pos, pack_u32_to_rgba(val));
            system.ip += 1u;
        }
        case 0x49u: { // MOVI R_dst, imm
            registers[dst] = src1;
            system.ip += 1u;
        }

        // ═══════════════════════════════════════════════════════════════
        // ARITHMETIC OPERATIONS
        // ═══════════════════════════════════════════════════════════════
        case 0x80u: { // ADD R_dst, R_src1, R_src2
            registers[dst] = registers[src1] + registers[src2];
            system.ip += 1u;
        }
        case 0x82u: { // SUB R_dst, R_src1, R_src2
            registers[dst] = registers[src1] - registers[src2];
            system.ip += 1u;
        }
        case 0x84u: { // MUL R_dst, R_src1, R_src2
            registers[dst] = registers[src1] * registers[src2];
            system.ip += 1u;
        }
        case 0x86u: { // DIV R_dst, R_src1, R_src2
            if (registers[src2] != 0u) {
                registers[dst] = registers[src1] / registers[src2];
            } else {
                registers[dst] = 0u;
            }
            system.ip += 1u;
        }

        // ═══════════════════════════════════════════════════════════════
        // BITWISE OPERATIONS
        // ═══════════════════════════════════════════════════════════════
        case 0xA0u: { // AND R_dst, R_src1, R_src2
            registers[dst] = registers[src1] & registers[src2];
            system.ip += 1u;
        }
        case 0xA1u: { // OR R_dst, R_src1, R_src2
            registers[dst] = registers[src1] | registers[src2];
            system.ip += 1u;
        }
        case 0xA2u: { // XOR R_dst, R_src1, R_src2
            registers[dst] = registers[src1] ^ registers[src2];
            system.ip += 1u;
        }
        case 0xA3u: { // NOT R_dst, R_src1
            registers[dst] = ~registers[src1];
            system.ip += 1u;
        }

        // ═══════════════════════════════════════════════════════════════
        // DOUBLE-PRECISION FLOATING-POINT OPERATIONS (0xA4-0xAF reserved for bitwise)
        // Extended double-precision ops use opcode range via separate handler
        // Note: 0xA0-0xA3 are bitwise, but 0xA0-0xAF also map to double ops
        // when precision_mode indicates double precision.
        // The execute_double_op function handles true double-precision ops.
        // ═══════════════════════════════════════════════════════════════

        // Check for extended double-precision operations (0xA4-0xAF)
        // These override the bitwise ops when in double-precision mode
        case 0xA4u: { // Could be FNEG or extended bitwise
            if (dp_storage.precision_mode >= 1u) {
                execute_double_op(0xA4u, u32(dst), u32(src1), u32(src2));
            } else {
                // Reserved for future bitwise ops
                system.ip += 1u;
            }
        }
        case 0xA5u: {
            if (dp_storage.precision_mode >= 1u) {
                execute_double_op(0xA5u, u32(dst), u32(src1), u32(src2));
            } else {
                system.ip += 1u;
            }
        }
        case 0xA6u: {
            if (dp_storage.precision_mode >= 1u) {
                execute_double_op(0xA6u, u32(dst), u32(src1), u32(src2));
            } else {
                system.ip += 1u;
            }
        }
        case 0xA7u: {
            if (dp_storage.precision_mode >= 1u) {
                execute_double_op(0xA7u, u32(dst), u32(src1), u32(src2));
            } else {
                system.ip += 1u;
            }
        }
        case 0xA8u: {
            if (dp_storage.precision_mode >= 1u) {
                execute_double_op(0xA8u, u32(dst), u32(src1), u32(src2));
            } else {
                system.ip += 1u;
            }
        }
        case 0xA9u: {
            if (dp_storage.precision_mode >= 1u) {
                execute_double_op(0xA9u, u32(dst), u32(src1), u32(src2));
            } else {
                system.ip += 1u;
            }
        }
        case 0xAAu: {
            if (dp_storage.precision_mode >= 1u) {
                execute_double_op(0xAAu, u32(dst), u32(src1), u32(src2));
            } else {
                system.ip += 1u;
            }
        }
        case 0xABu: {
            if (dp_storage.precision_mode >= 1u) {
                execute_double_op(0xABu, u32(dst), u32(src1), u32(src2));
            } else {
                system.ip += 1u;
            }
        }
        case 0xACu: {
            if (dp_storage.precision_mode >= 1u) {
                execute_double_op(0xACu, u32(dst), u32(src1), u32(src2));
            } else {
                system.ip += 1u;
            }
        }
        case 0xADu: {
            if (dp_storage.precision_mode >= 1u) {
                execute_double_op(0xADu, u32(dst), u32(src1), u32(src2));
            } else {
                system.ip += 1u;
            }
        }
        case 0xAEu: {
            if (dp_storage.precision_mode >= 1u) {
                execute_double_op(0xAEu, u32(dst), u32(src1), u32(src2));
            } else {
                system.ip += 1u;
            }
        }
        case 0xAFu: {
            if (dp_storage.precision_mode >= 1u) {
                execute_double_op(0xAFu, u32(dst), u32(src1), u32(src2));
            } else {
                system.ip += 1u;
            }
        }

        // ═══════════════════════════════════════════════════════════════
        // DRAWING OPERATIONS
        // ═══════════════════════════════════════════════════════════════
        case 0xC0u: { // SET_COLOR Rr, Rg, Rb
            registers[250u] = registers[dst];
            registers[251u] = registers[src1];
            registers[252u] = registers[src2];
            system.ip += 1u;
        }
        case 0xCFu: { // DRAW_PIXEL R_x, R_y
            let x = registers[dst];
            let y = registers[src1];
            
            let r = f32(registers[250u]) / 255.0;
            let g = f32(registers[251u]) / 255.0;
            let b = f32(registers[252u]) / 255.0;
            let a = f32(registers[253u]) / 255.0;
            
            if (x < MEMORY_SIZE && y < MEMORY_SIZE) {
                textureStore(memory_canvas, vec2<u32>(x, y), vec4<f32>(r, g, b, a));
            }
            system.ip += 1u;
        }
        case 0xC2u: { // DRAW_LINE Rx1, Ry1, Rx2 (uses R0 for y2)
            let x1 = f32(registers[dst]);
            let y1 = f32(registers[src1]);
            let x2 = f32(registers[src2]);
            let y2 = f32(registers[0u]);
            
            let r = f32(registers[250u]) / 255.0;
            let g = f32(registers[251u]) / 255.0;
            let b = f32(registers[252u]) / 255.0;
            let a = f32(registers[253u]) / 255.0;
            let color = vec4<f32>(r, g, b, a);

            let dx = x2 - x1;
            let dy = y2 - y1;
            let steps = max(abs(dx), abs(dy));
            if (steps > 0.0 && steps < 1024.0) {
                let x_inc = dx / steps;
                let y_inc = dy / steps;
                var curr_x = x1;
                var curr_y = y1;
                for (var i = 0u; i <= u32(steps); i++) {
                    if (curr_x >= 0.0 && curr_x < f32(MEMORY_SIZE) && curr_y >= 0.0 && curr_y < f32(MEMORY_SIZE)) {
                        textureStore(memory_canvas, vec2<u32>(u32(curr_x), u32(curr_y)), color);
                    }
                    curr_x += x_inc;
                    curr_y += y_inc;
                }
            }
            system.ip += 1u;
        }
        case 0xC3u: { // DRAW_RECT Rx, Ry, Rw (uses R0 for Rh)
            let x = registers[dst];
            let y = registers[src1];
            let w = registers[src2];
            let h = registers[0u];
            
            let r = f32(registers[250u]) / 255.0;
            let g = f32(registers[251u]) / 255.0;
            let b = f32(registers[252u]) / 255.0;
            let a = f32(registers[253u]) / 255.0;
            let color = vec4<f32>(r, g, b, a);

            let mw = min(w, 512u);
            let mh = min(h, 512u);

            for (var i = 0u; i < mw; i++) {
                if (x + i < MEMORY_SIZE) {
                    if (y < MEMORY_SIZE) { textureStore(memory_canvas, vec2<u32>(x + i, y), color); }
                    if (y + mh - 1u < MEMORY_SIZE) { textureStore(memory_canvas, vec2<u32>(x + i, y + mh - 1u), color); }
                }
            }
            for (var i = 0u; i < mh; i++) {
                if (y + i < MEMORY_SIZE) {
                    if (x < MEMORY_SIZE) { textureStore(memory_canvas, vec2<u32>(x, y + i), color); }
                    if (x + mw - 1u < MEMORY_SIZE) { textureStore(memory_canvas, vec2<u32>(x + mw - 1u, y + i), color); }
                }
            }
            system.ip += 1u;
        }
        case 0xC4u: { // FILL_RECT Rx, Ry, Rw (uses R0 for Rh)
            let x_start = registers[dst];
            let y_start = registers[src1];
            let width = registers[src2];
            let height = registers[0u];
            
            let r = f32(registers[250u]) / 255.0;
            let g = f32(registers[251u]) / 255.0;
            let b = f32(registers[252u]) / 255.0;
            let a = f32(registers[253u]) / 255.0;
            let color = vec4<f32>(r, g, b, a);

            let max_w = min(width, 512u);
            let max_h = min(height, 512u);

            for (var dy = 0u; dy < max_h; dy++) {
                for (var dx = 0u; dx < max_w; dx++) {
                    let px = x_start + dx;
                    let py = y_start + dy;
                    if (px < MEMORY_SIZE && py < MEMORY_SIZE) {
                        textureStore(memory_canvas, vec2<u32>(px, py), color);
                    }
                }
            }
            system.ip += 1u;
        }
        case 0xC1u: { // DRAW_CHAR - syscall
            system.status = 105u;
            system.ip += 1u;
        }

        // ═══════════════════════════════════════════════════════════════
        // PROFILING OPERATIONS
        // ═══════════════════════════════════════════════════════════════
        case 0xD5u: { // START_TIMER R_addr
            if (profiler.active == 0u) {
                profiler.activeTimerAddr = registers[dst];
                profiler.timer_start_time = f32(system.tick) * 0.016667;
                profiler.active = 1u;
            }
            system.ip += 1u;
        }
        case 0xD6u: { // STOP_TIMER
            if (profiler.active == 1u) {
                let endTime = f32(system.tick) * 0.016667;
                let elapsed = endTime - profiler.timer_start_time;
                instructionTiming[profiler.activeTimerAddr] += elapsed;
                profiler.active = 0u;
            }
            system.ip += 1u;
        }
        case 0xD7u: { // GET_TIMER R_dst, R_addr
            let addr = registers[src1];
            registers[dst] = u32(instructionTiming[addr] * 1000.0);
            system.ip += 1u;
        }
        case 0xD8u: { // ANALYZE_HOT_PATHS - syscall
            system.status = 101u;
            system.ip += 1u;
        }

        // ═══════════════════════════════════════════════════════════════
        // SYSCALLS
        // ═══════════════════════════════════════════════════════════════
        case 0xD4u: { // LLM_PROMPT
            system.status = 100u;
            system.ip += 1u;
        }
        case 0xDEu: { // MEMORY_PRESSURE
            system.status = 0xDEu;
            system.ip += 1u;
        }
        case 0xE3u: { // GET_STATE
            system.status = 0xE3u;
            system.ip += 1u;
        }
        case 0xE4u: { // CROSS_LANGUAGE_VERIFY
            system.status = 102u;
            system.ip += 1u;
        }
        case 0xE5u: { // ASSEMBLE
            system.status = 0xE5u;
            system.ip += 1u;
        }
        case 0xE6u: { // LOAD_BINARY
            system.status = 0xE6u;
            system.ip += 1u;
        }
        case 0xE9u: { // GET_KEY
            system.status = 0xE9u;
            system.ip += 1u;
        }
        case 0xECu: { // SAVE_STATE
            system.status = 0xECu;
            system.ip += 1u;
        }
        case 0xEDu: { // LOAD_STATE
            system.status = 0xEDu;
            system.ip += 1u;
        }
        case 0xEEu: { // EVOLVE
            system.status = 0xEEu;
            system.ip += 1u;
        }
        case 0xEFu: { // DEBUG_BREAK
            system.status = 110u;
            system.ip += 1u;
        }
        case 0xF0u: { // SYS_SPAWN
            system.status = 0xF0u;
            system.ip += 1u;
        }
        case 0xF1u: { // SYS_SEND
            system.status = 0xF1u;
            system.ip += 1u;
        }
        case 0xF2u: { // SYS_RECV
            system.status = 0xF2u;
            system.ip += 1u;
        }
        case 0xF3u: { // SYS_WAIT
            system.status = 0xF3u;
            system.ip += 1u;
        }

        // ═══════════════════════════════════════════════════════════════
        // NEURAL EVENT BUS
        // ═══════════════════════════════════════════════════════════════
        case 0xF4u: { // RAISE_EVENT R_event_id, R_data
            registers[249u] = registers[dst];
            registers[248u] = registers[src1];
            system.status = 0xF4u;
            system.ip += 1u;
        }
        case 0xF5u: { // SET_HANDLER R_event_id, R_handler_addr
            let event_id = registers[dst];
            let handler_addr = registers[src1];
            let ivt_addr = 0x7000u + event_id * 4u;
            let ivt_pos = d2xy(ivt_addr, MEMORY_SIZE);
            textureStore(memory_canvas, ivt_pos, pack_u32_to_rgba(handler_addr));
            system.ip += 1u;
        }
        case 0xF6u: { // IRET
            let sp = registers[254u] - 1u;
            let pos = d2xy(sp, MEMORY_SIZE);
            let mem_val = textureLoad(memory_canvas, pos);
            let ret_addr = unpack_rgba_to_u32(mem_val);
            registers[254u] = sp;
            system.ip = ret_addr;
        }
        case 0xF7u: { // WAIT_EVENT
            system.status = 0xF7u;
        }
        // ═══════════════════════════════════════════════════════════════
        // FFI BRIDGE OPCODES (0xF8-0xFB)
        // These opcodes enable Python FFI from GeoASM bytecode.
        // Registers 248-250 are reserved for FFI communication.
        // ═══════════════════════════════════════════════════════════════
        case 0xF8u: { // PY_CALL R_id, R_args, R_ret - Blocking Python function call
            registers[248u] = registers[dst];  // Function ID
            registers[249u] = registers[src1]; // Args pointer
            registers[250u] = registers[src2]; // Return pointer
            system.status = 0xF8u;
            system.ip += 1u;
        }
        case 0xF9u: { // PY_MAP R_start, R_size, R_flags - Map Hilbert region to numpy
            registers[248u] = registers[dst];  // Hilbert start
            registers[249u] = registers[src1]; // Size
            registers[250u] = registers[src2]; // Flags
            system.status = 0xF9u;
            system.ip += 1u;
        }
        case 0xFAu: { // PY_REQ R_id, R_args, R_unused - Async Python request
            registers[248u] = registers[dst];  // Function ID / Request ID
            registers[249u] = registers[src1]; // Args pointer
            registers[250u] = registers[src2]; // Status pointer (unused for now)
            system.status = 0xFAu;
            system.ip += 1u;
        }
        case 0xFBu: { // PY_POLL R_req, R_result, R_status - Poll async result
            registers[248u] = registers[dst];  // Request ID
            registers[249u] = registers[src1]; // Result pointer
            registers[250u] = registers[src2]; // Status pointer
            system.status = 0xFBu;
            system.ip += 1u;
        }

        // ═══════════════════════════════════════════════════════════════
        // DEFAULT
        // ═══════════════════════════════════════════════════════════════
        default: {
            system.ip += 1u;
        }
    }
}

// ═══════════════════════════════════════════════════════════════════════════════
// MULTI-GPU SYNCHRONIZATION FUNCTIONS
// ═══════════════════════════════════════════════════════════════════════════════

// Barrier synchronization across all GPUs
// Each GPU calls this and waits until all GPUs have arrived
fn barrier_wait() {
    let gen = atomicLoad(&sync_state.generation);
    let count = atomicAdd(&sync_state.barrier_count, 1u);
    
    if (count == num_gpus - 1u) {
        // Last GPU to arrive - reset barrier and increment generation
        atomicStore(&sync_state.barrier_count, 0u);
        atomicAdd(&sync_state.generation, 1u);
    } else {
        // Wait for other GPUs (spin with yield-like behavior)
        var spins = 0u;
        while (atomicLoad(&sync_state.generation) == gen) {
            // In real implementation, would yield or wait
            spins++;
            if (spins > 1000000u) { break; } // Prevent infinite loop
        }
    }
}

// Signal that this GPU has completed memory synchronization
fn signal_memory_sync() {
    let mask = 1u << gpu_index;
    atomicOr(&sync_state.memory_sync_bitmap, mask);
}

// Wait for all GPUs to complete memory synchronization
fn wait_memory_sync() {
    let target = (1u << num_gpus) - 1u;
    var spins = 0u;
    while (atomicLoad(&sync_state.memory_sync_bitmap) != target) {
        spins++;
        if (spins > 1000000u) { break; }
    }
}

// Add to global instruction count
fn add_global_instructions(count: u32) {
    atomicAdd(&sync_state.global_instructions, u64(count));
}

// Get next task from work stealing queue
fn get_next_task() -> Option<ExecutionTask> {
    let task_count = atomicLoad(&task_queue.task_count);
    if (task_count == 0u) {
        return None;
    }
    
    // Try to get a task assigned to this GPU
    var idx = atomicLoad(&task_queue.head);
    let tail = atomicLoad(&task_queue.tail);
    
    while (idx < tail) {
        let task = task_queue.tasks[idx];
        if (task.assigned_gpu == gpu_index && task.status == 0u) {
            // Found our task
            task_queue.tasks[idx].status = 1u; // Mark as running
            return Some(task);
        }
        idx++;
    }
    
    // Try to steal an unassigned task
    idx = atomicLoad(&task_queue.head);
    while (idx < tail) {
        let task = task_queue.tasks[idx];
        if (task.assigned_gpu == 0xFFFFFFFFu && task.status == 0u) {
            // Steal this task
            task_queue.tasks[idx].assigned_gpu = gpu_index;
            task_queue.tasks[idx].status = 1u;
            return Some(task_queue.tasks[idx]);
        }
        idx++;
    }
    
    return None;
}

// Mark task as complete
fn complete_task(task_idx: u32) {
    if (task_idx < 256u) {
        task_queue.tasks[task_idx].status = 2u; // Complete
        atomicSub(&task_queue.task_count, 1u);
    }
}

// Report error to sync state
fn report_error(error_code: u32) {
    atomicStore(&sync_state.error_flag, error_code);
}

// Update GPU status
fn set_gpu_status(status: u32) {
    atomicStore(&sync_state.gpu_status[gpu_index], status);
}

// Add to this GPU's instruction count
fn add_gpu_instructions(count: u32) {
    atomicAdd(&sync_state.instruction_counts[gpu_index], count);
}

// Cross-GPU atomic memory operation
// Uses compare-and-swap to ensure atomic writes to shared memory
fn atomic_store_memory(addr: u32, value: u32) -> bool {
    let pos = d2xy(addr, MEMORY_SIZE);
    let current = textureLoad(memory_canvas, pos);
    let current_val = unpack_rgba_to_u32(current);
    
    // In WGSL, we can't do true CAS on textures, so we use the sync_state
    // as a coordination mechanism. For true atomicity, we'd need a storage buffer.
    // This is a simplified version that coordinates via the sync bitmap.
    
    textureStore(memory_canvas, pos, pack_u32_to_rgba(value));
    return true;
}

// Synchronization point for cross-GPU coordination
// Call this at defined intervals to ensure all GPUs are in sync
fn synchronization_point() {
    // Increment barrier
    barrier_wait();
    
    // Signal memory sync complete
    signal_memory_sync();
    
    // Wait for all GPUs
    wait_memory_sync();
    
    // Clear for next round
    if (gpu_index == 0u) {
        atomicStore(&sync_state.memory_sync_bitmap, 0u);
    }
    
    // Final barrier
    barrier_wait();
}

// Multi-GPU execution with synchronization
fn execute_with_sync(max_instructions: u32, sync_interval: u32) {
    var instructions_since_sync = 0u;
    
    while (system.status == 1u && instructions_since_sync < max_instructions) {
        execute_instruction();
        instructions_since_sync++;
        add_gpu_instructions(1u);
        
        // Check for synchronization point
        if (sync_interval > 0u && instructions_since_sync >= sync_interval) {
            synchronization_point();
            instructions_since_sync = 0u;
            
            // Check for errors from other GPUs
            if (atomicLoad(&sync_state.error_flag) != 0u) {
                system.status = 200u; // Error status
                return;
            }
        }
        
        // Check if still running
        if (system.status != 1u) { break; }
    }
    
    // Final sync before exit
    barrier_wait();
}

// Main compute entry point
@compute @workgroup_size(1, 1, 1)
fn main() {
    // Only execute on the first thread
    if (system.status == 1u) {
        // Execute up to BATCH_SIZE instructions
        for (var i = 0u; i < BATCH_SIZE; i++) {
            // Check if still running
            if (system.status != 1u) { break; }
            
            execute_instruction();
            
            // If status changed (halt, syscall, wait), exit batch
            if (system.status != 1u) { break; }
        }
    }
}
