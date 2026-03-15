// Glyph VM Scheduler - Multi-Tasking GPU Execution Layer
//
// Runs multiple Glyph VMs in parallel using pre-allocated slots.
// SPATIAL_SPAWN creates new VMs by allocating free slots.
// Time-slicing scheduler ensures fair execution across all active VMs.

// ============================================================================
// CONSTANTS
// ============================================================================

const MAX_VMS: u32 = 8u;           // Maximum concurrent VMs
const MAX_CYCLES_PER_VM: u32 = 1024u;
 // Cycles per VM per frame
const STACK_SIZE: u32 = 64u;        // Stack entries per VM
const REG_COUNT: u32 = 128u;        // General purpose registers
const GRID_SIZE: u32 = 4096u;       // .rts.png dimension

// Opcodes
const OP_NOP: u32    = 0u;
const OP_LDI: u32    = 1u;  // Load Immediate 32-bit (uses 2 pixels)
const OP_MOV: u32    = 2u;
const OP_LOAD: u32   = 3u;  // regs[p2] = memory[regs[p1]]
const OP_STORE: u32  = 4u;  // memory[regs[p1]] = regs[p2]
const OP_ADD: u32    = 5u;
const OP_SUB: u32    = 6u;
const OP_MUL: u32    = 7u;
const OP_DIV: u32    = 8u;
const OP_JMP: u32    = 9u;  // pc = regs[p1]
const OP_BRANCH: u32 = 10u; // if (regs[p1] op regs[p2]) pc = next_pixel (immediate)
const OP_CALL: u32   = 11u;
const OP_RETURN: u32 = 12u;
const OP_HALT: u32   = 13u;
const OP_DATA: u32   = 14u;
const OP_LOOP: u32   = 15u;
const OP_JAL: u32    = 16u; // regs[p1] = pc + 2, pc = next_pixel (immediate)

// AI-Native / Bitwise (128-255)
const OP_AND: u32    = 128u;
const OP_OR: u32     = 129u;
const OP_XOR: u32    = 130u;
const OP_SHL: u32    = 131u;
const OP_SHR: u32    = 132u;
const OP_SAR: u32    = 133u;
const OP_SPATIAL_SPAWN: u32 = 225u;
const OP_GLYPH_MUTATE: u32  = 226u;
const OP_GLYPH_WRITE: u32   = 232u;  // Write glyphs into RAM (self-modifying code)

// Memory-based opcodes (200-227) - for compiled programs
const OP2_NOP: u32 = 200u;
const OP2_ADD: u32 = 201u;
const OP2_SUB: u32 = 202u;
const OP2_MUL: u32 = 203u;
const OP2_DIV: u32 = 204u;
const OP2_LOAD: u32 = 205u;
const OP2_STORE: u32 = 206u;
const OP2_LOADIMM: u32 = 207u;
const OP2_JUMP: u32 = 208u;
const OP2_JUMPZ: u32 = 209u;
const OP2_JUMPNZ: u32 = 210u;
const OP2_CMP: u32 = 211u;
const OP2_AND: u32 = 212u;
const OP2_OR: u32 = 213u;
const OP2_XOR: u32 = 214u;
const OP2_NOT: u32 = 215u;
const OP2_SHL: u32 = 216u;
const OP2_SHR: u32 = 217u;
const OP2_CALL: u32 = 218u;
const OP2_RET: u32 = 219u;
const OP2_PUSH: u32 = 220u;
const OP2_POP: u32 = 221u;
const OP2_READ: u32 = 222u;
const OP2_WRITE: u32 = 223u;
const OP2_SYNC: u32 = 224u;
const OP2_ATOMIC: u32 = 225u;
const OP2_FADD: u32 = 228u;
const OP2_FMUL: u32 = 229u;

// Strata
const STRATUM_SUBSTRATE: u32 = 0u;
const STRATUM_MEMORY: u32    = 1u;
const STRATUM_LOGIC: u32     = 2u;

// VM States
const VM_STATE_INACTIVE: u32 = 0u;
const VM_STATE_RUNNING: u32  = 1u;
const VM_STATE_HALTED: u32   = 2u;

// ============================================================================
// DATA STRUCTURES
// ============================================================================

struct VmState {
    regs: array<u32, 128>,
    pc: u32, halted: u32, stratum: u32, cycles: u32, stack_ptr: u32,
    vm_id: u32, state: u32, parent_id: u32, entry_point: u32,
    base_addr: u32, bound_addr: u32, _padding: u32,
    stack: array<u32, 64>,
}

struct SchedulerState {
    active_count: u32, frame: u32, spawn_count: u32, current_vm: u32,
    _padding: array<u32, 4>,
}

// ============================================================================
// BINDINGS
// ============================================================================

@group(0) @binding(0) var ram: texture_storage_2d<rgba8uint, read_write>;
@group(0) @binding(1) var<storage, read_write> vms: array<VmState, 8>;
@group(0) @binding(2) var<storage, read_write> scheduler: SchedulerState;
@group(0) @binding(3) var<storage, read_write> mailboxes: array<vec4<u32>, 32>;
@group(0) @binding(4) var<storage, read> event_header: vec4<u32>; // [head, tail, cap, _]
@group(0) @binding(5) var<storage, read> event_queue: array<vec4<u32>, 1024>;

// ============================================================================
// HELPERS
// ============================================================================

fn d2xy(n: u32, d_in: u32) -> vec2<u32> {
    var x = 0u; var y = 0u; var s = 1u; var d = d_in;
    while (s < n) {
        let rx = 1u & (d / 2u);
        let ry = 1u & (d ^ rx);
        if (ry == 0u) {
            if (rx == 1u) { x = s - 1u - x; y = s - 1u - y; }
            let t = x; x = y; y = t;
        }
        x += s * rx; y += s * ry; d /= 4u; s *= 2u;
    }
    return vec2<u32>(x, y);
}

fn check_spatial_bounds(vm_idx: u32, addr: u32) -> bool {
    let bound = vms[vm_idx].bound_addr;
    if (bound == 0u) { return true; }
    return addr >= vms[vm_idx].base_addr && addr < bound;
}

// Read 32-bit value from memory at Hilbert address
fn mem_read(addr: u32) -> u32 {
    let coords = d2xy(GRID_SIZE, addr);
    let glyph = textureLoad(ram, vec2<i32>(i32(coords.x), i32(coords.y)));
    return glyph.r | (glyph.g << 8u) | (glyph.b << 16u) | (glyph.a << 24u);
}

// Write 32-bit value to memory at Hilbert address
fn mem_write(addr: u32, val: u32) {
    let coords = d2xy(GRID_SIZE, addr);
    textureStore(ram, vec2<i32>(i32(coords.x), i32(coords.y)),
                vec4<u32>(val & 0xFFu, (val >> 8u) & 0xFFu, (val >> 16u) & 0xFFu, (val >> 24u) & 0xFFu));
}

fn execute_instruction(vm_idx: u32) {
    if (vms[vm_idx].state != VM_STATE_RUNNING) { return; }
    let coords = d2xy(GRID_SIZE, vms[vm_idx].pc);
    let glyph = textureLoad(ram, vec2<i32>(i32(coords.x), i32(coords.y)));
    let opcode = glyph.r; let stratum = glyph.g; let p1 = glyph.b; let p2 = glyph.a;
    vms[vm_idx].cycles = vms[vm_idx].cycles + 1u;
    switch (opcode) {
        case 0u: { vms[vm_idx].pc = vms[vm_idx].pc + 1u; }
        case 1u: { // LDI
            let d_coords = d2xy(GRID_SIZE, vms[vm_idx].pc + 1u);
            let d_glyph = textureLoad(ram, vec2<i32>(i32(d_coords.x), i32(d_coords.y)));
            vms[vm_idx].regs[p1] = d_glyph.r | (d_glyph.g << 8u) | (d_glyph.b << 16u) | (d_glyph.a << 24u);
            vms[vm_idx].pc = vms[vm_idx].pc + 2u;
        }
        case 2u: { vms[vm_idx].regs[p2] = vms[vm_idx].regs[p1]; vms[vm_idx].pc = vms[vm_idx].pc + 1u; }
        case 3u: { // LOAD
            let addr = vms[vm_idx].regs[p1];
            if (!check_spatial_bounds(vm_idx, addr)) { vms[vm_idx].state = VM_STATE_HALTED; return; }
            let a_coords = d2xy(GRID_SIZE, addr);
            let val_p = textureLoad(ram, vec2<i32>(i32(a_coords.x), i32(a_coords.y)));
            vms[vm_idx].regs[p2] = val_p.r | (val_p.g << 8u) | (val_p.b << 16u) | (val_p.a << 24u);
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 4u: { // STORE
            let addr = vms[vm_idx].regs[p1];
            if (!check_spatial_bounds(vm_idx, addr)) { vms[vm_idx].state = VM_STATE_HALTED; return; }
            let val = vms[vm_idx].regs[p2];
            let a_coords = d2xy(GRID_SIZE, addr);
            textureStore(ram, vec2<i32>(i32(a_coords.x), i32(a_coords.y)),
                        vec4<u32>(val & 0xFFu, (val >> 8u) & 0xFFu, (val >> 16u) & 0xFFu, (val >> 24u) & 0xFFu));
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 5u: { vms[vm_idx].regs[p2] = vms[vm_idx].regs[p1] + vms[vm_idx].regs[p2]; vms[vm_idx].pc = vms[vm_idx].pc + 1u; }
        case 6u: { vms[vm_idx].regs[p2] = vms[vm_idx].regs[p1] - vms[vm_idx].regs[p2]; vms[vm_idx].pc = vms[vm_idx].pc + 1u; }
        case 9u: { // JMP: stratum determines mode
            if (stratum == 2u) {
                // Immediate mode: p1 contains target address directly
                vms[vm_idx].pc = u32(p1) | (u32(p2) << 8u);
            } else {
                // Register mode: pc = regs[p1]
                vms[vm_idx].pc = vms[vm_idx].regs[p1];
            }
        }
        case 10u: { // BRANCH: stratum=cond, p1=rs1, p2=rs2, next_pixel=target
            let v1 = vms[vm_idx].regs[p1];
            let v2 = vms[vm_idx].regs[p2];
            var take_branch = false;
            switch (stratum) {
                case 0u: { take_branch = (v1 == v2); }      // BEQ
                case 1u: { take_branch = (v1 != v2); }      // BNE
                case 2u: { take_branch = (i32(v1) < i32(v2)); } // BLT
                case 3u: { take_branch = (i32(v1) >= i32(v2)); } // BGE
                case 4u: { take_branch = (v1 < v2); }       // BLTU
                case 5u: { take_branch = (v1 >= v2); }      // BGEU
                default: { take_branch = false; }
            }
            if (take_branch) {
                vms[vm_idx].pc = mem_read(vms[vm_idx].pc + 1u);
            } else {
                vms[vm_idx].pc = vms[vm_idx].pc + 2u;
            }
        }
        case 11u: {
            if (vms[vm_idx].stack_ptr < STACK_SIZE) {
                vms[vm_idx].stack[vms[vm_idx].stack_ptr] = vms[vm_idx].pc + 1u;
                vms[vm_idx].stack_ptr = vms[vm_idx].stack_ptr + 1u;
                vms[vm_idx].pc = vms[vm_idx].regs[p1];
            } else { vms[vm_idx].state = VM_STATE_HALTED; }
        }
        case 12u: {
            if (vms[vm_idx].stack_ptr > 0u) {
                vms[vm_idx].stack_ptr = vms[vm_idx].stack_ptr - 1u;
                vms[vm_idx].pc = vms[vm_idx].stack[vms[vm_idx].stack_ptr];
            } else { vms[vm_idx].state = VM_STATE_HALTED; }
        }
        case 13u: { vms[vm_idx].state = VM_STATE_HALTED; vms[vm_idx].halted = 1u; }
        case 14u: { vms[vm_idx].pc = vms[vm_idx].pc + 1u; } // DATA: passive (skip)
        case 15u: { vms[vm_idx].pc = vms[vm_idx].pc + 1u; } // LOOP: stub
        case 16u: { // JAL: regs[p1] = return_addr, pc = target (immediate)
            vms[vm_idx].regs[p1] = vms[vm_idx].pc + 2u;
            vms[vm_idx].pc = mem_read(vms[vm_idx].pc + 1u);
        }
        case 128u: { vms[vm_idx].regs[p2] = vms[vm_idx].regs[p1] & vms[vm_idx].regs[p2]; vms[vm_idx].pc = vms[vm_idx].pc + 1u; }
        case 129u: { vms[vm_idx].regs[p2] = vms[vm_idx].regs[p1] | vms[vm_idx].regs[p2]; vms[vm_idx].pc = vms[vm_idx].pc + 1u; }
        case 130u: { vms[vm_idx].regs[p2] = vms[vm_idx].regs[p1] ^ vms[vm_idx].regs[p2]; vms[vm_idx].pc = vms[vm_idx].pc + 1u; }
        case 131u: { vms[vm_idx].regs[p2] = vms[vm_idx].regs[p1] << (vms[vm_idx].regs[p2] & 31u); vms[vm_idx].pc = vms[vm_idx].pc + 1u; }
        case 132u: { vms[vm_idx].regs[p2] = vms[vm_idx].regs[p1] >> (vms[vm_idx].regs[p2] & 31u); vms[vm_idx].pc = vms[vm_idx].pc + 1u; }
        case 226u: { // OP_GLYPH_MUTATE: p1=act_reg, p2=addr_reg
            let activation = vms[vm_idx].regs[p1];
            let post_act = vms[vm_idx].regs[(p1 + 1u) % 128u];
            let weight_addr = vms[vm_idx].regs[p2];
            let current_weight = mem_read(weight_addr);
            let learning_rate = 1u; 
            let delta = u32(f32(activation) * f32(post_act) * f32(learning_rate) / 256.0);
            let new_weight = select(current_weight + delta, current_weight - delta, (current_weight > 0x80000000u)); 
            mem_write(weight_addr, new_weight);
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 225u: {
            let ep = vms[vm_idx].regs[p1];
            for (var i = 0u; i < MAX_VMS; i++) {
                if (vms[i].state == VM_STATE_INACTIVE) {
                    vms[i].vm_id = i; vms[i].entry_point = ep; vms[i].pc = ep; vms[i].state = VM_STATE_RUNNING;
                    vms[i].base_addr = vms[vm_idx].base_addr; vms[i].bound_addr = vms[vm_idx].bound_addr;
                    scheduler.active_count = scheduler.active_count + 1u;
                    vms[vm_idx].regs[p1] = i; return;
                }
            }
            vms[vm_idx].regs[p1] = 0xFFFFFFFFu; vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        // Memory-based opcodes (200-227) - encoding: R=opcode, G=dst, B=src1, A=src2
        case 200u: { vms[vm_idx].pc = vms[vm_idx].pc + 1u; } // NOP
        case 201u: { // ADD: mem[dst] = mem[src1] + mem[src2]
            let v1 = mem_read(u32(p1)); let v2 = mem_read(u32(p2));
            mem_write(u32(stratum), v1 + v2);
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 202u: { // SUB: mem[dst] = mem[src1] - mem[src2]
            let v1 = mem_read(u32(p1)); let v2 = mem_read(u32(p2));
            mem_write(u32(stratum), v1 - v2);
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 203u: { // MUL: mem[dst] = mem[src1] * mem[src2]
            let v1 = mem_read(u32(p1)); let v2 = mem_read(u32(p2));
            mem_write(u32(stratum), v1 * v2);
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 204u: { // DIV: mem[dst] = mem[src1] / mem[src2]
            let v1 = mem_read(u32(p1)); let v2 = mem_read(u32(p2));
            if (v2 != 0u) { mem_write(u32(stratum), v1 / v2); }
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 205u: { // LOAD: mem[dst] = mem[src1]
            let v = mem_read(u32(p1));
            mem_write(u32(stratum), v);
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 206u: { // STORE: mem[dst] = src1 (immediate)
            mem_write(u32(stratum), u32(p1));
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 207u: { // LOADIMM: mem[dst] = 32-bit immediate (next pixel)
            let d_coords = d2xy(GRID_SIZE, vms[vm_idx].pc + 1u);
            let d_glyph = textureLoad(ram, vec2<i32>(i32(d_coords.x), i32(d_coords.y)));
            let imm = d_glyph.r | (d_glyph.g << 8u) | (d_glyph.b << 16u) | (d_glyph.a << 24u);
            mem_write(u32(stratum), imm);
            vms[vm_idx].pc = vms[vm_idx].pc + 2u;
        }
        case 208u: { // JUMP: pc = dst
            vms[vm_idx].pc = u32(stratum);
        }
        case 209u: { // JUMPZ: if mem[dst] == 0 then pc = src1 else pc++
            let v = mem_read(u32(stratum));
            if (v == 0u) { vms[vm_idx].pc = u32(p1); } else { vms[vm_idx].pc = vms[vm_idx].pc + 1u; }
        }
        case 210u: { // JUMPNZ: if mem[dst] != 0 then pc = src1 else pc++
            let v = mem_read(u32(stratum));
            if (v != 0u) { vms[vm_idx].pc = u32(p1); } else { vms[vm_idx].pc = vms[vm_idx].pc + 1u; }
        }
        case 211u: { // CMP: mem[dst] = (mem[src1] == mem[src2]) ? 1 : 0
            let v1 = mem_read(u32(p1)); let v2 = mem_read(u32(p2));
            mem_write(u32(stratum), select(0u, 1u, v1 == v2));
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 212u: { // AND: mem[dst] = mem[src1] & mem[src2]
            let v1 = mem_read(u32(p1)); let v2 = mem_read(u32(p2));
            mem_write(u32(stratum), v1 & v2);
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 213u: { // OR: mem[dst] = mem[src1] | mem[src2]
            let v1 = mem_read(u32(p1)); let v2 = mem_read(u32(p2));
            mem_write(u32(stratum), v1 | v2);
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 214u: { // XOR: mem[dst] = mem[src1] ^ mem[src2]
            let v1 = mem_read(u32(p1)); let v2 = mem_read(u32(p2));
            mem_write(u32(stratum), v1 ^ v2);
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 215u: { // NOT: mem[dst] = ~mem[src1]
            let v = mem_read(u32(p1));
            mem_write(u32(stratum), ~v);
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 216u: { // SHL: mem[dst] = mem[src1] << mem[src2]
            let v1 = mem_read(u32(p1)); let v2 = mem_read(u32(p2));
            mem_write(u32(stratum), v1 << (v2 & 31u));
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 217u: { // SHR: mem[dst] = mem[src1] >> mem[src2]
            let v1 = mem_read(u32(p1)); let v2 = mem_read(u32(p2));
            mem_write(u32(stratum), v1 >> (v2 & 31u));
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 218u: { // CALL: push pc+1, pc = dst
            if (vms[vm_idx].stack_ptr < STACK_SIZE) {
                vms[vm_idx].stack[vms[vm_idx].stack_ptr] = vms[vm_idx].pc + 1u;
                vms[vm_idx].stack_ptr = vms[vm_idx].stack_ptr + 1u;
                vms[vm_idx].pc = u32(stratum);
            } else { vms[vm_idx].state = VM_STATE_HALTED; }
        }
        case 219u: { // RET: pop pc
            if (vms[vm_idx].stack_ptr > 0u) {
                vms[vm_idx].stack_ptr = vms[vm_idx].stack_ptr - 1u;
                vms[vm_idx].pc = vms[vm_idx].stack[vms[vm_idx].stack_ptr];
            } else { vms[vm_idx].state = VM_STATE_HALTED; }
        }
        case 220u: { // PUSH: mem[sp++] = mem[dst]
            let sp_addr = 0xF000u + vms[vm_idx].stack_ptr;
            mem_write(sp_addr, mem_read(u32(stratum)));
            vms[vm_idx].stack_ptr = vms[vm_idx].stack_ptr + 1u;
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 221u: { // POP: mem[dst] = mem[--sp]
            if (vms[vm_idx].stack_ptr > 0u) {
                vms[vm_idx].stack_ptr = vms[vm_idx].stack_ptr - 1u;
                let sp_addr = 0xF000u + vms[vm_idx].stack_ptr;
                mem_write(u32(stratum), mem_read(sp_addr));
            }
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 222u: { // READ: mem[dst] = mem[src1] (alias for LOAD)
            let v = mem_read(u32(p1));
            mem_write(u32(stratum), v);
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 223u: { // WRITE: mem[dst] = mem[src1] (alias for STORE via memory)
            let v = mem_read(u32(p1));
            mem_write(u32(stratum), v);
             vms[vm_idx].pc = vms[vm_idx].pc + 1u;
         }
         case 233u: { // ATTENTION_FOCUS: Mark active regions for sparse execution
              // TODO: Implement attention masking when scheduler struct supports it
              vms[vm_idx].pc = vms[vm_idx].pc + 1u;
         }

         case 228u: { // FADD: mem[dst] = bitcast<f32>(mem[src1]) + bitcast<f32>(mem[src2])
            let v1 = mem_read(u32(p1)); let v2 = mem_read(u32(p2));
            // For now, just do integer add (float support would need bitcast)
            mem_write(u32(stratum), v1 + v2);
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 229u: { // FMUL: mem[dst] = bitcast<f32>(mem[src1]) * bitcast<f32>(mem[src2])
            let v1 = mem_read(u32(p1)); let v2 = mem_read(u32(p2));
            // For now, just do integer mul (float support would need bitcast)
            mem_write(u32(stratum), v1 * v2);
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 232u: { // GLYPH_WRITE: Write glyph(s) into RAM (self-modifying code)
            // stratum = target address, p1 = source address, p2 = count (0 = single)
            let target_addr = u32(stratum);
            let src_addr = u32(p1);
            let count = u32(p2);

            if (count == 0u) {
                // Single glyph: copy 4 bytes from src to target
                let glyph_val = mem_read(src_addr);
                mem_write(target_addr, glyph_val);
            } else {
                // Block copy: copy count * 1 pixels
                for (var i = 0u; i < count; i++) {
                    let glyph_val = mem_read(src_addr + i);
                    mem_write(target_addr + i, glyph_val);
                }
            }
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
         }
        case 233u: { // ATTENTION_FOCUS: Mark active regions for sparse execution
            // stratum = start_addr, p1 = end_addr, p2 = vm_id (optional)
            let mask_idx = u32(inst.dst) / 32u;
            let bit_idx = u32(inst.dst) % 32u;
            if (bit_idx < 32u) {
                scheduler.attention_mask = scheduler.attention_mask | (1u << bit_idx);
            } else {
                scheduler.attention_mask = scheduler.attention_mask & ~(1u << bit_idx);
            }
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
        case 234u: { // GLYPH_MUTATE: Single-field glyph modification
            // stratum = target_addr, p1 = field_offset, p2 = new_value
            let target_addr = u32(inst.stratum);
            let field_offset = u32(inst.p1);
            let new_value = inst.p2;

            // Read current glyph
            let current_glyph = mem_read(target_addr);

            // Modify single byte
            var modified = current_glyph;
            if (field_offset == 0u) {
                modified = (modified & 0xFFFFFF00u) | (u32(new_value) & 0xFFu);
            } else if (field_offset == 1u) {
                modified = (modified & 0xFFFF00FFu) | ((u32(new_value) & 0xFFu) << 8u);
            } else if (field_offset == 2u) {
                modified = (modified & 0xFF00FFFFu) | ((u32(new_value) & 0xFFu) << 16u);
            } else if (field_offset == 3u) {
                modified = (modified & 0x00FFFFFFu) | ((u32(new_value) & 0xFFu) << 24u);
            }

            mem_write(target_addr, modified);
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }

         default: {
            vms[vm_idx].pc = vms[vm_idx].pc + 1u;
        }
    } // end switch
} // end fn

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) id: vec3<u32>) {
    if (id.x > 0u) { return; }
    for (var i = 0u; i < MAX_VMS; i++) {
        if (vms[i].state == VM_STATE_RUNNING) {
            for (var c = 0u; c < MAX_CYCLES_PER_VM; c++) {
                if (vms[i].state != VM_STATE_RUNNING) { break; }
                execute_instruction(i);
            }
        }
    }
    scheduler.frame = scheduler.frame + 1u;
}
