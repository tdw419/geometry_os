/// Glyph VM Scheduler - Multi-VM Compute Shader
///
/// Reads glyph instructions from RAM texture (binding 0).
/// Each pixel is one instruction: R=opcode, G=stratum, B=p1, A=p2
///
/// Bindings (must match daemon):
/// 0: RAM texture (rgba8uint, read_write) - Glyph program memory via Hilbert curve
/// 1: VM states array (storage, read_write) - 8 VmState structs
/// 2: Scheduler state (storage, read_write)
/// 3: Message queue (storage, read_write)
/// 4: Event queue header (storage, read_only)
/// 5: Event queue (storage, read_only)

const MAX_VMS: u32 = 8u;
const CYCLES_PER_FRAME: u32 = 64u;

// VM state constants
const VM_INACTIVE: u32 = 0u;
const VM_RUNNING: u32 = 1u;
const VM_HALTED: u32 = 2u;
const VM_WAITING: u32 = 3u;

struct VmState {
    regs: array<u32, 128>,    // 128 general-purpose registers (512 bytes)
    pc: u32,                   // Program counter (Hilbert pixel index) - offset 512
    halted: u32,               // Halted flag - offset 516
    stratum: u32,              // Current stratum - offset 520
    cycles: u32,               // Cycle counter - offset 524
    stack_ptr: u32,            // Stack pointer - offset 528
    vm_id: u32,                // VM ID - offset 532
    state: u32,                // VM state (RUNNING, HALTED, etc.) - offset 536
    parent_id: u32,            // Parent VM ID - offset 540
    entry_point: u32,          // Original entry point - offset 544
    base_addr: u32,            // Memory base address - offset 548
    bound_addr: u32,           // Memory bound address - offset 552
    eap_coord: u32,            // EAP mission context - offset 556
    generation: u32,           // VM generation - offset 560
    attention_mask: u32,       // AI focus mask - offset 564
    _pad: array<u32, 2>,       // Padding to match Rust's struct (576 bytes before stack)
    stack: array<u32, 64>,     // Call stack (256 bytes) - offset 576
    // Total: 576 + 256 = 832 bytes
}

struct SchedulerState {
    active_count: u32,
    frame: u32,
    spawn_count: u32,
    padding: u32,
}

@group(0) @binding(0) var ram_texture: texture_storage_2d<rgba8uint, read_write>;
@group(0) @binding(1) var<storage, read_write> vm_states: array<VmState>;
@group(0) @binding(2) var<storage, read_write> scheduler: SchedulerState;
@group(0) @binding(3) var<storage, read_write> messages: array<atomic<u32>>;
@group(0) @binding(4) var<storage, read> event_header: atomic<u32>;
@group(0) @binding(5) var<storage, read> event_queue: array<atomic<u32>>;

/// Convert Hilbert linear index to 2D coordinates
fn hilbert_d2xy(d: u32) -> vec2<u32> {
    var x = 0u;
    var y = 0u;
    var t = d;
    var s = 1u;

    while (s < 4096u) {
        let rx = (t >> 1u) & 1u;
        let ry = (t ^ rx) & 1u;

        if (ry == 0u) {
            if (rx == 1u) {
                x = s - 1u - x;
                y = s - 1u - y;
            }
            let tmp = x;
            x = y;
            y = tmp;
        }

        x += s * rx;
        y += s * ry;
        t >>= 2u;
        s <<= 1u;
    }

    return vec2<u32>(x, y);
}

/// Read a glyph instruction from RAM texture at Hilbert index
fn read_glyph(d: u32) -> vec4<u32> {
    let pos = hilbert_d2xy(d);
    return textureLoad(ram_texture, pos);
}

/// Write a glyph instruction to RAM texture at Hilbert index
fn write_glyph(d: u32, value: vec4<u32>) {
    let pos = hilbert_d2xy(d);
    textureStore(ram_texture, pos, value);
}

/// Read a 32-bit word from memory (addressed in bytes, mapped via Hilbert)
fn mem_read(addr: u32) -> u32 {
    let pixel_idx = addr / 4u;
    let glyph = read_glyph(pixel_idx);
    // RGBA as little-endian u32
    return glyph.r | (glyph.g << 8u) | (glyph.b << 16u) | (glyph.a << 24u);
}

/// Write a 32-bit word to memory (addressed in bytes, mapped via Hilbert)
fn mem_write(addr: u32, value: u32) {
    let pixel_idx = addr / 4u;
    let glyph = vec4<u32>(
        value & 0xFFu,
        (value >> 8u) & 0xFFu,
        (value >> 16u) & 0xFFu,
        (value >> 24u) & 0xFFu,
    );
    write_glyph(pixel_idx, glyph);
}

/// Execute one instruction for a VM
fn execute_instruction(vm: ptr<function, VmState>) -> u32 {
    let pc = (*vm).pc;
    let glyph = read_glyph(pc);

    let opcode = glyph.r;
    let stratum = glyph.g;
    let p1 = glyph.b; // Usually rd (destination register)
    let p2 = glyph.a; // Usually rs or immediate
    
    // Some instructions use a second word for immediate or extra params
    // We'll read it lazily if needed
    
    // Opcode dispatch (Aligned with SyntheticVram / geos_ascii_compiler)
    switch (opcode) {
        // NOP
        case 0u: { }

        // LDI - Load immediate: LDI rd, imm
        // Note: Compiler emits LDI as [1, 0, rd, 0] followed by [imm]
        case 1u: {
            let imm = mem_read((pc + 1u) * 4u);
            (*vm).regs[p1] = imm;
            (*vm).pc = pc + 1u; // Consume immediate word
        }

        // MOV - Move register: MOV rd, rs
        case 2u: {
            (*vm).regs[p1] = (*vm).regs[p2];
        }

        // LD - Load from memory: LD rd, [rs]
        case 3u: {
            let addr = (*vm).regs[p2];
            (*vm).regs[p1] = mem_read(addr);
        }

        // ST - Store to memory: ST [rd], rs
        case 4u: {
            let addr = (*vm).regs[p1];
            mem_write(addr, (*vm).regs[p2]);
        }

        // ADD - Add register: ADD rd, rs
        case 5u: {
            (*vm).regs[p1] = (*vm).regs[p1] + (*vm).regs[p2];
        }

        // SUB - Subtract register: SUB rd, rs
        case 6u: {
            (*vm).regs[p1] = (*vm).regs[p1] - (*vm).regs[p2];
        }

        // BNE - Branch if not equal: BNE r1, r2, offset
        // Note: Compiler emits BNE as [10, 1, r1, r2] followed by [offset]
        case 10u: {
            let offset = mem_read((pc + 1u) * 4u);
            if ((*vm).regs[p1] != (*vm).regs[p2]) {
                // offset is signed, but we store it as u32
                // We'll treat it as i32 for the jump
                let signed_offset = i32(offset);
                let new_pc = i32(pc) + signed_offset;
                (*vm).pc = u32(new_pc);
                return 1u; // Jumped
            }
            (*vm).pc = pc + 1u; // Skip offset word
        }

        // CALL - Call subroutine: CALL addr
        case 11u: {
            let sp = (*vm).stack_ptr;
            if (sp < 64u) {
                (*vm).stack[sp] = pc + 1u;
                (*vm).stack_ptr = sp + 1u;
                (*vm).pc = p1; // p1 is target address in some formats, or read from next word
                // For ASCII compiler, CALL is [11, 0, 0, 0] followed by [addr]
                let addr = mem_read((pc + 1u) * 4u);
                (*vm).pc = addr;
                return 1u;
            }
        }

        // RET - Return from subroutine
        case 12u: {
            let sp = (*vm).stack_ptr;
            if (sp > 0u) {
                (*vm).stack_ptr = sp - 1u;
                (*vm).pc = (*vm).stack[sp - 1u];
                return 1u;
            }
        }

        // HALT
        case 13u: {
            (*vm).halted = 1u;
            (*vm).state = VM_HALTED;
        }

        default: {
            // Unknown opcode - skip
        }
    }

    return 0u;  // No jump
}

@compute @workgroup_size(8, 1, 1)
fn main(@builtin(global_invocation_id) gid: vec3<u32>) {
    let vm_id = gid.x;

    // DEBUG: Write unique marker 0x13371337 to pixel (0,0) to verify shader execution
    if (vm_id == 0u) {
        textureStore(ram_texture, vec2<i32>(0, 0), vec4<u32>(0x37u, 0x13u, 0x37u, 0x13u));
    }

    if (vm_id >= MAX_VMS) {
        return;
    }

    var vm = vm_states[vm_id];

    // Only execute running VMs
    if (vm.state != VM_RUNNING || vm.halted != 0u) {
        return;
    }

    // Execute up to CYCLES_PER_FRAME instructions
    for (var i = 0u; i < CYCLES_PER_FRAME; i++) {
        if (vm.halted != 0u || vm.state != VM_RUNNING) {
            break;
        }

        let jumped = execute_instruction(&vm);

        // Only increment PC if we didn't jump
        if (jumped == 0u) {
            vm.pc += 1u;
        }

        vm.cycles += 1u;
    }

    // Write back VM state
    vm_states[vm_id] = vm;
}
