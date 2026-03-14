// Glyph VM Scheduler - Multi-Tasking GPU Execution Layer
//
// Runs multiple Glyph VMs in parallel using pre-allocated slots.
// SPATIAL_SPAWN creates new VMs by allocating free slots.
// Time-slicing scheduler ensures fair execution across all active VMs.

// ============================================================================
// CONSTANTS
// ============================================================================

const MAX_VMS: u32 = 8u;           // Maximum concurrent VMs
const MAX_CYCLES_PER_VM: u32 = 64u; // Cycles per VM per frame
const STACK_SIZE: u32 = 64u;        // Stack entries per VM
const REG_COUNT: u32 = 32u;         // General purpose registers
const GRID_SIZE: u32 = 4096u;       // .rts.png dimension

// Opcodes (0-15) - Logic Stratum
const OP_NOP: u32    = 0u;
const OP_ALLOC: u32  = 1u;
const OP_FREE: u32   = 2u;
const OP_LOAD: u32   = 3u;
const OP_STORE: u32  = 4u;
const OP_ADD: u32    = 5u;
const OP_SUB: u32    = 6u;
const OP_MUL: u32    = 7u;
const OP_DIV: u32    = 8u;
const OP_JMP: u32    = 9u;
const OP_BRANCH: u32 = 10u;
const OP_CALL: u32   = 11u;
const OP_RETURN: u32 = 12u;
const OP_HALT: u32   = 13u;
const OP_DATA: u32   = 14u;
const OP_LOOP: u32   = 15u;

// AI-Native / Substrate Opcodes (220-227)
const OP_SPATIAL_SPAWN: u32 = 225u;
const OP_GLYPH_MUTATE: u32  = 226u;
const OP_YIELD: u32         = 227u;  // New: yield CPU to scheduler

// Strata
const STRATUM_SUBSTRATE: u32 = 0u;
const STRATUM_MEMORY: u32    = 1u;
const STRATUM_LOGIC: u32     = 2u;
const STRATUM_SPEC: u32      = 3u;
const STRATUM_INTENT: u32    = 4u;

// VM States
const VM_STATE_INACTIVE: u32 = 0u;
const VM_STATE_RUNNING: u32  = 1u;
const VM_STATE_HALTED: u32   = 2u;
const VM_STATE_WAITING: u32  = 3u;  // Waiting for event/message

// ============================================================================
// DATA STRUCTURES
// ============================================================================

/// Single VM instance state
struct VmState {
    regs: array<u32, 32>,      // General purpose registers
    pc: u32,                    // Program counter (Hilbert index)
    halted: u32,                // Halt flag
    stratum: u32,               // Current stratum
    cycles: u32,                // Total cycles executed
    stack_ptr: u32,             // Stack pointer
    vm_id: u32,                 // VM slot ID (0-7)
    state: u32,                 // VM_STATE_* constant
    parent_id: u32,             // Parent VM that spawned this (0xFF = none)
    entry_point: u32,           // Initial PC for restart
    _padding: array<u32, 2>,
    stack: array<u32, 64>,      // Call stack
}

/// Scheduler state
struct SchedulerState {
    active_count: u32,          // Number of active VMs
    current_vm: u32,            // Currently executing VM
    frame: u32,                 // Frame counter
    spawn_count: u32,           // Total spawns this session
    round_robin_idx: u32,       // Next VM to schedule
    _padding: array<u32, 3>,
}

/// Inter-VM message queue (mailboxes)
struct MessageQueue {
    // Each VM has a mailbox of 4 messages
    // Message format: [sender_id, msg_type, data1, data2]
    mailboxes: array<vec4<u32>, 32>,  // 8 VMs * 4 messages each
    mailbox_head: array<u32, 8>,       // Head pointer per VM
    mailbox_tail: array<u32, 8>,       // Tail pointer per VM
}

// ============================================================================
// BINDINGS
// ============================================================================

@group(0) @binding(0) var ram: texture_storage_2d<rgba8uint, read_write>;
@group(0) @binding(1) var<storage, read_write> vms: array<VmState, 8>;
@group(0) @binding(2) var<storage, read_write> scheduler: SchedulerState;
@group(0) @binding(3) var<storage, read_write> messages: MessageQueue;

// ============================================================================
// HILBERT CURVE (d to xy)
// ============================================================================

fn d2xy(n: u32, d_in: u32) -> vec2<u32> {
    var x = 0u;
    var y = 0u;
    var s = 1u;
    var d = d_in;
    while (s < n) {
        let rx = 1u & (d / 2u);
        let ry = 1u & (d ^ rx);
        if (ry == 0u) {
            if (rx == 1u) {
                x = s - 1u - x;
                y = s - 1u - y;
            }
            let t = x;
            x = y;
            y = t;
        }
        x += s * rx;
        y += s * ry;
        d /= 4u;
        s *= 2u;
    }
    return vec2<u32>(x, y);
}

// ============================================================================
// VM EXECUTION
// ============================================================================

/// Execute one instruction for a VM
fn execute_instruction(vm_idx: u32) {
    var vm = &vms[vm_idx];

    if (vm.state != VM_STATE_RUNNING) {
        return;
    }

    let coords = d2xy(GRID_SIZE, vm.pc);

    // Fetch Glyph: RGBA = (Opcode/Unicode, Stratum, P1, P2)
    let glyph = textureLoad(ram, vec2<i32>(i32(coords.x), i32(coords.y)));

    // Normalize opcode: Unicode 200 + ID -> ID
    var opcode = glyph.r;
    if (opcode >= 200u) {
        opcode = opcode - 200u;
    }

    let stratum = glyph.g;
    let p1 = glyph.b;
    let p2 = glyph.a;

    vm.cycles = vm.cycles + 1u;

    switch (opcode) {
        case OP_NOP: {
            vm.pc = vm.pc + 1u;
        }
        case OP_ADD: {
            if (p1 < REG_COUNT && p2 < REG_COUNT) {
                vm.regs[p2] = vm.regs[p1] + vm.regs[p2];
            }
            vm.pc = vm.pc + 1u;
        }
        case OP_SUB: {
            if (p1 < REG_COUNT && p2 < REG_COUNT) {
                vm.regs[p2] = vm.regs[p1] - vm.regs[p2];
            }
            vm.pc = vm.pc + 1u;
        }
        case OP_MUL: {
            if (p1 < REG_COUNT && p2 < REG_COUNT) {
                vm.regs[p2] = vm.regs[p1] * vm.regs[p2];
            }
            vm.pc = vm.pc + 1u;
        }
        case OP_DIV: {
            if (p1 < REG_COUNT && p2 < REG_COUNT && vm.regs[p2] != 0u) {
                vm.regs[p2] = vm.regs[p1] / vm.regs[p2];
            }
            vm.pc = vm.pc + 1u;
        }
        case OP_LOAD: {
            let addr_coords = d2xy(GRID_SIZE, vm.regs[p1]);
            let val = textureLoad(ram, vec2<i32>(i32(addr_coords.x), i32(addr_coords.y)));
            vm.regs[p2] = val.r;
            vm.pc = vm.pc + 1u;
        }
        case OP_STORE: {
            let addr_coords = d2xy(GRID_SIZE, vm.regs[p1]);
            textureStore(ram, vec2<i32>(i32(addr_coords.x), i32(addr_coords.y)),
                        vec4<u32>(vm.regs[p2], STRATUM_MEMORY, 0u, 255u));
            vm.pc = vm.pc + 1u;
        }
        case OP_JMP: {
            vm.pc = vm.regs[p1];
        }
        case OP_BRANCH: {
            if (vm.regs[p1] == 0u) {
                vm.pc = vm.regs[p2];
            } else {
                vm.pc = vm.pc + 1u;
            }
        }
        case OP_CALL: {
            if (vm.stack_ptr < STACK_SIZE) {
                vm.stack[vm.stack_ptr] = vm.pc + 1u;
                vm.stack_ptr = vm.stack_ptr + 1u;
                vm.pc = vm.regs[p1];
            } else {
                vm.state = VM_STATE_HALTED;
                vm.halted = 2u; // Stack Overflow
            }
        }
        case OP_RETURN: {
            if (vm.stack_ptr > 0u) {
                vm.stack_ptr = vm.stack_ptr - 1u;
                vm.pc = vm.stack[vm.stack_ptr];
            } else {
                vm.state = VM_STATE_HALTED;
                vm.halted = 3u; // Stack Underflow
            }
        }
        case OP_HALT: {
            vm.state = VM_STATE_HALTED;
            vm.halted = 1u;
        }
        case OP_YIELD: {
            // Yield remaining cycles to scheduler
            // VM stays runnable but gives up this frame
            vm.pc = vm.pc + 1u;
            return; // Early exit triggers scheduler to pick next VM
        }
        case OP_SPATIAL_SPAWN: {
            // Spawn a new VM in a free slot
            // regs[p1] = entry_point for new VM
            // regs[p2] = spawn flags (0 = copy state, 1 = fresh state)
            let entry_point = vm.regs[p1];
            let spawn_flags = vm.regs[p2];

            // Find free slot
            var spawned = false;
            for (var i = 0u; i < MAX_VMS; i++) {
                if (vms[i].state == VM_STATE_INACTIVE) {
                    // Initialize new VM
                    vms[i].vm_id = i;
                    vms[i].parent_id = vm.vm_id;
                    vms[i].entry_point = entry_point;
                    vms[i].pc = entry_point;
                    vms[i].state = VM_STATE_RUNNING;
                    vms[i].halted = 0u;
                    vms[i].cycles = 0u;
                    vms[i].stack_ptr = 0u;
                    vms[i].stratum = STRATUM_LOGIC;

                    if (spawn_flags == 0u) {
                        // Copy parent's registers
                        for (var r = 0u; r < REG_COUNT; r++) {
                            vms[i].regs[r] = vm.regs[r];
                        }
                    } else {
                        // Fresh registers (all zero)
                        for (var r = 0u; r < REG_COUNT; r++) {
                            vms[i].regs[r] = 0u;
                        }
                    }

                    scheduler.active_count = scheduler.active_count + 1u;
                    scheduler.spawn_count = scheduler.spawn_count + 1u;
                    spawned = true;

                    // Return child VM ID in regs[p1]
                    vm.regs[p1] = i;
                    break;
                }
            }

            if (!spawned) {
                // No free slots - set error flag
                vm.regs[p1] = 0xFFFFFFFFu;
            }

            vm.pc = vm.pc + 1u;
        }
        case OP_GLYPH_MUTATE: {
            let addr_coords = d2xy(GRID_SIZE, vm.regs[p1]);
            textureStore(ram, vec2<i32>(i32(addr_coords.x), i32(addr_coords.y)),
                        vec4<u32>(vm.regs[p2], stratum, 0u, 255u));
            vm.pc = vm.pc + 1u;
        }
        default: {
            vm.pc = vm.pc + 1u;
        }
    }
}

// ============================================================================
// SCHEDULER
// ============================================================================

/// Round-robin scheduler - execute each active VM for MAX_CYCLES_PER_VM
fn run_scheduler() {
    var cycles_used: array<u32, 8>;

    // Run each active VM for its time slice
    for (var vm_idx = 0u; vm_idx < MAX_VMS; vm_idx++) {
        if (vms[vm_idx].state == VM_STATE_RUNNING) {
            scheduler.current_vm = vm_idx;

            // Execute up to MAX_CYCLES_PER_VM instructions
            for (var c = 0u; c < MAX_CYCLES_PER_VM; c++) {
                if (vms[vm_idx].state != VM_STATE_RUNNING) {
                    break;
                }
                execute_instruction(vm_idx);
            }
        }
    }

    // Update frame counter
    scheduler.frame = scheduler.frame + 1u;
}

// ============================================================================
// MAIN ENTRY POINT
// ============================================================================

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    // Only thread 0 runs the scheduler
    if (global_id.x > 0u) {
        return;
    }

    run_scheduler();
}
