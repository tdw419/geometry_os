//! Synthetic VRAM — CPU-side emulator of the Glyph VM
//!
//! A pixel-perfect replica of glyph_vm_scheduler.wgsl that runs entirely on the CPU.
//! Uses a Vec<u32> as "VRAM" instead of a GPU texture. No wgpu needed.
//!
//! This lets you develop, test, and debug Glyph programs without risking GPU hangs
//! or requiring GPU hardware at all.
//!
//! The memory model is identical to the WGSL shader:
//! - 4096×4096 grid of RGBA8 pixels, addressed via Hilbert curve
//! - Each pixel stores one u32 (R | G<<8 | B<<16 | A<<24)
//! - 8 concurrent VMs with 128 registers, 64-entry call stack each

const GRID_SIZE: u32 = 4096;
const MAX_VMS: usize = 8;
const MAX_CYCLES_PER_VM: u32 = 1024;
const STACK_SIZE: usize = 64;
const REG_COUNT: usize = 128;

// VM States
const VM_STATE_INACTIVE: u32 = 0;
const VM_STATE_RUNNING: u32 = 1;
const VM_STATE_HALTED: u32 = 2;

/// VM configuration for spawning
#[derive(Clone, Debug)]
pub struct SyntheticVmConfig {
    pub entry_point: u32,
    pub parent_id: u32,
    pub base_addr: u32,
    pub bound_addr: u32, // 0 = unrestricted
    pub initial_regs: [u32; REG_COUNT],
}

impl Default for SyntheticVmConfig {
    fn default() -> Self {
        Self {
            entry_point: 0,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,
            initial_regs: [0; REG_COUNT],
        }
    }
}

/// Per-VM state, mirrors the WGSL VmState struct exactly
#[derive(Clone, Debug)]
pub struct VmState {
    pub regs: [u32; REG_COUNT],
    pub pc: u32,
    pub halted: u32,
    pub stratum: u32,
    pub cycles: u32,
    pub stack_ptr: u32,
    pub vm_id: u32,
    pub state: u32,
    pub parent_id: u32,
    pub entry_point: u32,
    pub base_addr: u32,
    pub bound_addr: u32,
    pub attention_mask: u32,
    pub stack: [u32; STACK_SIZE],
}

impl Default for VmState {
    fn default() -> Self {
        Self {
            regs: [0; REG_COUNT],
            pc: 0,
            halted: 0,
            stratum: 0,
            cycles: 0,
            stack_ptr: 0,
            vm_id: 0,
            state: VM_STATE_INACTIVE,
            parent_id: 0xFF,
            entry_point: 0,
            base_addr: 0,
            bound_addr: 0,
            attention_mask: 0,
            stack: [0; STACK_SIZE],
        }
    }
}

/// Execution trace entry for debugging
#[derive(Clone, Debug)]
pub struct TraceEntry {
    pub vm_id: usize,
    pub pc: u32,
    pub opcode: u32,
    pub stratum: u32,
    pub p1: u32,
    pub p2: u32,
    pub cycle: u32,
}

/// Synthetic VRAM — the CPU-side Glyph VM emulator
pub struct SyntheticVram {
    /// The pixel grid: 4096×4096 = 16M u32 values
    /// Indexed as vram[y * GRID_SIZE + x]
    vram: Vec<u32>,

    /// 8 VM states
    vms: [VmState; MAX_VMS],

    /// Frame counter
    frame: u32,

    /// Execution trace (optional, for debugging)
    trace: Vec<TraceEntry>,

    /// Whether to record execution trace
    tracing: bool,
}

impl SyntheticVram {
    /// Create a new synthetic VRAM with zeroed memory
    pub fn new() -> Self {
        Self {
            vram: vec![0u32; (GRID_SIZE * GRID_SIZE) as usize],
            vms: Default::default(),
            frame: 0,
            trace: Vec::new(),
            tracing: false,
        }
    }

    /// Create with a smaller grid for faster tests (must be power of 2)
    pub fn new_small(grid_size: u32) -> Self {
        assert!(grid_size.is_power_of_two(), "Grid size must be power of 2");
        Self {
            vram: vec![0u32; (grid_size * grid_size) as usize],
            vms: Default::default(),
            frame: 0,
            trace: Vec::new(),
            tracing: false,
        }
    }

    /// Enable execution tracing
    pub fn enable_tracing(&mut self) {
        self.tracing = true;
        self.trace.clear();
    }

    /// Get the execution trace
    pub fn trace(&self) -> &[TraceEntry] {
        &self.trace
    }

    /// Get the effective grid size
    fn grid_size(&self) -> u32 {
        (self.vram.len() as f64).sqrt() as u32
    }

    // ========================================================================
    // Hilbert curve mapping (identical to WGSL d2xy)
    // ========================================================================

    fn d2xy(&self, d: u32) -> (u32, u32) {
        let n = self.grid_size();
        let mut x = 0u32;
        let mut y = 0u32;
        let mut s = 1u32;
        let mut d = d;

        while s < n {
            let rx = 1 & (d / 2);
            let ry = 1 & (d ^ rx);
            if ry == 0 {
                if rx == 1 {
                    x = s - 1 - x;
                    y = s - 1 - y;
                }
                std::mem::swap(&mut x, &mut y);
            }
            x += s * rx;
            y += s * ry;
            d /= 4;
            s *= 2;
        }

        (x, y)
    }

    // ========================================================================
    // Memory access (identical to WGSL mem_read/mem_write)
    // ========================================================================

    fn mem_read(&self, addr: u32) -> u32 {
        let (x, y) = self.d2xy(addr);
        let n = self.grid_size();
        let idx = (y * n + x) as usize;
        if idx < self.vram.len() {
            self.vram[idx]
        } else {
            0
        }
    }

    fn mem_write(&mut self, addr: u32, val: u32) {
        let (x, y) = self.d2xy(addr);
        let n = self.grid_size();
        let idx = (y * n + x) as usize;
        if idx < self.vram.len() {
            self.vram[idx] = val;
        }
    }

    fn check_spatial_bounds(&self, vm_idx: usize, addr: u32) -> bool {
        let bound = self.vms[vm_idx].bound_addr;
        if bound == 0 {
            return true;
        }
        addr >= self.vms[vm_idx].base_addr && addr < bound
    }

    // ========================================================================
    // Public API (mirrors GlyphVmScheduler)
    // ========================================================================

    /// Write a single u32 at a Hilbert address (the frozen bootstrap)
    pub fn poke(&mut self, addr: u32, val: u32) {
        self.mem_write(addr, val);
    }

    /// Read a single u32 from a Hilbert address
    pub fn peek(&self, addr: u32) -> u32 {
        self.mem_read(addr)
    }

    /// Write a glyph instruction pixel: R=opcode, G=stratum, B=p1, A=p2
    pub fn poke_glyph(&mut self, addr: u32, opcode: u8, stratum: u8, p1: u8, p2: u8) {
        let val = opcode as u32
            | ((stratum as u32) << 8)
            | ((p1 as u32) << 16)
            | ((p2 as u32) << 24);
        self.poke(addr, val);
    }

    /// Spawn a VM in a slot
    pub fn spawn_vm(&mut self, vm_id: usize, config: &SyntheticVmConfig) -> Result<(), String> {
        if vm_id >= MAX_VMS {
            return Err(format!("VM ID {} out of range (max {})", vm_id, MAX_VMS));
        }
        let vm = &mut self.vms[vm_id];
        vm.regs = config.initial_regs;
        vm.pc = config.entry_point;
        vm.halted = 0;
        vm.stratum = 0;
        vm.cycles = 0;
        vm.stack_ptr = 0;
        vm.vm_id = vm_id as u32;
        vm.state = VM_STATE_RUNNING;
        vm.parent_id = config.parent_id;
        vm.entry_point = config.entry_point;
        vm.base_addr = config.base_addr;
        vm.bound_addr = config.bound_addr;
        vm.attention_mask = 0;
        vm.stack = [0; STACK_SIZE];
        Ok(())
    }

    /// Execute one frame (up to MAX_CYCLES_PER_VM per VM)
    pub fn execute_frame(&mut self) {
        self.execute_frame_with_limit(MAX_CYCLES_PER_VM);
    }

    /// Execute with a custom cycle limit
    pub fn execute_frame_with_limit(&mut self, max_cycles: u32) {
        for vm_idx in 0..MAX_VMS {
            if self.vms[vm_idx].state == VM_STATE_RUNNING {
                for _ in 0..max_cycles {
                    if self.vms[vm_idx].state != VM_STATE_RUNNING {
                        break;
                    }
                    self.execute_instruction(vm_idx);
                }
            }
        }
        self.frame += 1;
    }

    /// Step a single instruction on a specific VM (for debugging)
    pub fn step(&mut self, vm_id: usize) -> bool {
        if vm_id >= MAX_VMS || self.vms[vm_id].state != VM_STATE_RUNNING {
            return false;
        }
        self.execute_instruction(vm_id);
        true
    }

    /// Get VM state
    pub fn vm_state(&self, vm_id: usize) -> Option<&VmState> {
        if vm_id < MAX_VMS {
            Some(&self.vms[vm_id])
        } else {
            None
        }
    }

    /// Get mutable VM state
    pub fn vm_state_mut(&mut self, vm_id: usize) -> Option<&mut VmState> {
        if vm_id < MAX_VMS {
            Some(&mut self.vms[vm_id])
        } else {
            None
        }
    }

    /// Check if a VM has halted
    pub fn is_halted(&self, vm_id: usize) -> bool {
        vm_id < MAX_VMS && self.vms[vm_id].state == VM_STATE_HALTED
    }

    /// Get the current frame number
    pub fn frame_count(&self) -> u32 {
        self.frame
    }

    /// Reset all VMs and optionally clear VRAM
    pub fn reset(&mut self, clear_vram: bool) {
        self.vms = Default::default();
        self.frame = 0;
        self.trace.clear();
        if clear_vram {
            self.vram.fill(0);
        }
    }

    /// Dump a range of memory (for debugging)
    pub fn dump_range(&self, start: u32, count: u32) -> Vec<(u32, u32)> {
        (start..start + count)
            .map(|addr| (addr, self.mem_read(addr)))
            .collect()
    }

    /// Get raw VRAM slice (for advanced inspection)
    pub fn vram(&self) -> &[u32] {
        &self.vram
    }

    // ========================================================================
    // Instruction execution (pixel-perfect match to WGSL)
    // ========================================================================

    fn execute_instruction(&mut self, vm_idx: usize) {
        if self.vms[vm_idx].state != VM_STATE_RUNNING {
            return;
        }

        let pc = self.vms[vm_idx].pc;
        let pixel = self.mem_read(pc);

        // Decode: R=opcode, G=stratum, B=p1, A=p2
        let opcode = pixel & 0xFF;
        let stratum = (pixel >> 8) & 0xFF;
        let p1 = (pixel >> 16) & 0xFF;
        let p2 = (pixel >> 24) & 0xFF;

        if self.tracing {
            self.trace.push(TraceEntry {
                vm_id: vm_idx,
                pc,
                opcode,
                stratum,
                p1,
                p2,
                cycle: self.vms[vm_idx].cycles,
            });
        }

        self.vms[vm_idx].cycles += 1;

        match opcode {
            // NOP
            0 => {
                self.vms[vm_idx].pc += 1;
            }

            // LDI — Load Immediate 32-bit (uses 2 pixels)
            1 => {
                let data = self.mem_read(pc + 1);
                self.vms[vm_idx].regs[p1 as usize] = data;
                self.vms[vm_idx].pc += 2;
            }

            // MOV — regs[p2] = regs[p1]
            2 => {
                self.vms[vm_idx].regs[p2 as usize] = self.vms[vm_idx].regs[p1 as usize];
                self.vms[vm_idx].pc += 1;
            }

            // LOAD — regs[p2] = memory[regs[p1]]
            3 => {
                let addr = self.vms[vm_idx].regs[p1 as usize];
                if !self.check_spatial_bounds(vm_idx, addr) {
                    self.vms[vm_idx].state = VM_STATE_HALTED;
                    return;
                }
                let val = self.mem_read(addr);
                self.vms[vm_idx].regs[p2 as usize] = val;
                self.vms[vm_idx].pc += 1;
            }

            // STORE — memory[regs[p1]] = regs[p2]
            4 => {
                let addr = self.vms[vm_idx].regs[p1 as usize];
                if !self.check_spatial_bounds(vm_idx, addr) {
                    self.vms[vm_idx].state = VM_STATE_HALTED;
                    return;
                }
                let val = self.vms[vm_idx].regs[p2 as usize];
                self.mem_write(addr, val);
                self.vms[vm_idx].pc += 1;
            }

            // ADD — regs[p2] = regs[p1] + regs[p2]
            5 => {
                let v1 = self.vms[vm_idx].regs[p1 as usize];
                let v2 = self.vms[vm_idx].regs[p2 as usize];
                self.vms[vm_idx].regs[p2 as usize] = v1.wrapping_add(v2);
                self.vms[vm_idx].pc += 1;
            }

            // SUB — regs[p2] = regs[p1] - regs[p2]
            6 => {
                let v1 = self.vms[vm_idx].regs[p1 as usize];
                let v2 = self.vms[vm_idx].regs[p2 as usize];
                self.vms[vm_idx].regs[p2 as usize] = v1.wrapping_sub(v2);
                self.vms[vm_idx].pc += 1;
            }

            // MUL — regs[p2] = regs[p1] * regs[p2]
            7 => {
                let v1 = self.vms[vm_idx].regs[p1 as usize];
                let v2 = self.vms[vm_idx].regs[p2 as usize];
                self.vms[vm_idx].regs[p2 as usize] = v1.wrapping_mul(v2);
                self.vms[vm_idx].pc += 1;
            }

            // DIV — regs[p2] = regs[p1] / regs[p2]
            8 => {
                let v2 = self.vms[vm_idx].regs[p2 as usize];
                if v2 != 0 {
                    let v1 = self.vms[vm_idx].regs[p1 as usize];
                    self.vms[vm_idx].regs[p2 as usize] = v1 / v2;
                }
                self.vms[vm_idx].pc += 1;
            }

            // JMP
            9 => {
                if stratum == 2 {
                    // PC-relative immediate: offset = p1 | p2<<8
                    let offset = (p1 | (p2 << 8)) as i32;
                    self.vms[vm_idx].pc = (pc as i32 + 1 + offset) as u32;
                } else {
                    // Register mode: pc = regs[p1]
                    self.vms[vm_idx].pc = self.vms[vm_idx].regs[p1 as usize];
                }
            }

            // BRANCH — conditional, stratum=cond, p1=rs1, p2=rs2, next pixel=signed offset
            10 => {
                let v1 = self.vms[vm_idx].regs[p1 as usize];
                let v2 = self.vms[vm_idx].regs[p2 as usize];
                let take_branch = match stratum {
                    0 => v1 == v2,              // BEQ
                    1 => v1 != v2,              // BNE
                    2 => (v1 as i32) < (v2 as i32),  // BLT
                    3 => (v1 as i32) >= (v2 as i32),  // BGE
                    4 => v1 < v2,               // BLTU
                    5 => v1 >= v2,              // BGEU
                    _ => false,
                };
                if take_branch {
                    let offset = self.mem_read(pc + 1) as i32;
                    self.vms[vm_idx].pc = (pc as i32 + 2 + offset) as u32;
                } else {
                    self.vms[vm_idx].pc += 2;
                }
            }

            // CALL
            11 => {
                let sp = self.vms[vm_idx].stack_ptr as usize;
                if sp < STACK_SIZE {
                    self.vms[vm_idx].stack[sp] = pc + 1;
                    self.vms[vm_idx].stack_ptr += 1;
                    self.vms[vm_idx].pc = self.vms[vm_idx].regs[p1 as usize];
                } else {
                    self.vms[vm_idx].state = VM_STATE_HALTED;
                }
            }

            // RETURN
            12 => {
                let sp = self.vms[vm_idx].stack_ptr;
                if sp > 0 {
                    self.vms[vm_idx].stack_ptr -= 1;
                    self.vms[vm_idx].pc =
                        self.vms[vm_idx].stack[(sp - 1) as usize];
                } else {
                    self.vms[vm_idx].state = VM_STATE_HALTED;
                }
            }

            // HALT
            13 => {
                self.vms[vm_idx].state = VM_STATE_HALTED;
                self.vms[vm_idx].halted = 1;
            }

            // DATA (skip)
            14 => {
                self.vms[vm_idx].pc += 1;
            }

            // LOOP (stub)
            15 => {
                self.vms[vm_idx].pc += 1;
            }

            // JAL — regs[p1] = return_addr, pc = PC + 2 + signed offset
            16 => {
                self.vms[vm_idx].regs[p1 as usize] = pc + 2;
                let offset = self.mem_read(pc + 1) as i32;
                self.vms[vm_idx].pc = (pc as i32 + 2 + offset) as u32;
            }

            // --- Bitwise (128-133) ---
            128 => {
                // AND
                self.vms[vm_idx].regs[p2 as usize] =
                    self.vms[vm_idx].regs[p1 as usize] & self.vms[vm_idx].regs[p2 as usize];
                self.vms[vm_idx].pc += 1;
            }
            129 => {
                // OR
                self.vms[vm_idx].regs[p2 as usize] =
                    self.vms[vm_idx].regs[p1 as usize] | self.vms[vm_idx].regs[p2 as usize];
                self.vms[vm_idx].pc += 1;
            }
            130 => {
                // XOR
                self.vms[vm_idx].regs[p2 as usize] =
                    self.vms[vm_idx].regs[p1 as usize] ^ self.vms[vm_idx].regs[p2 as usize];
                self.vms[vm_idx].pc += 1;
            }
            131 => {
                // SHL
                let shift = self.vms[vm_idx].regs[p2 as usize] & 31;
                self.vms[vm_idx].regs[p2 as usize] =
                    self.vms[vm_idx].regs[p1 as usize] << shift;
                self.vms[vm_idx].pc += 1;
            }
            132 => {
                // SHR
                let shift = self.vms[vm_idx].regs[p2 as usize] & 31;
                self.vms[vm_idx].regs[p2 as usize] =
                    self.vms[vm_idx].regs[p1 as usize] >> shift;
                self.vms[vm_idx].pc += 1;
            }
            133 => {
                // SAR (arithmetic shift right — preserve sign)
                let shift = self.vms[vm_idx].regs[p2 as usize] & 31;
                self.vms[vm_idx].regs[p2 as usize] =
                    ((self.vms[vm_idx].regs[p1 as usize] as i32) >> shift) as u32;
                self.vms[vm_idx].pc += 1;
            }

            // --- SPATIAL_SPAWN (225) ---
            225 => {
                let ep = self.vms[vm_idx].regs[p1 as usize];
                let mut spawned = false;
                for i in 0..MAX_VMS {
                    if self.vms[i].state == VM_STATE_INACTIVE {
                        self.vms[i].vm_id = i as u32;
                        self.vms[i].entry_point = ep;
                        self.vms[i].pc = ep;
                        self.vms[i].state = VM_STATE_RUNNING;
                        self.vms[i].base_addr = self.vms[vm_idx].base_addr;
                        self.vms[i].bound_addr = self.vms[vm_idx].bound_addr;
                        self.vms[vm_idx].regs[p1 as usize] = i as u32;
                        spawned = true;
                        break;
                    }
                }
                if !spawned {
                    self.vms[vm_idx].regs[p1 as usize] = 0xFFFFFFFF;
                }
                self.vms[vm_idx].pc += 1;
            }

            // --- GLYPH_MUTATE (226) ---
            226 => {
                let activation = self.vms[vm_idx].regs[p1 as usize];
                let post_act = self.vms[vm_idx].regs[((p1 + 1) % 128) as usize];
                let weight_addr = self.vms[vm_idx].regs[p2 as usize];
                let current_weight = self.mem_read(weight_addr);
                let delta = ((activation as f32) * (post_act as f32) / 256.0) as u32;
                let new_weight = if current_weight > 0x80000000 {
                    current_weight.wrapping_sub(delta)
                } else {
                    current_weight.wrapping_add(delta)
                };
                self.mem_write(weight_addr, new_weight);
                self.vms[vm_idx].pc += 1;
            }

            // --- GLYPH_WRITE (232) — Self-modifying code ---
            232 => {
                let target_addr = stratum;
                let src_addr = p1;
                let count = p2;
                if count == 0 {
                    let val = self.mem_read(src_addr);
                    self.mem_write(target_addr, val);
                } else {
                    for i in 0..count {
                        let val = self.mem_read(src_addr + i);
                        self.mem_write(target_addr + i, val);
                    }
                }
                self.vms[vm_idx].pc += 1;
            }

            // --- ATTENTION_FOCUS (233) ---
            233 => {
                let mode = stratum;
                match mode {
                    0 => self.vms[vm_idx].attention_mask = 0,
                    1 => self.vms[vm_idx].attention_mask = p1,
                    2 => self.vms[vm_idx].attention_mask |= p1,
                    3 => self.vms[vm_idx].attention_mask &= !p1,
                    _ => {}
                }
                self.vms[vm_idx].pc += 1;
            }

            // --- GLYPH_MUTATE_FIELD (234) ---
            234 => {
                let target_addr = stratum | (p1 << 8);
                let field_offset = p2 & 0xFF;
                let new_value = p2;
                let current = self.mem_read(target_addr);
                let modified = match field_offset {
                    0 => (current & 0xFFFFFF00) | (new_value & 0xFF),
                    1 => (current & 0xFFFF00FF) | ((new_value & 0xFF) << 8),
                    2 => (current & 0xFF00FFFF) | ((new_value & 0xFF) << 16),
                    3 => (current & 0x00FFFFFF) | ((new_value & 0xFF) << 24),
                    _ => current,
                };
                self.mem_write(target_addr, modified);
                self.vms[vm_idx].pc += 1;
            }

            // --- SEMANTIC_MERGE (235) ---
            235 => {
                let src_addr = stratum | (p1 << 8);
                let dst_addr = p2;
                let count = p2 >> 8;
                if count == 0 {
                    let src = self.mem_read(src_addr);
                    let dst = self.mem_read(dst_addr);
                    if src != dst {
                        self.mem_write(dst_addr, src);
                    }
                } else {
                    for i in 0..count {
                        let src = self.mem_read(src_addr + i);
                        let dst = self.mem_read(dst_addr + i);
                        if src != dst {
                            self.mem_write(dst_addr + i, src);
                        }
                    }
                }
                self.vms[vm_idx].pc += 1;
            }

            // --- Memory-based opcodes (200-229) ---
            200 => { self.vms[vm_idx].pc += 1; } // NOP
            201 => { // ADD: mem[dst] = mem[src1] + mem[src2]
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, v1.wrapping_add(v2));
                self.vms[vm_idx].pc += 1;
            }
            202 => { // SUB
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, v1.wrapping_sub(v2));
                self.vms[vm_idx].pc += 1;
            }
            203 => { // MUL
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, v1.wrapping_mul(v2));
                self.vms[vm_idx].pc += 1;
            }
            204 => { // DIV
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                if v2 != 0 { self.mem_write(stratum, v1 / v2); }
                self.vms[vm_idx].pc += 1;
            }
            205 => { // LOAD: mem[dst] = mem[src1]
                let v = self.mem_read(p1);
                self.mem_write(stratum, v);
                self.vms[vm_idx].pc += 1;
            }
            206 => { // STORE: mem[dst] = src1 (immediate)
                self.mem_write(stratum, p1);
                self.vms[vm_idx].pc += 1;
            }
            207 => { // LOADIMM: mem[dst] = 32-bit immediate (next pixel)
                let imm = self.mem_read(pc + 1);
                self.mem_write(stratum, imm);
                self.vms[vm_idx].pc += 2;
            }
            208 => { // JUMP: pc = dst
                self.vms[vm_idx].pc = stratum;
            }
            209 => { // JUMPZ: if mem[dst] == 0 then pc = src1
                let v = self.mem_read(stratum);
                if v == 0 { self.vms[vm_idx].pc = p1; }
                else { self.vms[vm_idx].pc += 1; }
            }
            210 => { // JUMPNZ: if mem[dst] != 0 then pc = src1
                let v = self.mem_read(stratum);
                if v != 0 { self.vms[vm_idx].pc = p1; }
                else { self.vms[vm_idx].pc += 1; }
            }
            211 => { // CMP: mem[dst] = (mem[src1] == mem[src2]) ? 1 : 0
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, if v1 == v2 { 1 } else { 0 });
                self.vms[vm_idx].pc += 1;
            }
            212 => { // AND
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, v1 & v2);
                self.vms[vm_idx].pc += 1;
            }
            213 => { // OR
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, v1 | v2);
                self.vms[vm_idx].pc += 1;
            }
            214 => { // XOR
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, v1 ^ v2);
                self.vms[vm_idx].pc += 1;
            }
            215 => { // NOT
                let v = self.mem_read(p1);
                self.mem_write(stratum, !v);
                self.vms[vm_idx].pc += 1;
            }
            216 => { // SHL
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, v1 << (v2 & 31));
                self.vms[vm_idx].pc += 1;
            }
            217 => { // SHR
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, v1 >> (v2 & 31));
                self.vms[vm_idx].pc += 1;
            }
            218 => { // CALL: push pc+1, pc = dst
                let sp = self.vms[vm_idx].stack_ptr as usize;
                if sp < STACK_SIZE {
                    self.vms[vm_idx].stack[sp] = pc + 1;
                    self.vms[vm_idx].stack_ptr += 1;
                    self.vms[vm_idx].pc = stratum;
                } else {
                    self.vms[vm_idx].state = VM_STATE_HALTED;
                }
            }
            219 => { // RET
                let sp = self.vms[vm_idx].stack_ptr;
                if sp > 0 {
                    self.vms[vm_idx].stack_ptr -= 1;
                    self.vms[vm_idx].pc = self.vms[vm_idx].stack[(sp - 1) as usize];
                } else {
                    self.vms[vm_idx].state = VM_STATE_HALTED;
                }
            }
            220 => { // PUSH
                let sp_addr = 0xF000 + self.vms[vm_idx].stack_ptr;
                let v = self.mem_read(stratum);
                self.mem_write(sp_addr, v);
                self.vms[vm_idx].stack_ptr += 1;
                self.vms[vm_idx].pc += 1;
            }
            221 => { // POP
                let sp = self.vms[vm_idx].stack_ptr;
                if sp > 0 {
                    self.vms[vm_idx].stack_ptr -= 1;
                    let sp_addr = 0xF000 + self.vms[vm_idx].stack_ptr;
                    let v = self.mem_read(sp_addr);
                    self.mem_write(stratum, v);
                }
                self.vms[vm_idx].pc += 1;
            }
            222 => { // READ (alias for LOAD)
                let v = self.mem_read(p1);
                self.mem_write(stratum, v);
                self.vms[vm_idx].pc += 1;
            }
            223 => { // WRITE (alias for STORE via memory)
                let v = self.mem_read(p1);
                self.mem_write(stratum, v);
                self.vms[vm_idx].pc += 1;
            }
            228 => { // FADD (integer fallback)
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, v1.wrapping_add(v2));
                self.vms[vm_idx].pc += 1;
            }
            229 => { // FMUL (integer fallback)
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, v1.wrapping_mul(v2));
                self.vms[vm_idx].pc += 1;
            }

            // Unknown opcode — skip
            _ => {
                self.vms[vm_idx].pc += 1;
            }
        }
    }
}

impl Default for SyntheticVram {
    fn default() -> Self {
        Self::new()
    }
}

impl std::fmt::Debug for SyntheticVram {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.debug_struct("SyntheticVram")
            .field("grid_size", &self.grid_size())
            .field("frame", &self.frame)
            .field("active_vms", &self.vms.iter().filter(|v| v.state == VM_STATE_RUNNING).count())
            .finish()
    }
}

// ============================================================================
// TESTS
// ============================================================================

#[cfg(test)]
mod tests {
    use super::*;

    /// Helper to encode a glyph pixel
    fn glyph(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
        opcode as u32
            | ((stratum as u32) << 8)
            | ((p1 as u32) << 16)
            | ((p2 as u32) << 24)
    }

    #[test]
    fn test_hilbert_roundtrip() {
        let vram = SyntheticVram::new();
        // Verify a few known Hilbert addresses
        let (x, y) = vram.d2xy(0);
        assert_eq!((x, y), (0, 0));
        let (x, y) = vram.d2xy(1);
        assert_eq!((x, y), (1, 0));
        let (x, y) = vram.d2xy(2);
        assert_eq!((x, y), (1, 1));
        let (x, y) = vram.d2xy(3);
        assert_eq!((x, y), (0, 1));
    }

    #[test]
    fn test_poke_peek() {
        let mut vram = SyntheticVram::new();
        vram.poke(42, 0xDEADBEEF);
        assert_eq!(vram.peek(42), 0xDEADBEEF);
    }

    #[test]
    fn test_halt() {
        let mut vram = SyntheticVram::new();
        vram.poke(0, glyph(13, 0, 0, 0)); // HALT at addr 0
        vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
        vram.execute_frame();
        assert!(vram.is_halted(0));
    }

    #[test]
    fn test_ldi() {
        let mut vram = SyntheticVram::new();
        vram.poke(0, glyph(1, 0, 0, 0));  // LDI r0
        vram.poke(1, 42);                   // DATA = 42
        vram.poke(2, glyph(13, 0, 0, 0));  // HALT
        vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
        vram.execute_frame();
        assert_eq!(vram.vm_state(0).unwrap().regs[0], 42);
    }

    #[test]
    fn test_add() {
        let mut vram = SyntheticVram::new();
        vram.poke(0, glyph(1, 0, 0, 0));  // LDI r0
        vram.poke(1, 10);                   // r0 = 10
        vram.poke(2, glyph(1, 0, 1, 0));  // LDI r1
        vram.poke(3, 20);                   // r1 = 20
        vram.poke(4, glyph(5, 0, 0, 1));  // ADD r1 = r0 + r1
        vram.poke(5, glyph(13, 0, 0, 0));  // HALT
        vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
        vram.execute_frame();
        assert_eq!(vram.vm_state(0).unwrap().regs[1], 30);
    }

    #[test]
    fn test_self_replication() {
        // THE PIXELS MOVE PIXELS TEST — runs on CPU, no GPU needed!
        let mut vram = SyntheticVram::new();

        let program: Vec<(u32, u32)> = vec![
            (0,  glyph(1, 0, 0, 0)),   // LDI r0 (source addr)
            (1,  0u32),                  // DATA = 0
            (2,  glyph(1, 0, 1, 0)),   // LDI r1 (dest addr)
            (3,  100u32),                // DATA = 100
            (4,  glyph(1, 0, 2, 0)),   // LDI r2 (counter)
            (5,  0u32),                  // DATA = 0
            (6,  glyph(1, 0, 3, 0)),   // LDI r3 (increment)
            (7,  1u32),                  // DATA = 1
            (8,  glyph(1, 0, 4, 0)),   // LDI r4 (length)
            (9,  18u32),                 // DATA = 18
            (10, glyph(3, 0, 0, 5)),   // LOAD r5 = mem[r0]
            (11, glyph(4, 0, 1, 5)),   // STORE mem[r1] = r5
            (12, glyph(5, 0, 3, 0)),   // ADD r0 = r3 + r0
            (13, glyph(5, 0, 3, 1)),   // ADD r1 = r3 + r1
            (14, glyph(5, 0, 3, 2)),   // ADD r2 = r3 + r2
            (15, glyph(10, 1, 2, 4)),  // BRANCH BNE r2, r4
            (16, (-7i32) as u32),        // offset = -7
            (17, glyph(13, 0, 0, 0)),  // HALT
        ];

        // Write program (frozen bootstrap)
        for &(addr, val) in &program {
            vram.poke(addr, val);
        }

        // Verify destination is empty
        for i in 0..18u32 {
            assert_eq!(vram.peek(100 + i), 0, "dest addr {} should be 0", 100 + i);
        }

        // Run
        vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
        vram.execute_frame();

        // Verify self-replication
        println!("\n=== SYNTHETIC VRAM: Self-Replication Test ===\n");
        let mut all_match = true;
        for &(src_addr, expected) in &program {
            let dst_addr = 100 + src_addr;
            let actual = vram.peek(dst_addr);
            let status = if actual == expected { "✓" } else { "✗" };
            println!("  {} addr {:3} → {:3}: expected 0x{:08X}, got 0x{:08X}",
                     status, src_addr, dst_addr, expected, actual);
            if actual != expected {
                all_match = false;
            }
        }

        assert!(all_match, "Self-replication failed!");
        assert!(vram.is_halted(0));

        // Verify source intact
        for &(addr, expected) in &program {
            assert_eq!(vram.peek(addr), expected, "Source at {} corrupted!", addr);
        }

        println!("\n  ╔══════════════════════════════════════════════════╗");
        println!("  ║   SYNTHETIC PIXELS MOVED SYNTHETIC PIXELS.      ║");
        println!("  ║   No GPU. No crashes. Pure CPU emulation.       ║");
        println!("  ╚══════════════════════════════════════════════════╝\n");
    }

    #[test]
    fn test_branch_bne_loop() {
        let mut vram = SyntheticVram::new();
        // Count from 0 to 5: LDI r0=0, LDI r1=1, LDI r2=5, loop: ADD r0+=r1, BRANCH BNE r0,r2
        vram.poke(0, glyph(1, 0, 0, 0));   // LDI r0
        vram.poke(1, 0);                     // = 0
        vram.poke(2, glyph(1, 0, 1, 0));   // LDI r1
        vram.poke(3, 1);                     // = 1
        vram.poke(4, glyph(1, 0, 2, 0));   // LDI r2
        vram.poke(5, 5);                     // = 5
        vram.poke(6, glyph(5, 0, 1, 0));   // ADD r0 = r1 + r0
        vram.poke(7, glyph(10, 1, 0, 2));  // BRANCH BNE r0, r2
        vram.poke(8, (-3i32) as u32);        // offset = -3 (7 + 2 + (-3) = 6)
        vram.poke(9, glyph(13, 0, 0, 0));  // HALT
        vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
        vram.execute_frame();
        assert_eq!(vram.vm_state(0).unwrap().regs[0], 5);
        assert!(vram.is_halted(0));
    }

    #[test]
    fn test_tracing() {
        let mut vram = SyntheticVram::new();
        vram.enable_tracing();
        vram.poke(0, glyph(1, 0, 0, 0));  // LDI r0
        vram.poke(1, 99);
        vram.poke(2, glyph(13, 0, 0, 0)); // HALT
        vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
        vram.execute_frame();
        let trace = vram.trace();
        assert_eq!(trace.len(), 2); // LDI + HALT
        assert_eq!(trace[0].opcode, 1); // LDI
        assert_eq!(trace[1].opcode, 13); // HALT
    }

    #[test]
    fn test_spatial_bounds_check() {
        let mut vram = SyntheticVram::new();
        vram.poke(50, glyph(1, 0, 0, 0));   // LDI r0
        vram.poke(51, 200);                    // addr 200 (outside bounds)
        vram.poke(52, glyph(3, 0, 0, 1));   // LOAD r1 = mem[r0] → should fault
        vram.poke(53, glyph(13, 0, 0, 0));  // HALT (should never reach)

        let config = SyntheticVmConfig {
            entry_point: 50,
            base_addr: 50,
            bound_addr: 100, // restrict to [50, 100)
            ..Default::default()
        };
        vram.spawn_vm(0, &config).unwrap();
        vram.execute_frame();
        // Should have halted due to bounds violation (addr 200 is outside [50,100))
        assert!(vram.is_halted(0));
        // PC should be at the LOAD instruction (52), not at HALT (53)
        assert_eq!(vram.vm_state(0).unwrap().pc, 52);
    }

    #[test]
    fn test_fibonacci() {
        // Compute fib(10) = 55
        let mut vram = SyntheticVram::new();
        // r0 = fib(n-2), r1 = fib(n-1), r2 = temp, r3 = counter, r4 = limit, r5 = one
        vram.poke(0, glyph(1, 0, 0, 0));   // LDI r0 = 0
        vram.poke(1, 0);
        vram.poke(2, glyph(1, 0, 1, 0));   // LDI r1 = 1
        vram.poke(3, 1);
        vram.poke(4, glyph(1, 0, 3, 0));   // LDI r3 = 0 (counter)
        vram.poke(5, 0);
        vram.poke(6, glyph(1, 0, 4, 0));   // LDI r4 = 10 (limit)
        vram.poke(7, 10);
        vram.poke(8, glyph(1, 0, 5, 0));   // LDI r5 = 1
        vram.poke(9, 1);
        // Loop start at addr 10:
        vram.poke(10, glyph(2, 0, 1, 2));  // MOV r2 = r1 (temp = fib(n-1))
        vram.poke(11, glyph(5, 0, 0, 1));  // ADD r1 = r0 + r1 (fib(n) = fib(n-2) + fib(n-1))
        vram.poke(12, glyph(2, 0, 2, 0));  // MOV r0 = r2 (fib(n-2) = old fib(n-1))
        vram.poke(13, glyph(5, 0, 5, 3));  // ADD r3 = r5 + r3 (counter++)
        vram.poke(14, glyph(10, 1, 3, 4)); // BRANCH BNE r3, r4
        vram.poke(15, (-6i32) as u32);       // offset = -6 (14 + 2 + (-6) = 10)
        vram.poke(16, glyph(13, 0, 0, 0)); // HALT

        vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
        vram.execute_frame();
        // 10 iterations from (0,1) → fib(11) = 89
        assert_eq!(vram.vm_state(0).unwrap().regs[1], 89, "10 iterations of fib should give 89");
        assert!(vram.is_halted(0));
    }

    #[test]
    fn test_self_modifying_quine() {
        let mut vram = SyntheticVram::new_small(256);

        // --- PARENT PROGRAM (addr 0-8) ---
        // 0: Copy template (64-79) to child (96-111)
        vram.poke(0, glyph(232, 96, 64, 16));
        // 1-2: Patch child's value at addr 97 (the data part of LDI)
        vram.poke(1, glyph(1, 0, 1, 0));   // LDI r1
        vram.poke(2, 97);                   // = 97
        vram.poke(3, glyph(1, 0, 2, 0));   // LDI r2
        vram.poke(4, 0xBEEF);               // = 0xBEEF
        vram.poke(5, glyph(4, 0, 1, 2));   // STORE [r1], r2
        // 6-7: Jump to child at addr 96
        vram.poke(6, glyph(1, 0, 1, 0));   // LDI r1
        vram.poke(7, 96);                   // = 96
        vram.poke(8, glyph(9, 0, 1, 0));   // JMP r1

        // --- TEMPLATE PROGRAM (addr 64-69) ---
        // 64-65: Load value
        vram.poke(64, glyph(1, 0, 10, 0)); // LDI r10
        vram.poke(65, 0xDEAD);              // = 0xDEAD (to be patched)
        // 66-67: Target address
        vram.poke(66, glyph(1, 0, 11, 0)); // LDI r11
        vram.poke(67, 200);                 // = 200 (Result addr)
        // 68-69: Store and Halt
        vram.poke(68, glyph(4, 0, 11, 10)); // STORE [r11], r10
        vram.poke(69, glyph(13, 0, 0, 0));  // HALT

        // Run it
        vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
        vram.execute_frame();

        // Verify:
        // 1. The memory at 97 should be 0xBEEF (not 0xDEAD)
        assert_eq!(vram.peek(97), 0xBEEF);
        // 2. The result memory at 200 should be 0xBEEF
        assert_eq!(vram.peek(200), 0xBEEF);
        // 3. VM should be halted
        assert!(vram.is_halted(0));
    }
}
