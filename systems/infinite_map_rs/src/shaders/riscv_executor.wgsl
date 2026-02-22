// ============================================
// RISC-V EXECUTOR - GPU-Based RISC-V VM
// ============================================
// This shader implements a RISC-V RV32I emulator in WGSL
// It extends the Pixel CPU architecture with full RISC-V support
//
// Architecture:
// - Each pixel represents 4 bytes of RAM (RGBA = 4 x u8)
// - RISC-V instructions are fetched from RAM texture
// - 32 x 32-bit registers (x0-x31) stored in RAM
// - Program counter tracks execution
// - Privilege modes: User (U), Supervisor (S), Machine (M)

// ============================================
// Constants
// ============================================

const TEXTURE_SIZE: u32 = 256u;
const REGISTER_BASE: u32 = 0u;        // Registers start at address 0
const REGISTER_COUNT: u32 = 32u;      // 32 RISC-V registers
const REGISTER_SIZE: u32 = 4u;        // 4 bytes per register (32-bit)
const MEMORY_BASE: u32 = 128u;        // Memory starts after registers (32 regs * 4 bytes = 128)

// RISC-V opcodes
const OP_LUI: u32 = 0x37u;
const OP_AUIPC: u32 = 0x17u;
const OP_JAL: u32 = 0x6Fu;
const OP_JALR: u32 = 0x67u;
const OP_BRANCH: u32 = 0x63u;
const OP_LOAD: u32 = 0x03u;
const OP_STORE: u32 = 0x23u;
const OP_OP_IMM: u32 = 0x13u;
const OP_OP: u32 = 0x33u;
const OP_MISC_MEM: u32 = 0x0Fu;
const OP_SYSTEM: u32 = 0x73u;

// Funct3 values
const F3_BEQ: u32 = 0x0u;
const F3_BNE: u32 = 0x1u;
const F3_BLT: u32 = 0x4u;
const F3_BGE: u32 = 0x5u;
const F3_BLTU: u32 = 0x6u;
const F3_BGEU: u32 = 0x7u;
const F3_ADD: u32 = 0x0u;
const F3_SLL: u32 = 0x1u;
const F3_SLT: u32 = 0x2u;
const F3_SLTU: u32 = 0x3u;
const F3_XOR: u32 = 0x4u;
const F3_SR: u32 = 0x5u;
const F3_OR: u32 = 0x6u;
const F3_AND: u32 = 0x7u;

// ============================================
// Phase 2: Floating Point Unit Constants
// ============================================

// FP funct7 values (distinguish FP from integer OP)
const F7_FADD: u32 = 0x01u;
const F7_FSUB: u32 = 0x02u;
const F7_FMUL: u32 = 0x04u;
const F7_FDIV: u32 = 0x08u;
const F7_FSQRT: u32 = 0x10u;
const F7_FMIN: u32 = 0x14u;
const F7_FMAX: u32 = 0x18u;
const F7_FCMP: u32 = 0x20u;
const F7_FCVT: u32 = 0x80u;

// FP funct3 values for FCMP and FCVT
const F3_FEQ: u32 = 0x010u;
const F3_FLT: u32 = 0x000u;
const F3_FLE: u32 = 0x001u;
const F3_FCVT_S_W: u32 = 0x001u;  // int to float
const F3_FCVT_W_S: u32 = 0x000u;  // float to int

// IEEE 754 Special Values for f32
const F32_SIGN_MASK: u32 = 0x80000000u;
const F32_EXP_MASK: u32 = 0x7F800000u;
const F32_FRAC_MASK: u32 = 0x007FFFFFu;
const F32_QNAN: u32 = 0x7FC00000u;  // Quiet NaN
const F32_SNAN: u32 = 0x7FC00001u;  // Signaling NaN
const F32_INF_POS: u32 = 0x7F800000u;  // Positive infinity
const F32_INF_NEG: u32 = 0xFF800000u;  // Negative infinity
const F32_ZERO: u32 = 0x00000000u;
const F32_ZERO_NEG: u32 = 0x80000000u;

// ============================================
// Uniforms
// ============================================

struct RiscvUniforms {
    cycle_count: u32,
    texture_size: u32,
    pc: u32,
    reg_base: u32,
    mem_base: u32,
    instruction_count: u32,
    status: u32,  // bit 0 = running, bit 1 = halted, bit 2 = error
    vm_id: u32,  // Phase 43: VM ID (0-7 for concurrent VMs)
    _padding: u32,
};

// Syscall queue entry (40 bytes, cache-line aligned)
struct SyscallEntry {
    vm_id: u32,           // Which VM (0-7, future: 0-63)
    num: u32,             // Syscall number (e.g., 64 = sys_write)
    arg0: u32,            // x10/a0
    arg1: u32,            // x11/a1
    arg2: u32,            // x12/a2
    arg3: u32,            // x13/a3
    arg4: u32,            // x14/a4
    arg5: u32,            // x15/a5
    result: i32,          // Return value (written by host)
    _pad: u32,            // Alignment padding
};

@group(0) @binding(0) var<uniform> uniforms: RiscvUniforms;

// ============================================
// Memory Access
// ============================================

@group(0) @binding(1) var<storage, read_write> ram_buffer: array<u32>;
@group(0) @binding(3) var<storage, read_write> syscall_queue: array<SyscallEntry, 128>;
@group(0) @binding(4) var display_write: texture_storage_2d<rgba8unorm, write>;
@group(0) @binding(6) var<storage, read_write> pending_counts: array<atomic<u32>, 8>;
@group(0) @binding(7) var<storage, read_write> vm_status: array<u32, 8>;

// ============================================
// Phase 44: Basic Block Profiler
// ============================================

const PROFILER_ENABLED: u32 = 1u;
const HOT_BLOCK_THRESHOLD: u32 = 10000u;  // Trigger JIT after 10k executions
const MAX_PROFILED_BLOCKS: u32 = 256u;     // Track top 256 basic blocks
const PROFILER_SHARD_BITS: u32 = 8u;       // 256 shards for reduced contention

struct ProfilerEntry {
    pc: u32,              // Basic block start address
    count: atomic<u32>,   // Execution count
    _pad: array<u32, 3>,  // Pad to 16 bytes
};

// Shared profiler storage (256 blocks × 16 bytes = 4KB)
@group(0) @binding(8) var<storage, read_write> profiler_blocks: array<ProfilerEntry, MAX_PROFILED_BLOCKS>;

// Per-shard pending block (to reduce atomic contention)
var<workgroup> pending_block: ProfilerEntry;

// ============================================
// Phase 1: Multi-Workgroup Execution Infrastructure
// ============================================

// Workgroup configuration - controls parallelism level
const WORKGROUP_SIZE: u32 = 16u;  // Number of parallel threads

// Shared state for workgroup coordination
var<workgroup> shared_pc: atomic<u32>;              // Shared program counter
var<workgroup> shared_lock: atomic<u32>;            // Spinlock for PC access
var<workgroup> shared_instruction_count: u32;       // Total instructions to execute
var<workgroup> shared_instructions_executed: u32;    // Instructions completed this frame
var<workgroup> shared_halt_flag: u32;               // Halt signal from any thread

// Performance counters for multi-workgroup metrics
struct PerfCounters {
    spin_waits: atomic<u32>,      // Number of lock contention events
    cache_hits: atomic<u32>,      // Instruction cache hits (future)
    cache_misses: atomic<u32>,    // Instruction cache misses (future)
}

var<workgroup> perf_counters: PerfCounters;

// ============================================
// Profiler Functions
// ============================================

// Hash PC to profiler slot (simple hash, handles collisions gracefully)
fn pc_to_profiler_slot(pc: u32) -> u32 {
    return (pc % MAX_PROFILED_BLOCKS);
}

// Record basic block execution
fn record_block_execution(pc: u32) {
    if (!PROFILER_ENABLED) { return; }

    let slot = pc_to_profiler_slot(pc);

    // Use atomic add to count executions
    let count = atomicAdd(&profiler_blocks[slot].count, 1u);

    // Initialize on first execution (store PC if count was 0)
    if (count == 0u) {
        profiler_blocks[slot].pc = pc;
    }
}

// Check if this block is hot (should be JIT compiled)
fn is_block_hot(pc: u32) -> bool {
    if (!PROFILER_ENABLED) { return false; }

    let slot = pc_to_profiler_slot(pc);
    let count = atomicLoad(&profiler_blocks[slot].count);

    return (count >= HOT_BLOCK_THRESHOLD);
}

// Read a 32-bit word from RAM
fn read_u32(addr: u32) -> u32 {
    let word_idx = addr / 4u;
    return ram_buffer[word_idx];
}

// Write a 32-bit word to RAM
fn write_u32(addr: u32, value: u32) {
        // MMIO: Write to display (512x512 = 262144 words = 1048576 bytes)
        let offset = (addr - 0x40000000u) / 4u;
        let x = offset % 512u;
        let y = 511u - (offset / 512u); // Invert Y to match WGPU/Retina expectation
        
        // Convert to float for Rgba8Unorm
        let r = f32(value & 0xFFu) / 255.0;
        let g = f32((value >> 8u) & 0xFFu) / 255.0;
        let b = f32((value >> 16u) & 0xFFu) / 255.0;
        let a = f32((value >> 24u) & 0xFFu) / 255.0;
        
        textureStore(display_write, vec2<i32>(i32(x), i32(y)), vec4<f32>(r, g, b, a));
        return;

    let word_idx = addr / 4u;
    ram_buffer[word_idx] = value;
}

// Read a byte from RAM
fn read_u8(addr: u32) -> u32 {
    let word = read_u32(addr & ~3u);  // Align to word boundary
    let shift = (addr % 4u) * 8u;
    return (word >> shift) & 0xFFu;
}

// Write a byte to RAM
fn write_u8(addr: u32, value: u32) {
    let word_addr = addr & ~3u;
    let word = read_u32(word_addr);
    let shift = (addr % 4u) * 8u;
    let mask = ~(0xFFu << shift);
    let new_word = (word & mask) | ((value & 0xFFu) << shift);
    write_u32(word_addr, new_word);
}

// Read a 16-bit halfword
fn read_u16(addr: u32) -> u32 {
    let b0 = read_u8(addr);
    let b1 = read_u8(addr + 1u);
    return b0 | (b1 << 8u);
}

// Write a 16-bit halfword
fn write_u16(addr: u32, value: u32) {
    write_u8(addr, value & 0xFFu);
    write_u8(addr + 1u, (value >> 8u) & 0xFFu);
}

// ============================================
// Register Access
// ============================================

// Read register (x0 is always 0)
fn read_reg(reg_idx: u32) -> u32 {
    if reg_idx == 0u {
        return 0u;
    }
    let addr = REGISTER_BASE + reg_idx * REGISTER_SIZE;
    return read_u32(addr);
}

// Write register (x0 is read-only)
fn write_reg(reg_idx: u32, value: u32) {
    if reg_idx == 0u {
        return;  // x0 is always 0
    }
    let addr = REGISTER_BASE + reg_idx * REGISTER_SIZE;
    write_u32(addr, value);
}

// ============================================
// Instruction Fetch
// ============================================

fn fetch_instruction(pc: u32) -> u32 {
    return read_u32(pc);
}

// ============================================
// Instruction Decode
// ============================================

struct DecodedInst {
    opcode: u32,
    rd: u32,
    rs1: u32,
    rs2: u32,
    funct3: u32,
    funct7: u32,
    imm_i: u32,
    imm_s: u32,
    imm_b: u32,
    imm_u: u32,
    imm_j: u32,
}

fn decode_instruction(inst: u32) -> DecodedInst {
    var d: DecodedInst;
    
    d.opcode = inst & 0x7Fu;
    d.rd = (inst >> 7u) & 0x1Fu;
    d.funct3 = (inst >> 12u) & 0x7u;
    d.rs1 = (inst >> 15u) & 0x1Fu;
    d.rs2 = (inst >> 20u) & 0x1Fu;
    d.funct7 = (inst >> 25u) & 0x7Fu;
    
    // I-type immediate
    d.imm_i = (inst >> 20u) & 0xFFFu;
    if (d.imm_i & 0x800u) != 0u {
        d.imm_i = d.imm_i | 0xFFFFF000u;  // Sign extend
    }
    
    // S-type immediate
    d.imm_s = ((inst >> 7u) & 0x1Fu) | (((inst >> 25u) & 0x7Fu) << 5u);
    if (d.imm_s & 0x800u) != 0u {
        d.imm_s = d.imm_s | 0xFFFFF000u;
    }
    
    // B-type immediate
    d.imm_b = (((inst >> 8u) & 0xFu) << 1u) |
              (((inst >> 25u) & 0x3Fu) << 5u) |
              (((inst >> 7u) & 0x1u) << 11u) |
              (((inst >> 31u) & 0x1u) << 12u);
    if (d.imm_b & 0x1000u) != 0u {
        d.imm_b = d.imm_b | 0xFFFFE000u;
    }
    
    // U-type immediate
    d.imm_u = inst & 0xFFFFF000u;
    
    // J-type immediate
    d.imm_j = (((inst >> 21u) & 0x3FFu) << 1u) |
              (((inst >> 20u) & 0x1u) << 11u) |
              (((inst >> 12u) & 0xFFu) << 12u) |
              (((inst >> 31u) & 0x1u) << 20u);
    if (d.imm_j & 0x100000u) != 0u {
        d.imm_j = d.imm_j | 0xFFE00000u;
    }
    
    return d;
}

// ============================================
// ALU Operations
// ============================================

fn alu_add(a: u32, b: u32) -> u32 {
    return a + b;
}

fn alu_sub(a: u32, b: u32) -> u32 {
    return a - b;
}

fn alu_sll(a: u32, shamt: u32) -> u32 {
    return a << (shamt & 0x1Fu);
}

fn alu_srl(a: u32, shamt: u32) -> u32 {
    return a >> (shamt & 0x1Fu);
}

fn alu_sra(a: u32, shamt: u32) -> u32 {
    // Arithmetic right shift (sign extend)
    let s = shamt & 0x1Fu;
    if (a & 0x80000000u) != 0u {
        return (a >> s) | (0xFFFFFFFFu << (32u - s));
    } else {
        return a >> s;
    }
}

fn alu_slt(a: u32, b: u32) -> u32 {
    // Signed less than
    let sa = i32(a);
    let sb = i32(b);
    return select(0u, 1u, sa < sb);
}

fn alu_sltu(a: u32, b: u32) -> u32 {
    // Unsigned less than
    return select(0u, 1u, a < b);
}

// ============================================
// Phase 2: Floating Point Operations
// ============================================

// Extract IEEE 754 components from f32 bit pattern
fn f32_sign(bits: u32) -> u32 {
    return (bits & F32_SIGN_MASK) >> 31u;
}

fn f32_exponent(bits: u32) -> u32 {
    return (bits & F32_EXP_MASK) >> 23u;
}

fn f32_fraction(bits: u32) -> u32 {
    return bits & F32_FRAC_MASK;
}

// Check for IEEE 754 special values
fn is_nan(bits: u32) -> bool {
    let exp = f32_exponent(bits);
    let frac = f32_fraction(bits);
    return (exp == 0xFFu) && (frac != 0u);
}

fn is_inf(bits: u32) -> bool {
    let exp = f32_exponent(bits);
    return (exp == 0xFFu) && (f32_fraction(bits) == 0u);
}

fn is_zero(bits: u32) -> bool {
    return (bits & 0x7FFFFFFFu) == 0u;
}

// FP Addition using WGSL f32 operations
fn fp_add(a: u32, b: u32) -> u32 {
    // Handle special cases
    if (is_nan(a) || is_nan(b)) {
        return F32_QNAN;
    }
    if (is_inf(a) && is_inf(b) && (f32_sign(a) != f32_sign(b))) {
        return F32_QNAN;  // Inf - Inf = NaN
    }
    if (is_inf(a)) {
        return a;
    }
    if (is_inf(b)) {
        return b;
    }

    // Use WGSL f32 for actual computation
    let fa = bitcast<f32>(a);
    let fb = bitcast<f32>(b);
    let result = fa + fb;
    return bitcast<u32>(result);
}

// FP Subtraction
fn fp_sub(a: u32, b: u32) -> u32 {
    if (is_nan(a) || is_nan(b)) {
        return F32_QNAN;
    }
    if (is_inf(a) && is_inf(b) && (f32_sign(a) == f32_sign(b))) {
        return F32_QNAN;  // Inf - Inf = NaN (same sign)
    }
    if (is_inf(a)) {
        return a;
    }
    if (is_inf(b)) {
        // Negate infinity (flip sign bit)
        return b ^ F32_SIGN_MASK;
    }

    let fa = bitcast<f32>(a);
    let fb = bitcast<f32>(b);
    let result = fa - fb;
    return bitcast<u32>(result);
}

// FP Multiplication
fn fp_mul(a: u32, b: u32) -> u32 {
    if (is_nan(a) || is_nan(b)) {
        return F32_QNAN;
    }
    if ((is_zero(a) || is_inf(b)) && (is_inf(a) || is_zero(b))) {
        return F32_QNAN;  // 0 * Inf = NaN
    }

    let fa = bitcast<f32>(a);
    let fb = bitcast<f32>(b);
    let result = fa * fb;
    return bitcast<u32>(result);
}

// FP Division
fn fp_div(a: u32, b: u32) -> u32 {
    if (is_nan(a) || is_nan(b)) {
        return F32_QNAN;
    }
    if (is_zero(b)) {
        if (is_zero(a)) {
            return F32_QNAN;  // 0 / 0 = NaN
        }
        // x / 0 = Inf, preserve sign of numerator
        return F32_INF_POS | (f32_sign(a) << 31u);
    }
    if (is_zero(a)) {
        return F32_ZERO;  // 0 / x = 0
    }
    if (is_inf(b)) {
        // x / Inf = 0, with sign handling
        let sign_bit = f32_sign(a) ^ f32_sign(b);
        return F32_ZERO | (sign_bit << 31u);
    }
    if (is_inf(a)) {
        // Inf / x = Inf
        return a;
    }

    let fa = bitcast<f32>(a);
    let fb = bitcast<f32>(b);
    let result = fa / fb;
    return bitcast<u32>(result);
}

// FP Square Root
fn fp_sqrt(a: u32) -> u32 {
    if (is_nan(a)) {
        return a;  // NaN propagates
    }
    if (is_zero(a)) {
        return a;  // sqrt(0) = 0
    }
    if (f32_sign(a) == 1u) {
        return F32_QNAN;  // sqrt(-x) = NaN
    }
    if (is_inf(a)) {
        return a;  // sqrt(Inf) = Inf
    }

    let fa = bitcast<f32>(a);
    let result = sqrt(fa);
    return bitcast<u32>(result);
}

// FP Minimum
fn fp_min(a: u32, b: u32) -> u32 {
    if (is_nan(a)) {
        return b;
    }
    if (is_nan(b)) {
        return a;
    }
    let fa = bitcast<f32>(a);
    let fb = bitcast<f32>(b);
    let result = select(fa < fb, fa, fb);
    return bitcast<u32>(result);
}

// FP Maximum
fn fp_max(a: u32, b: u32) -> u32 {
    if (is_nan(a)) {
        return b;
    }
    if (is_nan(b)) {
        return a;
    }
    let fa = bitcast<f32>(a);
    let fb = bitcast<f32>(b);
    let result = select(fa > fb, fa, fb);
    return bitcast<u32>(result);
}

// FP Compare Equal (returns 0 or 1)
fn fp_feq(a: u32, b: u32) -> u32 {
    if (is_nan(a) || is_nan(b)) {
        return 0u;  // NaN comparison is always false
    }
    let fa = bitcast<f32>(a);
    let fb = bitcast<f32>(b);
    return select(fa == fb, 1u, 0u);
}

// FP Compare Less Than
fn fp_flt(a: u32, b: u32) -> u32 {
    if (is_nan(a) || is_nan(b)) {
        return 0u;  // NaN comparison is always false
    }
    let fa = bitcast<f32>(a);
    let fb = bitcast<f32>(b);
    return select(fa < fb, 1u, 0u);
}

// FP Compare Less Than or Equal
fn fp_fle(a: u32, b: u32) -> u32 {
    if (is_nan(a) || is_nan(b)) {
        return 0u;  // NaN comparison is always false
    }
    let fa = bitcast<f32>(a);
    let fb = bitcast<f32>(b);
    return select(fa <= fb, 1u, 0u);
}

// Convert signed integer to float
fn fcvt_s_w(rs1_val: u32) -> u32 {
    let i_val = i32(rs1_val);
    let f_val = f32(i_val);
    return bitcast<u32>(f_val);
}

// Convert float to signed integer
fn fcvt_w_s(fs1_bits: u32) -> u32 {
    let f_val = bitcast<f32>(fs1_bits);
    let i_val = i32(f_val);
    return u32(i_val);
}

// ============================================
// Syscall Handling
// ============================================

const SYS_WRITE: u32 = 64u;   // Linux sys_write
const SYS_EXIT: u32 = 93u;    // Linux sys_exit

// ============================================
// Statistics & Syscalls
// ============================================

// Console buffer for sys_write output
const CONSOLE_BUFFER_SIZE: u32 = 256u;
@group(0) @binding(5) var<storage, read_write> console_buffer: array<u32>;

struct RiscvStats {
    cycles_executed: u32,
    instructions_executed: u32,
    current_pc: u32,
    status: u32,
    syscall_num: u32,
    syscall_arg0: u32,
    syscall_arg1: u32,
    syscall_arg2: u32,
    console_pos: u32,
    _padding: array<u32, 7>,
};

@group(0) @binding(2) var<storage, read_write> stats: RiscvStats;

fn sys_write(fd: u32, buf_ptr: u32, len: u32) {
    if fd != 1u { return; }
    for (var i: u32 = 0u; i < len; i = i + 1u) {
        let byte_val = read_u8(buf_ptr + i);
        let pos = stats.console_pos;
        let word_idx = pos / 4u;
        let shift = (pos % 4u) * 8u;
        if word_idx >= 256u { break; }
        var word = console_buffer[word_idx];
        let mask = ~(0xFFu << shift);
        word = (word & mask) | ((byte_val & 0xFFu) << shift);
        console_buffer[word_idx] = word;
        stats.console_pos = pos + 1u;
    }
}

fn handle_syscall(pc: u32) -> u32 {
    let vm_id = 0u; // Single VM for now, indexed at 0
    
    // Get queue slot for this VM (round-robin within 16 slots)
    let base_idx = vm_id * 16u;
    let slot = atomicAdd(&pending_counts[vm_id], 1u) % 16u;
    let entry_idx = base_idx + slot;

    // Populate syscall entry
    syscall_queue[entry_idx].vm_id = vm_id;
    syscall_queue[entry_idx].num = read_reg(17u);  // a7 = syscall number
    syscall_queue[entry_idx].arg0 = read_reg(10u); // a0
    syscall_queue[entry_idx].arg1 = read_reg(11u); // a1
    syscall_queue[entry_idx].arg2 = read_reg(12u); // a2
    syscall_queue[entry_idx].arg3 = read_reg(13u); // a3
    syscall_queue[entry_idx].arg4 = read_reg(14u); // a4
    syscall_queue[entry_idx].arg5 = read_reg(15u); // a5
    syscall_queue[entry_idx].result = 0;

    // Mark VM as waiting for host
    vm_status[vm_id] = 1u; // STATUS_WAITING_SYSCALL
    
    // Next execution will resume at pc + 4 after host clears vm_status
    return pc + 4u;
}

// ============================================
// Execute Instruction
// ============================================

fn execute_instruction(pc: u32) -> u32 {
    // Fetch
    let inst = fetch_instruction(pc);
    
    // Decode
    let d = decode_instruction(inst);
    
    // Execute based on opcode
    switch d.opcode {
        // LUI: Load Upper Immediate
        case OP_LUI: {
            write_reg(d.rd, d.imm_u);
            return pc + 4u;
        }
        
        // AUIPC: Add Upper Immediate to PC
        case OP_AUIPC: {
            write_reg(d.rd, pc + d.imm_u);
            return pc + 4u;
        }
        
        // JAL: Jump and Link
        case OP_JAL: {
            write_reg(d.rd, pc + 4u);
            return pc + d.imm_j;
        }
        
        // JALR: Jump and Link Register
        case OP_JALR: {
            let rs1_val = read_reg(d.rs1);
            write_reg(d.rd, pc + 4u);
            return (rs1_val + d.imm_i) & ~1u;
        }
        
        // Branch instructions
        case OP_BRANCH: {
            let rs1_val = read_reg(d.rs1);
            let rs2_val = read_reg(d.rs2);
            var take_branch = false;
            
            switch d.funct3 {
                case F3_BEQ: { take_branch = (rs1_val == rs2_val); }
                case F3_BNE: { take_branch = (rs1_val != rs2_val); }
                case F3_BLT: { take_branch = (i32(rs1_val) < i32(rs2_val)); }
                case F3_BGE: { take_branch = (i32(rs1_val) >= i32(rs2_val)); }
                case F3_BLTU: { take_branch = (rs1_val < rs2_val); }
                case F3_BGEU: { take_branch = (rs1_val >= rs2_val); }
                default: {}
            }
            
            if take_branch {
                return pc + d.imm_b;
            } else {
                return pc + 4u;
            }
        }
        
        // Load instructions
        case OP_LOAD: {
            let addr = read_reg(d.rs1) + d.imm_i;
            var value: u32 = 0u;
            
            switch d.funct3 {
                case 0x0u: { // LB
                    value = read_u8(addr);
                    if (value & 0x80u) != 0u {
                        value = value | 0xFFFFFF00u;  // Sign extend
                    }
                }
                case 0x1u: { // LH
                    value = read_u16(addr);
                    if (value & 0x8000u) != 0u {
                        value = value | 0xFFFF0000u;  // Sign extend
                    }
                }
                case 0x2u: { // LW
                    value = read_u32(addr);
                }
                case 0x4u: { // LBU
                    value = read_u8(addr);
                }
                case 0x5u: { // LHU
                    value = read_u16(addr);
                }
                default: {}
            }
            
            write_reg(d.rd, value);
            return pc + 4u;
        }
        
        // Store instructions
        case OP_STORE: {
            let addr = read_reg(d.rs1) + d.imm_s;
            let rs2_val = read_reg(d.rs2);
            
            switch d.funct3 {
                case 0x0u: { // SB
                    write_u8(addr, rs2_val & 0xFFu);
                }
                case 0x1u: { // SH
                    write_u16(addr, rs2_val & 0xFFFFu);
                }
                case 0x2u: { // SW
                    write_u32(addr, rs2_val);
                }
                default: {}
            }
            
            return pc + 4u;
        }
        
        // OP-IMM: Register-Immediate ALU
        case OP_OP_IMM: {
            let rs1_val = read_reg(d.rs1);
            var result: u32 = 0u;
            
            switch d.funct3 {
                case F3_ADD: { result = alu_add(rs1_val, d.imm_i); }  // ADDI
                case F3_SLL: { result = alu_sll(rs1_val, d.imm_i & 0x1Fu); }  // SLLI
                case F3_SLT: { result = alu_slt(rs1_val, d.imm_i); }  // SLTI
                case F3_SLTU: { result = alu_sltu(rs1_val, d.imm_i); }  // SLTIU
                case F3_XOR: { result = rs1_val ^ d.imm_i; }  // XORI
                case F3_SR: {
                    if (d.imm_i & 0x400u) != 0u {
                        result = alu_sra(rs1_val, d.imm_i);  // SRAI
                    } else {
                        result = alu_srl(rs1_val, d.imm_i);  // SRLI
                    }
                }
                case F3_OR: { result = rs1_val | d.imm_i; }  // ORI
                case F3_AND: { result = rs1_val & d.imm_i; }  // ANDI
                default: {}
            }
            
            write_reg(d.rd, result);
            return pc + 4u;
        }
        
        // OP: Register-Register ALU
        case OP_OP: {
            let rs1_val = read_reg(d.rs1);
            let rs2_val = read_reg(d.rs2);
            var result: u32 = 0u;

            // Phase 2: Check for FP instructions by funct7
            // FP instructions use funct7 values 0x01-0x80 (not 0x00 for integer)
            let is_fp = (d.funct7 & 0x7Fu) >= 0x01u && (d.funct7 & 0x7Fu) <= 0x80u;

            if (is_fp) {
                // Phase 2: FP Instruction Dispatch
                switch (d.funct7) {
                    case F7_FADD: {
                        result = fp_add(rs1_val, rs2_val);  // FADD
                    }
                    case F7_FSUB: {
                        result = fp_sub(rs1_val, rs2_val);  // FSUB
                    }
                    case F7_FMUL: {
                        result = fp_mul(rs1_val, rs2_val);  // FMUL
                    }
                    case F7_FDIV: {
                        result = fp_div(rs1_val, rs2_val);  // FDIV
                    }
                    case F7_FSQRT: {
                        result = fp_sqrt(rs1_val);  // FSQRT (rs2 ignored)
                    }
                    case F7_FMIN: {
                        result = fp_min(rs1_val, rs2_val);  // FMIN
                    }
                    case F7_FMAX: {
                        result = fp_max(rs1_val, rs2_val);  // FMAX
                    }
                    case F7_FCMP: {
                        // FP comparison uses funct3 to determine type
                        switch (d.funct3) {
                            case F3_FEQ: {
                                result = fp_feq(rs1_val, rs2_val);  // FEQ
                            }
                            case F3_FLT: {
                                result = fp_flt(rs1_val, rs2_val);  // FLT
                            }
                            case F3_FLE: {
                                result = fp_fle(rs1_val, rs2_val);  // FLE
                            }
                            default: {
                                result = 0u;  // Unknown comparison
                            }
                        }
                    }
                    case F7_FCVT: {
                        // Float conversion uses funct3 to determine direction
                        switch (d.funct3) {
                            case F3_FCVT_S_W: {
                                result = fcvt_s_w(rs1_val);  // int to float
                            }
                            case F3_FCVT_W_S: {
                                result = fcvt_w_s(rs1_val);  // float to int
                            }
                            default: {}
                        }
                    }
                    default: {
                        // Unknown FP instruction
                        return pc + 4u;
                    }
                }
                write_reg(d.rd, result);
                return pc + 4u;
            }

            // Integer ALU operations (original code)
            // Check for SUB/SRA
            let is_sub = (d.funct7 & 0x20u) != 0u;

            switch d.funct3 {
                case F3_ADD: {
                    if is_sub {
                        result = alu_sub(rs1_val, rs2_val);  // SUB
                    } else {
                        result = alu_add(rs1_val, rs2_val);  // ADD
                    }
                }
                case F3_SLL: { result = alu_sll(rs1_val, rs2_val); }  // SLL
                case F3_SLT: { result = alu_slt(rs1_val, rs2_val); }  // SLT
                case F3_SLTU: { result = alu_sltu(rs1_val, rs2_val); }  // SLTU
                case F3_XOR: { result = rs1_val ^ rs2_val; }  // XOR
                case F3_SR: {
                    if is_sub {
                        result = alu_sra(rs1_val, rs2_val);  // SRA
                    } else {
                        result = alu_srl(rs1_val, rs2_val);  // SRL
                    }
                }
                case F3_OR: { result = rs1_val | rs2_val; }  // OR
                case F3_AND: { result = rs1_val & rs2_val; }  // AND
                default: {}
            }

            write_reg(d.rd, result);
            return pc + 4u;
        }
        
        // MISC-MEM: Fence (no-op for now)
        case OP_MISC_MEM: {
            return pc + 4u;
        }
        
        // SYSTEM: ECALL, EBREAK, CSR
        case OP_SYSTEM: {
            if d.funct3 == 0u {
                if inst == 0x00000073u {
                    // ECALL - system call
                    return handle_syscall(pc);
                } else if inst == 0x00100073u {
                    // EBREAK - breakpoint
                    return 0xFFFFFFFFu;  // Halt
                }
            }
            // CSR operations - skip for now
            return pc + 4u;
        }
        
        default: {
            // Unknown opcode - skip
            return pc + 4u;
        }
    }
    
    return pc + 4u;
}

// ============================================
// Phase 1: Atomic Lock Helper Functions
// ============================================

// Acquire lock with timeout (prevents deadlock)
// Returns true if lock acquired, false on timeout
fn acquire_lock(lock_ptr: ptr<workgroup, atomic<u32>>, max_spins: u32) -> bool {
    for (var spin: u32 = 0u; spin < max_spins; spin = spin + 1u) {
        // Try to acquire lock (0 -> 1)
        let result = atomicCompareExchangeWeak(lock_ptr, 0u, 1u);
        if (result.exchanged) {
            return true;  // Lock acquired
        }
        // Record contention for profiling
        if (spin == 0u) {
            atomicAdd(&perf_counters.spin_waits, 1u);
        }
    }
    return false;  // Timeout
}

// Release lock
fn release_lock(lock_ptr: ptr<workgroup, atomic<u32>>) {
    atomicStore(lock_ptr, 0u);
}

// ============================================
// Statistics Output
// ============================================




// ============================================
// Main Entry Point
// ============================================

@compute @workgroup_size(WORKGROUP_SIZE)
fn main_riscv(
    @builtin(global_invocation_id) global_id: vec3<u32>,
    @builtin(local_invocation_id) local_id: vec3<u32>
) {
    let lid = local_id.x;  // Local thread ID within workgroup (0 to WORKGROUP_SIZE-1)

    // Thread 0: Initialize shared state
    if (lid == 0u) {
        atomicStore(&shared_pc, uniforms.pc);
        shared_instruction_count = uniforms.instruction_count;
        shared_instructions_executed = 0u;
        shared_halt_flag = 0u;
        atomicStore(&shared_lock, 0u);
        atomicStore(&perf_counters.spin_waits, 0u);
    }

    // Synchronize: Wait for thread 0 to finish initialization
    workgroupBarrier();

    // Check if VM is running
    if (uniforms.status & 1u) == 0u {
        return;
    }

    // Check if VM is waiting for syscall or halted
    if (vm_status[uniforms.vm_id] != 0u) {
        return;
    }

    // Phase 1: Parallel instruction execution
    // Each thread processes a strided subset of instructions
    for (var i: u32 = lid; i < shared_instruction_count; i = i + WORKGROUP_SIZE) {
        // Early exit if another thread signaled halt
        if (shared_halt_flag != 0u) {
            break;
        }

        // Acquire PC lock (with timeout to prevent deadlock)
        let acquired = acquire_lock(&shared_lock, 1000u);

        if (!acquired) {
            // Failed to acquire lock - exit gracefully
            break;
        }

        // Fetch current PC and increment atomically
        let pc = atomicLoad(&shared_pc);

        // Check for halt condition before executing
        if (pc == 0xFFFFFFFFu) {
            release_lock(&shared_lock);
            shared_halt_flag = 1u;
            break;
        }

        // Increment PC for next instruction (fixed 4-byte width for RISC-V)
        atomicStore(&shared_pc, pc + 4u);

        // Release lock - other threads can now fetch their instructions
        release_lock(&shared_lock);

        // Execute instruction (independent after PC fetch)
        let new_pc = execute_instruction(pc);

        // Check for halt (0xFFFFFFFF indicates halt)
        if (new_pc == 0xFFFFFFFFu) {
            shared_halt_flag = 1u;
            // Update final PC
            if (lid == 0u) {
                atomicStore(&shared_pc, 0xFFFFFFFFu);
            }
            break;
        }

        // Record successful instruction execution
        let executed = atomicAdd(&shared_instructions_executed, 1u);

        // Phase 44: Record basic block execution for profiling
        record_block_execution(new_pc);

        // Prevent infinite loops during development
        if (executed > shared_instruction_count * 2u) {
            break;
        }
    }

    // Final synchronization before stats update
    workgroupBarrier();

    // Thread 0: Update statistics and return final PC
    if (lid == 0u) {
        let final_pc = atomicLoad(&shared_pc);

        // Check if we halted
        if (final_pc == 0xFFFFFFFFu || shared_halt_flag != 0u) {
            vm_status[uniforms.vm_id] = 2u;  // STATUS_HALTED
            stats.status = 2u;  // Halted
        } else {
            stats.status = uniforms.status;  // Still running
        }

        stats.current_pc = final_pc;
        stats.instructions_executed = shared_instructions_executed;
        stats.cycles_executed = uniforms.cycle_count;
    }
}
