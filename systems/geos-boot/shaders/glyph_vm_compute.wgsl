// ============================================
// GEOMETRY OS - GEOS-BOOT GLYPH VM
// ============================================
// The frozen bootstrap is complete. This is the GPU-side
// implementation of the Glyph VM.

// Memory Layout (from io_contract.rs):
// 0x0000 - 0x01FF (0-127 u32): VM State (Registers 0-31, PC, flags)
// 0x0200 - 0x02FF (128-191 u32): Mailbox (CPU <-> GPU communication)
// 0x0300 - 0x0FFF (192-1023 u32): Event Buffer
// 0x1000+         (1024+ u32): Program Memory

@group(0) @binding(0) var<storage, read_write> vm_memory: array<u32>;
@group(0) @binding(1) var<storage, read_write> events: array<u32>;

// Register indices
const PC_INDEX: u32 = 32u;
const CYCLE_INDEX: u32 = 33u;
const HALT_INDEX: u32 = 34u;

// Opcodes (matching SKILL.md and microcode)
const OP_NOP: u32 = 0u;
const OP_LD: u32 = 3u;
const OP_ST: u32 = 4u;
const OP_ADD: u32 = 5u;
const OP_SUB: u32 = 6u;
const OP_JZ: u32 = 10u;
const OP_CALL: u32 = 11u;
const OP_RET: u32 = 12u;
const OP_HALT: u32 = 13u;
const OP_LDI: u32 = 204u;
const OP_MOV: u32 = 206u;
const OP_JMP: u32 = 209u;
const OP_DRAW: u32 = 215u;

// Pixel Framebuffer: 0x0700-0x0FFF (2304 bytes = 576 pixels)
// 64x9 pixel display (576 total pixels, RGBA8)
const FRAMEBUFFER_START: u32 = 0x0700u / 4u; // u32 index = 448
const FRAMEBUFFER_WIDTH: u32 = 64u;
const FRAMEBUFFER_HEIGHT: u32 = 9u;

@compute @workgroup_size(1, 1, 1)
fn main() {
    // 1. Process CPU Events -> Mailbox
    let event_count = events[2u];
    if (event_count > 0u) {
        vm_memory[128u] = events[4u]; // event_type
        vm_memory[129u] = events[5u]; // param_1
        vm_memory[130u] = events[6u]; // param_2
        vm_memory[131u] = events[7u]; // param_3
    } else {
        vm_memory[128u] = 0u; // No event
    }

    // Check halt state
    if (vm_memory[HALT_INDEX] != 0u) {
        return;
    }

    // Increment cycles
    vm_memory[CYCLE_INDEX] += 1u;

    // 2. Fetch
    let pc = vm_memory[PC_INDEX];
    let prog_start = 1024u; // 0x1000 in bytes is index 1024
    
    // We assume 4-word instructions: [opcode, dst, src1, src2]
    let inst_idx = prog_start + (pc * 4u);
    let opcode = vm_memory[inst_idx];
    let dst    = vm_memory[inst_idx + 1u];
    let src1   = vm_memory[inst_idx + 2u];
    let src2   = vm_memory[inst_idx + 3u];

    // 3. Decode & Execute
    var next_pc = pc + 1u;

    switch opcode {
        case OP_NOP: {
            // Do nothing
        }
        case OP_LDI: { // Load Immediate
            if (dst < 32u) { vm_memory[dst] = src1; }
        }
        case OP_MOV: { // Move register
            if (dst < 32u && src1 < 32u) { vm_memory[dst] = vm_memory[src1]; }
        }
        case OP_LD: { // Load from memory address (in src1)
            let addr = vm_memory[src1];
            if (dst < 32u) { vm_memory[dst] = vm_memory[addr]; }
        }
        case OP_ST: { // Store to memory address (in dst)
            let addr = vm_memory[dst];
            let val = vm_memory[src1];
            vm_memory[addr] = val;
        }
        case OP_ADD: {
            if (dst < 32u && src1 < 32u && src2 < 32u) {
                vm_memory[dst] = vm_memory[src1] + vm_memory[src2];
            }
        }
        case OP_SUB: {
            if (dst < 32u && src1 < 32u && src2 < 32u) {
                vm_memory[dst] = vm_memory[src1] - vm_memory[src2];
            }
        }
        case OP_JZ: {
            if (src1 < 32u && vm_memory[src1] == 0u) {
                next_pc = src2; // Jump target
            }
        }
        case OP_JMP: {
            next_pc = src1; // Unconditional jump
        }
        case OP_HALT: {
            vm_memory[HALT_INDEX] = 1u;
            next_pc = pc; // Stay halted on current PC
        }
        default: {
            // Unknown opcode, halt for safety
            vm_memory[HALT_INDEX] = 1u;
        }
    }

    vm_memory[PC_INDEX] = next_pc;
}
