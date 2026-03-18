// ============================================
// GEOMETRY OS - BOOT INIT SHADER
// Phase 51: Bare-Metal Bootstrap
// This compute shader initializes VRAM without CPU involvement
// after the initial frozen bootstrap.
// ============================================

struct BootConfig {
    editor_addr: u32,
    assembler_addr: u32,
    atlas_base: u32,
    screen_base: u32,
    vm_state_base: u32,
    _pad: vec3<u32>,
};

struct VMState {
    pc: u32,
    sp: u32,
    flags: u32,
    halted: u32,
    cycles: u32,
};

struct Glyph {
    opcode: u32,
    stratum: u32,
    p1: u32,
    p2: u32,
};

@group(0) @binding(0) var<uniform> config: BootConfig;
@group(0) @binding(1) var<storage, read_write> vram: array<Glyph>;
@group(0) @binding(2) var<storage, read_write> vm_states: array<VMState>;

// ============================================
// Initialize VM state region at 0x0000
// ============================================
fn init_vm_state() {
    // VM 0: Editor VM - set entry point to editor_addr
    vm_states[0].pc = config.editor_addr;
    vm_states[0].sp = 0x0400;  // Stack at 0x0400
    vm_states[0].flags = 0;
    vm_states[0].halted = 0;
    vm_states[0].cycles = 0;

    // VM 1-7: Reserved for future use
    for (var i: u32 = 1u; i < 8u; i = i + 1u) {
        vm_states[i].pc = 0u;
        vm_states[i].sp = 0u;
        vm_states[i].flags = 0u;
        vm_states[i].halted = 1u;  // Halted by default
        vm_states[i].cycles = 0u;
    }
}

// ============================================
// Initialize editor state at 0x0100
// ============================================
fn init_editor_state() {
    let base = 0x0100u;
    
    // Cursor position at 0x0100
    vram[base + 0u] = Glyph { opcode: 0u, stratum: 0u, p1: 0u, p2: 0u };
    
    // Buffer length at 0x0101
    vram[base + 1u] = Glyph { opcode: 0u, stratum: 0u, p1: 0u, p2: 0u };
    
    // Editor mode at 0x0102 (0=edit, 1=compile, 2=run)
    vram[base + 2u] = Glyph { opcode: 0u, stratum: 0u, p1: 0u, p2: 0u };
    
    // Status code at 0x0103 (0=ok, 1=error)
    vram[base + 3u] = Glyph { opcode: 0u, stratum: 0u, p1: 0u, p2: 0u };
}

// ============================================
// Initialize mailbox at 0x0200
// ============================================
fn init_mailbox() {
    let base = 0x0200u;
    
    // Event type at 0x0200 (0=none, 1=INSERT, etc.)
    vram[base + 0u] = Glyph { opcode: 0u, stratum: 0u, p1: 0u, p2: 0u };
    
    // Parameter/char at 0x0201
    vram[base + 1u] = Glyph { opcode: 0u, stratum: 0u, p1: 0u, p2: 0u };
    
    // Cursor position at 0x0202
    vram[base + 2u] = Glyph { opcode: 0u, stratum: 0u, p1: 0u, p2: 0u };
}

// ============================================
// Initialize text buffer at 0x1000
// ============================================
fn init_buffer() {
    let base = 0x1000u;
    let size = 0x1000u;  // 4KB buffer
    
    for (var i: u32 = 0u; i < size; i = i + 1u) {
        vram[base + i] = Glyph { opcode: 0u, stratum: 0u, p1: 0u, p2: 0u };
    }
}

// ============================================
// Initialize assembler input at 0x3000
// ============================================
fn init_assembler_input() {
    let base = 0x3000u;
    let size = 0x1000u;
    
    for (var i: u32 = 0u; i < size; i = i + 1u) {
        vram[base + i] = Glyph { opcode: 0u, stratum: 0u, p1: 0u, p2: 0u };
    }
}

// ============================================
// Initialize output region at 0x5000
// ============================================
fn init_output() {
    let base = 0x5000u;
    let size = 0x1000u;
    
    for (var i: u32 = 0u; i < size; i = i + 1u) {
        vram[base + i] = Glyph { opcode: 0u, stratum: 0u, p1: 0u, p2: 0u };
    }
}

// ============================================
// Main entry point
// ============================================
@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    // Only run on workgroup 0
    if (global_id.x != 0u || global_id.y != 0u || global_id.z != 0u) {
        return;
    }

    // Initialize all VRAM regions
    init_vm_state();
    init_editor_state();
    init_mailbox();
    init_buffer();
    init_assembler_input();
    init_output();
}
