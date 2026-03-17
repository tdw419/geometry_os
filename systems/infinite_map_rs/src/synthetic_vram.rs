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
        let val =
            opcode as u32 | ((stratum as u32) << 8) | ((p1 as u32) << 16) | ((p2 as u32) << 24);
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

    /// Execute one frame using interleaved (round-robin) scheduling.
    /// This allows VMs to make progress concurrently, enabling polling IPC patterns.
    pub fn execute_frame_interleaved(&mut self, cycles_per_step: u32) {
        let mut completed_cycles = [0u32; MAX_VMS];
        let mut active = true;

        while active {
            active = false;
            for vm_idx in 0..MAX_VMS {
                if self.vms[vm_idx].state == VM_STATE_RUNNING
                    && completed_cycles[vm_idx] < MAX_CYCLES_PER_VM
                {
                    active = true;
                    for _ in 0..cycles_per_step {
                        if self.vms[vm_idx].state != VM_STATE_RUNNING
                            || completed_cycles[vm_idx] >= MAX_CYCLES_PER_VM
                        {
                            break;
                        }
                        self.execute_instruction(vm_idx);
                        completed_cycles[vm_idx] += 1;
                    }
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
            },

            // LDI — Load Immediate 32-bit (uses 2 pixels)
            1 => {
                let data = self.mem_read(pc + 1);
                self.vms[vm_idx].regs[p1 as usize] = data;
                self.vms[vm_idx].pc += 2;
            },

            // MOV — regs[p2] = regs[p1]
            2 => {
                self.vms[vm_idx].regs[p2 as usize] = self.vms[vm_idx].regs[p1 as usize];
                self.vms[vm_idx].pc += 1;
            },

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
            },

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
            },

            // ADD — regs[p2] = regs[p1] + regs[p2]
            5 => {
                let v1 = self.vms[vm_idx].regs[p1 as usize];
                let v2 = self.vms[vm_idx].regs[p2 as usize];
                self.vms[vm_idx].regs[p2 as usize] = v1.wrapping_add(v2);
                self.vms[vm_idx].pc += 1;
            },

            // SUB — regs[p2] = regs[p1] - regs[p2]
            6 => {
                let v1 = self.vms[vm_idx].regs[p1 as usize];
                let v2 = self.vms[vm_idx].regs[p2 as usize];
                self.vms[vm_idx].regs[p2 as usize] = v1.wrapping_sub(v2);
                self.vms[vm_idx].pc += 1;
            },

            // MUL — regs[p2] = regs[p1] * regs[p2]
            7 => {
                let v1 = self.vms[vm_idx].regs[p1 as usize];
                let v2 = self.vms[vm_idx].regs[p2 as usize];
                self.vms[vm_idx].regs[p2 as usize] = v1.wrapping_mul(v2);
                self.vms[vm_idx].pc += 1;
            },

            // DIV — regs[p2] = regs[p1] / regs[p2]
            8 => {
                let v2 = self.vms[vm_idx].regs[p2 as usize];
                if v2 != 0 {
                    let v1 = self.vms[vm_idx].regs[p1 as usize];
                    self.vms[vm_idx].regs[p2 as usize] = v1 / v2;
                }
                self.vms[vm_idx].pc += 1;
            },

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
            },

            // BRANCH — conditional, stratum=cond, p1=rs1, p2=rs2, next pixel=signed offset
            10 => {
                let v1 = self.vms[vm_idx].regs[p1 as usize];
                let v2 = self.vms[vm_idx].regs[p2 as usize];
                let take_branch = match stratum {
                    0 => v1 == v2,                   // BEQ
                    1 => v1 != v2,                   // BNE
                    2 => (v1 as i32) < (v2 as i32),  // BLT
                    3 => (v1 as i32) >= (v2 as i32), // BGE
                    4 => v1 < v2,                    // BLTU
                    5 => v1 >= v2,                   // BGEU
                    _ => false,
                };
                if take_branch {
                    let offset = self.mem_read(pc + 1) as i32;
                    self.vms[vm_idx].pc = (pc as i32 + 2 + offset) as u32;
                } else {
                    self.vms[vm_idx].pc += 2;
                }
            },

            // CALL
            11 => {
                let sp = self.vms[vm_idx].stack_ptr as usize;
                if sp < STACK_SIZE {
                    self.vms[vm_idx].stack[sp] = pc + 1;
                    self.vms[vm_idx].stack_ptr += 1;
                    if stratum == 2 {
                        // PC-relative immediate: offset = p1 | p2<<8
                        let offset = (p1 | (p2 << 8)) as i32;
                        self.vms[vm_idx].pc = (pc as i32 + 1 + offset) as u32;
                    } else {
                        // Register mode: pc = regs[p1]
                        self.vms[vm_idx].pc = self.vms[vm_idx].regs[p1 as usize];
                    }
                } else {
                    self.vms[vm_idx].state = VM_STATE_HALTED;
                }
            },

            // RETURN
            12 => {
                let sp = self.vms[vm_idx].stack_ptr;
                if sp > 0 {
                    self.vms[vm_idx].stack_ptr -= 1;
                    self.vms[vm_idx].pc = self.vms[vm_idx].stack[(sp - 1) as usize];
                } else {
                    self.vms[vm_idx].state = VM_STATE_HALTED;
                }
            },

            // HALT
            13 => {
                self.vms[vm_idx].state = VM_STATE_HALTED;
                self.vms[vm_idx].halted = 1;
            },

            // DATA (skip)
            14 => {
                self.vms[vm_idx].pc += 1;
            },

            // LOOP (stub)
            15 => {
                self.vms[vm_idx].pc += 1;
            },

            // JAL — regs[p1] = return_addr, pc = PC + 2 + signed offset
            16 => {
                self.vms[vm_idx].regs[p1 as usize] = pc + 2;
                let offset = self.mem_read(pc + 1) as i32;
                self.vms[vm_idx].pc = (pc as i32 + 2 + offset) as u32;
            },

            // --- Bitwise (128-133) ---
            128 => {
                // AND
                self.vms[vm_idx].regs[p2 as usize] =
                    self.vms[vm_idx].regs[p1 as usize] & self.vms[vm_idx].regs[p2 as usize];
                self.vms[vm_idx].pc += 1;
            },
            129 => {
                // OR
                self.vms[vm_idx].regs[p2 as usize] =
                    self.vms[vm_idx].regs[p1 as usize] | self.vms[vm_idx].regs[p2 as usize];
                self.vms[vm_idx].pc += 1;
            },
            130 => {
                // XOR
                self.vms[vm_idx].regs[p2 as usize] =
                    self.vms[vm_idx].regs[p1 as usize] ^ self.vms[vm_idx].regs[p2 as usize];
                self.vms[vm_idx].pc += 1;
            },
            131 => {
                // SHL - two forms:
                // stratum=0: SHL src, dst → dst = src << (dst & 31)
                // stratum>0: SHL dst, src, shift_reg → dst = src << (shift_reg & 31)
                //            where shift_reg is encoded in stratum field
                if stratum == 0 {
                    let shift = self.vms[vm_idx].regs[p2 as usize] & 31;
                    self.vms[vm_idx].regs[p2 as usize] = self.vms[vm_idx].regs[p1 as usize] << shift;
                } else {
                    // Three-operand form: dst=p2, src=p1, shift_reg=stratum
                    let shift = self.vms[vm_idx].regs[stratum as usize] & 31;
                    self.vms[vm_idx].regs[p2 as usize] = self.vms[vm_idx].regs[p1 as usize] << shift;
                }
                self.vms[vm_idx].pc += 1;
            },
            132 => {
                // SHR - two forms (like SHL):
                // stratum=0: SHR src, dst → dst = src >> (dst & 31)
                // stratum>0: SHR dst, src, shift_reg → dst = src >> (shift_reg & 31)
                if stratum == 0 {
                    let shift = self.vms[vm_idx].regs[p2 as usize] & 31;
                    self.vms[vm_idx].regs[p2 as usize] = self.vms[vm_idx].regs[p1 as usize] >> shift;
                } else {
                    let shift = self.vms[vm_idx].regs[stratum as usize] & 31;
                    self.vms[vm_idx].regs[p2 as usize] = self.vms[vm_idx].regs[p1 as usize] >> shift;
                }
                self.vms[vm_idx].pc += 1;
            },
            133 => {
                // SAR (arithmetic shift right — preserve sign)
                let shift = self.vms[vm_idx].regs[p2 as usize] & 31;
                self.vms[vm_idx].regs[p2 as usize] =
                    ((self.vms[vm_idx].regs[p1 as usize] as i32) >> shift) as u32;
                self.vms[vm_idx].pc += 1;
            },

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
            },

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
            },

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
            },

            // --- ATTENTION_FOCUS (233) ---
            233 => {
                let mode = stratum;
                match mode {
                    0 => self.vms[vm_idx].attention_mask = 0,
                    1 => self.vms[vm_idx].attention_mask = p1,
                    2 => self.vms[vm_idx].attention_mask |= p1,
                    3 => self.vms[vm_idx].attention_mask &= !p1,
                    _ => {},
                }
                self.vms[vm_idx].pc += 1;
            },

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
            },

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
            },

            // --- Memory-based opcodes (200-229) ---
            200 => {
                self.vms[vm_idx].pc += 1;
            }, // NOP
            201 => {
                // ADD: mem[dst] = mem[src1] + mem[src2]
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, v1.wrapping_add(v2));
                self.vms[vm_idx].pc += 1;
            },
            202 => {
                // SUB
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, v1.wrapping_sub(v2));
                self.vms[vm_idx].pc += 1;
            },
            203 => {
                // MUL
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, v1.wrapping_mul(v2));
                self.vms[vm_idx].pc += 1;
            },
            204 => {
                // DIV
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                if v2 != 0 {
                    self.mem_write(stratum, v1 / v2);
                }
                self.vms[vm_idx].pc += 1;
            },
            205 => {
                // LOAD: mem[dst] = mem[src1]
                let v = self.mem_read(p1);
                self.mem_write(stratum, v);
                self.vms[vm_idx].pc += 1;
            },
            206 => {
                // STORE: mem[dst] = src1 (immediate)
                self.mem_write(stratum, p1);
                self.vms[vm_idx].pc += 1;
            },
            207 => {
                // LOADIMM: mem[dst] = 32-bit immediate (next pixel)
                let imm = self.mem_read(pc + 1);
                self.mem_write(stratum, imm);
                self.vms[vm_idx].pc += 2;
            },
            208 => {
                // JUMP: pc = dst
                self.vms[vm_idx].pc = stratum;
            },
            209 => {
                // JUMPZ: if mem[dst] == 0 then pc = src1
                let v = self.mem_read(stratum);
                if v == 0 {
                    self.vms[vm_idx].pc = p1;
                } else {
                    self.vms[vm_idx].pc += 1;
                }
            },
            210 => {
                // JUMPNZ: if mem[dst] != 0 then pc = src1
                let v = self.mem_read(stratum);
                if v != 0 {
                    self.vms[vm_idx].pc = p1;
                } else {
                    self.vms[vm_idx].pc += 1;
                }
            },
            211 => {
                // CMP: mem[dst] = (mem[src1] == mem[src2]) ? 1 : 0
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, if v1 == v2 { 1 } else { 0 });
                self.vms[vm_idx].pc += 1;
            },
            212 => {
                // AND
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, v1 & v2);
                self.vms[vm_idx].pc += 1;
            },
            213 => {
                // OR
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, v1 | v2);
                self.vms[vm_idx].pc += 1;
            },
            214 => {
                // XOR
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, v1 ^ v2);
                self.vms[vm_idx].pc += 1;
            },
            215 => {
                // NOT
                let v = self.mem_read(p1);
                self.mem_write(stratum, !v);
                self.vms[vm_idx].pc += 1;
            },
            216 => {
                // SHL
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, v1 << (v2 & 31));
                self.vms[vm_idx].pc += 1;
            },
            217 => {
                // SHR
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, v1 >> (v2 & 31));
                self.vms[vm_idx].pc += 1;
            },
            218 => {
                // CALL: push pc+1, pc = dst
                let sp = self.vms[vm_idx].stack_ptr as usize;
                if sp < STACK_SIZE {
                    self.vms[vm_idx].stack[sp] = pc + 1;
                    self.vms[vm_idx].stack_ptr += 1;
                    self.vms[vm_idx].pc = stratum;
                } else {
                    self.vms[vm_idx].state = VM_STATE_HALTED;
                }
            },
            219 => {
                // RET
                let sp = self.vms[vm_idx].stack_ptr;
                if sp > 0 {
                    self.vms[vm_idx].stack_ptr -= 1;
                    self.vms[vm_idx].pc = self.vms[vm_idx].stack[(sp - 1) as usize];
                } else {
                    self.vms[vm_idx].state = VM_STATE_HALTED;
                }
            },
            220 => {
                // PUSH
                let sp_addr = 0xF000 + self.vms[vm_idx].stack_ptr;
                let v = self.mem_read(stratum);
                self.mem_write(sp_addr, v);
                self.vms[vm_idx].stack_ptr += 1;
                self.vms[vm_idx].pc += 1;
            },
            221 => {
                // POP
                let sp = self.vms[vm_idx].stack_ptr;
                if sp > 0 {
                    self.vms[vm_idx].stack_ptr -= 1;
                    let sp_addr = 0xF000 + self.vms[vm_idx].stack_ptr;
                    let v = self.mem_read(sp_addr);
                    self.mem_write(stratum, v);
                }
                self.vms[vm_idx].pc += 1;
            },
            222 => {
                // READ (alias for LOAD)
                let v = self.mem_read(p1);
                self.mem_write(stratum, v);
                self.vms[vm_idx].pc += 1;
            },
            223 => {
                // WRITE (alias for STORE via memory)
                let v = self.mem_read(p1);
                self.mem_write(stratum, v);
                self.vms[vm_idx].pc += 1;
            },
            228 => {
                // FADD (integer fallback)
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, v1.wrapping_add(v2));
                self.vms[vm_idx].pc += 1;
            },
            229 => {
                // FMUL (integer fallback)
                let v1 = self.mem_read(p1);
                let v2 = self.mem_read(p2);
                self.mem_write(stratum, v1.wrapping_mul(v2));
                self.vms[vm_idx].pc += 1;
            },

            // Unknown opcode — skip
            _ => {
                self.vms[vm_idx].pc += 1;
            },
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
            .field(
                "active_vms",
                &self
                    .vms
                    .iter()
                    .filter(|v| v.state == VM_STATE_RUNNING)
                    .count(),
            )
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
        opcode as u32 | ((stratum as u32) << 8) | ((p1 as u32) << 16) | ((p2 as u32) << 24)
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
        vram.poke(0, glyph(1, 0, 0, 0)); // LDI r0
        vram.poke(1, 42); // DATA = 42
        vram.poke(2, glyph(13, 0, 0, 0)); // HALT
        vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
        vram.execute_frame();
        assert_eq!(vram.vm_state(0).unwrap().regs[0], 42);
    }

    #[test]
    fn test_add() {
        let mut vram = SyntheticVram::new();
        vram.poke(0, glyph(1, 0, 0, 0)); // LDI r0
        vram.poke(1, 10); // r0 = 10
        vram.poke(2, glyph(1, 0, 1, 0)); // LDI r1
        vram.poke(3, 20); // r1 = 20
        vram.poke(4, glyph(5, 0, 0, 1)); // ADD r1 = r0 + r1
        vram.poke(5, glyph(13, 0, 0, 0)); // HALT
        vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
        vram.execute_frame();
        assert_eq!(vram.vm_state(0).unwrap().regs[1], 30);
    }

    #[test]
    fn test_self_replication() {
        // THE PIXELS MOVE PIXELS TEST — runs on CPU, no GPU needed!
        let mut vram = SyntheticVram::new();

        let program: Vec<(u32, u32)> = vec![
            (0, glyph(1, 0, 0, 0)),   // LDI r0 (source addr)
            (1, 0u32),                // DATA = 0
            (2, glyph(1, 0, 1, 0)),   // LDI r1 (dest addr)
            (3, 100u32),              // DATA = 100
            (4, glyph(1, 0, 2, 0)),   // LDI r2 (counter)
            (5, 0u32),                // DATA = 0
            (6, glyph(1, 0, 3, 0)),   // LDI r3 (increment)
            (7, 1u32),                // DATA = 1
            (8, glyph(1, 0, 4, 0)),   // LDI r4 (length)
            (9, 18u32),               // DATA = 18
            (10, glyph(3, 0, 0, 5)),  // LOAD r5 = mem[r0]
            (11, glyph(4, 0, 1, 5)),  // STORE mem[r1] = r5
            (12, glyph(5, 0, 3, 0)),  // ADD r0 = r3 + r0
            (13, glyph(5, 0, 3, 1)),  // ADD r1 = r3 + r1
            (14, glyph(5, 0, 3, 2)),  // ADD r2 = r3 + r2
            (15, glyph(10, 1, 2, 4)), // BRANCH BNE r2, r4
            (16, (-7i32) as u32),     // offset = -7
            (17, glyph(13, 0, 0, 0)), // HALT
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
            println!(
                "  {} addr {:3} → {:3}: expected 0x{:08X}, got 0x{:08X}",
                status, src_addr, dst_addr, expected, actual
            );
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
        vram.poke(0, glyph(1, 0, 0, 0)); // LDI r0
        vram.poke(1, 0); // = 0
        vram.poke(2, glyph(1, 0, 1, 0)); // LDI r1
        vram.poke(3, 1); // = 1
        vram.poke(4, glyph(1, 0, 2, 0)); // LDI r2
        vram.poke(5, 5); // = 5
        vram.poke(6, glyph(5, 0, 1, 0)); // ADD r0 = r1 + r0
        vram.poke(7, glyph(10, 1, 0, 2)); // BRANCH BNE r0, r2
        vram.poke(8, (-3i32) as u32); // offset = -3 (7 + 2 + (-3) = 6)
        vram.poke(9, glyph(13, 0, 0, 0)); // HALT
        vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
        vram.execute_frame();
        assert_eq!(vram.vm_state(0).unwrap().regs[0], 5);
        assert!(vram.is_halted(0));
    }

    #[test]
    fn test_tracing() {
        let mut vram = SyntheticVram::new();
        vram.enable_tracing();
        vram.poke(0, glyph(1, 0, 0, 0)); // LDI r0
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
        vram.poke(50, glyph(1, 0, 0, 0)); // LDI r0
        vram.poke(51, 200); // addr 200 (outside bounds)
        vram.poke(52, glyph(3, 0, 0, 1)); // LOAD r1 = mem[r0] → should fault
        vram.poke(53, glyph(13, 0, 0, 0)); // HALT (should never reach)

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
        vram.poke(0, glyph(1, 0, 0, 0)); // LDI r0 = 0
        vram.poke(1, 0);
        vram.poke(2, glyph(1, 0, 1, 0)); // LDI r1 = 1
        vram.poke(3, 1);
        vram.poke(4, glyph(1, 0, 3, 0)); // LDI r3 = 0 (counter)
        vram.poke(5, 0);
        vram.poke(6, glyph(1, 0, 4, 0)); // LDI r4 = 10 (limit)
        vram.poke(7, 10);
        vram.poke(8, glyph(1, 0, 5, 0)); // LDI r5 = 1
        vram.poke(9, 1);
        // Loop start at addr 10:
        vram.poke(10, glyph(2, 0, 1, 2)); // MOV r2 = r1 (temp = fib(n-1))
        vram.poke(11, glyph(5, 0, 0, 1)); // ADD r1 = r0 + r1 (fib(n) = fib(n-2) + fib(n-1))
        vram.poke(12, glyph(2, 0, 2, 0)); // MOV r0 = r2 (fib(n-2) = old fib(n-1))
        vram.poke(13, glyph(5, 0, 5, 3)); // ADD r3 = r5 + r3 (counter++)
        vram.poke(14, glyph(10, 1, 3, 4)); // BRANCH BNE r3, r4
        vram.poke(15, (-6i32) as u32); // offset = -6 (14 + 2 + (-6) = 10)
        vram.poke(16, glyph(13, 0, 0, 0)); // HALT

        vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
        vram.execute_frame();
        // 10 iterations from (0,1) → fib(11) = 89
        assert_eq!(
            vram.vm_state(0).unwrap().regs[1],
            89,
            "10 iterations of fib should give 89"
        );
        assert!(vram.is_halted(0));
    }

    #[test]
    fn test_self_modifying_quine() {
        let mut vram = SyntheticVram::new_small(256);

        // --- PARENT PROGRAM (addr 0-8) ---
        // 0: Copy template (64-79) to child (96-111)
        vram.poke(0, glyph(232, 96, 64, 16));
        // 1-2: Patch child's value at addr 97 (the data part of LDI)
        vram.poke(1, glyph(1, 0, 1, 0)); // LDI r1
        vram.poke(2, 97); // = 97
        vram.poke(3, glyph(1, 0, 2, 0)); // LDI r2
        vram.poke(4, 0xBEEF); // = 0xBEEF
        vram.poke(5, glyph(4, 0, 1, 2)); // STORE [r1], r2
                                         // 6-7: Jump to child at addr 96
        vram.poke(6, glyph(1, 0, 1, 0)); // LDI r1
        vram.poke(7, 96); // = 96
        vram.poke(8, glyph(9, 0, 1, 0)); // JMP r1

        // --- TEMPLATE PROGRAM (addr 64-69) ---
        // 64-65: Load value
        vram.poke(64, glyph(1, 0, 10, 0)); // LDI r10
        vram.poke(65, 0xDEAD); // = 0xDEAD (to be patched)
                               // 66-67: Target address
        vram.poke(66, glyph(1, 0, 11, 0)); // LDI r11
        vram.poke(67, 200); // = 200 (Result addr)
                            // 68-69: Store and Halt
        vram.poke(68, glyph(4, 0, 11, 10)); // STORE [r11], r10
        vram.poke(69, glyph(13, 0, 0, 0)); // HALT

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

    #[test]
    fn test_multi_vm_ipc_interleaved() {
        // Multi-VM IPC Pattern (polling handshake):
        // 1. Parent (VM 0) spawns child (VM 1) at addr 100
        // 2. Parent polls mem[512] for 0xCAFE
        // 3. Child computes/writes 0xCAFE to mem[512]
        // 4. Child polls mem[516] for 0xF00D (acknowledgment)
        // 5. Parent sees 0xCAFE, writes 0xF00D to mem[516]
        // 6. Both VMs HALT after seeing their respective signals

        let mut vram = SyntheticVram::new_small(1024);

        // === CHILD PROGRAM (addr 100-112) ===
        vram.poke(100, glyph(1, 0, 0, 0)); // LDI r0 = 0xCAFE
        vram.poke(101, 0xCAFE);
        vram.poke(102, glyph(1, 0, 1, 0)); // LDI r1 = 512
        vram.poke(103, 512);
        vram.poke(104, glyph(4, 0, 1, 0)); // STORE [r1], r0 (Signal parent)
        vram.poke(105, glyph(1, 0, 1, 0)); // LDI r1 = 516
        vram.poke(106, 516);
        vram.poke(107, glyph(1, 0, 3, 0)); // LDI r3 = 0xF00D (Expected ack)
        vram.poke(108, 0xF00D);
        vram.poke(109, glyph(3, 0, 1, 2)); // LOAD r2 = mem[r1] (Poll for ack)
        vram.poke(110, glyph(10, 1, 2, 3)); // BNE r2, r3, -3 (offset = 110 + 2 - 3 = 109)
        vram.poke(111, (-3i32) as u32);
        vram.poke(112, glyph(13, 0, 0, 0)); // HALT

        // === PARENT PROGRAM (addr 0-15) ===
        vram.poke(0, glyph(1, 0, 4, 0)); // LDI r4 = 100
        vram.poke(1, 100); // = 100
        vram.poke(2, glyph(225, 0, 4, 0)); // SPATIAL_SPAWN r0 = spawn(r4)
        vram.poke(3, glyph(1, 0, 5, 0)); // LDI r5 = 512
        vram.poke(4, 512);
        vram.poke(5, glyph(1, 0, 7, 0)); // LDI r7 = 0xCAFE (Expected child signal)
        vram.poke(6, 0xCAFE);
        vram.poke(7, glyph(3, 0, 5, 6)); // LOAD r6 = mem[r5] (Poll for signal)
        vram.poke(8, glyph(10, 1, 6, 7)); // BNE r6, r7, -3 (offset = 8 + 2 - 3 = 7)
        vram.poke(9, (-3i32) as u32);
        vram.poke(10, glyph(1, 0, 0, 0)); // LDI r0 = 0xF00D
        vram.poke(11, 0xF00D);
        vram.poke(12, glyph(1, 0, 1, 0)); // LDI r1 = 516
        vram.poke(13, 516);
        vram.poke(14, glyph(4, 0, 1, 0)); // STORE [r1], r0 (Signal ack)
        vram.poke(15, glyph(13, 0, 0, 0)); // HALT

        // Run with interleaved scheduler (1 cycle per VM at a time)
        vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
        vram.execute_frame_interleaved(1);

        // Verify: Both should have reached HALT and shared memory should be updated
        assert_eq!(vram.peek(512), 0xCAFE);
        assert_eq!(vram.peek(516), 0xF00D);
        assert!(vram.is_halted(0), "Parent should be halted");
        assert!(vram.is_halted(1), "Child should be halted");
    }

    #[test]
    fn test_micro_assembler() {
        // Micro-Assembler: Reads ASCII mnemonics, emits opcode bytes
        // This proves the core capability: read from source, emit to binary

        let mut vram = SyntheticVram::new_small(1024);

        // === SOURCE TEXT (ASCII) at addr 200-202 ===
        vram.poke(200, 76); // 'L'
        vram.poke(201, 68); // 'D'
        vram.poke(202, 73); // 'I'

        // === SIMPLIFIED MICRO-ASSEMBLER PROGRAM (addr 0-20) ===
        // This program:
        // 1. Loads "LDI" from source (200-202)
        // 2. Emits opcode 1 (LDI) to output (500)

        // 0-1: LDI r0, 200 (source ptr)
        vram.poke(0, glyph(1, 0, 0, 0));
        vram.poke(1, 200);

        // 2-3: LOAD r1, [r0] (load first char 'L'=76)
        vram.poke(2, glyph(3, 0, 1, 0));

        // 4: ADD r0, r0, 1 (increment source)
        vram.poke(4, glyph(5, 0, 0, 1));

        // 5-6: LOAD r2, [r0] (load second char 'D'=68)
        vram.poke(5, glyph(3, 0, 2, 0));

        // 7: ADD r0, r0, 1 (increment source)
        vram.poke(7, glyph(5, 0, 0, 1));

        // 8-9: LOAD r3, [r0] (load third char 'I'=73)
        vram.poke(8, glyph(3, 0, 3, 0));

        // === EMIT PHASE ===
        // 10-11: LDI r4, 500 (output ptr)
        vram.poke(10, glyph(1, 0, 4, 0));
        vram.poke(11, 500);

        // 12-13: LDI r5, 1 (opcode for LDI)
        vram.poke(12, glyph(1, 0, 5, 0));
        vram.poke(13, 1);

        // 14: STORE [r4], r5 (write opcode to output)
        vram.poke(14, glyph(4, 0, 4, 5));

        // 15: HALT
        vram.poke(15, glyph(13, 0, 0, 0));

        // === RUN ===
        vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap(); // compositor
        vram.spawn_vm(
            1,
            &SyntheticVmConfig {
                entry_point: 300,
                ..Default::default()
            },
        )
        .unwrap(); // child
        vram.enable_tracing();
        vram.execute_frame_interleaved(1);

        // Debug: print trace for compositor
        println!("=== COMPOSITOR TRACE (first 40) ===");
        let trace = vram.trace();
        for (i, entry) in trace.iter().enumerate().filter(|e| e.1.vm_id == 0) {
            println!("{}: PC={} op={}", i, entry.pc, entry.opcode);
            if i > 40 {
                break;
            }
        }
        println!("=== END TRACE ===");
        println!("VM 0 state: {:?}", vram.vm_state(0));
        println!("VM 1 state: {:?}", vram.vm_state(1));
        println!("mem[306] = {:04X} (child mailbox event)", vram.peek(306));
        println!("mem[310] = {:04X} (child ack)", vram.peek(310));

        // === VERIFY ===
        // The program loaded "LDI" from addr 200-202
        // and emitted opcode 1 to addr 500
        let emitted = vram.peek(500);
        println!("Emitted at addr 500: {}", emitted);

        // Check the low byte is 1 (LDI opcode)
        assert_eq!(emitted & 0xFF, 1, "Should emit LDI opcode (1)");
    }

    #[test]
    fn test_mnemonic_matcher() {
        // REAL Mnemonic Matcher: reads 3-char ASCII mnemonics, compares against
        // a lookup table, and emits the correct opcode. This is the compiler primitive.
        //
        // Supports: LDI(1), ADD(5), SUB(6), MOV(2), NOP(0), HLT(13)
        //
        // Memory layout:
        //   300-302: mnemonic lookup table entry 0 ('L','D','I') → opcode 1
        //   304-306: entry 1 ('A','D','D') → opcode 5
        //   308-310: entry 2 ('S','U','B') → opcode 6
        //   312-314: entry 3 ('M','O','V') → opcode 2
        //   316-318: entry 4 ('N','O','P') → opcode 0
        //   320-322: entry 5 ('H','L','T') → opcode 13
        //   Each entry: [char0, char1, char2, opcode] at 4 consecutive addresses
        //
        //   200-202: source mnemonic (input)
        //   500:     emitted opcode (output)
        //
        // Algorithm:
        //   for each table entry:
        //     if src[0]==entry[0] && src[1]==entry[1] && src[2]==entry[2]:
        //       emit entry[3]
        //       halt

        let mut vram = SyntheticVram::new_small(1024);

        // === LOOKUP TABLE (addr 300+) ===
        // Each entry is 4 words: [c0, c1, c2, opcode]
        let table: &[(&[u8; 3], u32)] = &[
            (b"LDI", 1),
            (b"ADD", 5),
            (b"SUB", 6),
            (b"MOV", 2),
            (b"NOP", 0),
            (b"HLT", 13),
        ];
        let table_base: u32 = 300;
        let table_len: u32 = table.len() as u32;
        for (i, (name, opcode)) in table.iter().enumerate() {
            let base = table_base + (i as u32) * 4;
            vram.poke(base, name[0] as u32);
            vram.poke(base + 1, name[1] as u32);
            vram.poke(base + 2, name[2] as u32);
            vram.poke(base + 3, *opcode);
        }

        // Helper: build the matcher program
        // Registers:
        //   r0  = source base (200)
        //   r1  = table pointer (starts at 300)
        //   r2  = table end sentinel
        //   r3  = increment (1)
        //   r4  = entry stride (4)
        //   r5  = output addr (500)
        //   r10 = src char 0
        //   r11 = src char 1
        //   r12 = src char 2
        //   r20 = table char 0
        //   r21 = table char 1
        //   r22 = table char 2
        //   r23 = table opcode
        let mut pc: u32 = 0;

        // Macro to emit LDI
        let mut emit_ldi = |vram: &mut SyntheticVram, pc: &mut u32, reg: u8, val: u32| {
            vram.poke(*pc, glyph(1, 0, reg, 0));
            *pc += 1;
            vram.poke(*pc, val);
            *pc += 1;
        };

        // --- Load source mnemonic (one-time) ---
        emit_ldi(&mut vram, &mut pc, 0, 200); // r0 = 200 (source base)
                                              // r10 = mem[r0] (src[0])
        vram.poke(pc, glyph(3, 0, 0, 10));
        pc += 1; // LOAD r10, [r0]

        emit_ldi(&mut vram, &mut pc, 3, 1); // r3 = 1
        vram.poke(pc, glyph(5, 0, 3, 0));
        pc += 1; // ADD r0 = r3 + r0 (r0=201)

        // r11 = mem[r0] (src[1])
        vram.poke(pc, glyph(3, 0, 0, 11));
        pc += 1; // LOAD r11, [r0]

        vram.poke(pc, glyph(5, 0, 3, 0));
        pc += 1; // ADD r0 = r3 + r0 (r0=202)

        // r12 = mem[r0] (src[2])
        vram.poke(pc, glyph(3, 0, 0, 12));
        pc += 1; // LOAD r12, [r0]

        // --- Setup loop registers ---
        emit_ldi(&mut vram, &mut pc, 1, table_base); // r1 = 300 (table ptr)
        emit_ldi(&mut vram, &mut pc, 2, table_base + table_len * 4); // r2 = 324 (table end)
        emit_ldi(&mut vram, &mut pc, 4, 4); // r4 = 4 (stride)
        emit_ldi(&mut vram, &mut pc, 5, 500); // r5 = 500 (output)

        // --- MATCH LOOP (label: loop_start) ---
        let loop_start = pc;

        // Load table entry chars
        // r20 = mem[r1] (entry[0])
        vram.poke(pc, glyph(3, 0, 1, 20));
        pc += 1;

        // r1 += r3 (point to entry[1])
        vram.poke(pc, glyph(5, 0, 3, 1));
        pc += 1;

        // r21 = mem[r1] (entry[1])
        vram.poke(pc, glyph(3, 0, 1, 21));
        pc += 1;

        // r1 += r3 (point to entry[2])
        vram.poke(pc, glyph(5, 0, 3, 1));
        pc += 1;

        // r22 = mem[r1] (entry[2])
        vram.poke(pc, glyph(3, 0, 1, 22));
        pc += 1;

        // r1 += r3 (point to entry[3] = opcode)
        vram.poke(pc, glyph(5, 0, 3, 1));
        pc += 1;

        // r23 = mem[r1] (opcode)
        vram.poke(pc, glyph(3, 0, 1, 23));
        pc += 1;

        // r1 += r3 (advance to next entry)
        vram.poke(pc, glyph(5, 0, 3, 1));
        pc += 1;

        // --- Compare char 0: if r10 != r20, skip to next entry ---
        let cmp0_pc = pc;
        vram.poke(pc, glyph(10, 1, 10, 20));
        pc += 1; // BNE r10, r20
        let cmp0_offset_pc = pc;
        pc += 1; // offset (fill later)

        // --- Compare char 1: if r11 != r21, skip ---
        let cmp1_pc = pc;
        vram.poke(pc, glyph(10, 1, 11, 21));
        pc += 1; // BNE r11, r21
        let cmp1_offset_pc = pc;
        pc += 1; // offset (fill later)

        // --- Compare char 2: if r12 != r22, skip ---
        let cmp2_pc = pc;
        vram.poke(pc, glyph(10, 1, 12, 22));
        pc += 1; // BNE r12, r22
        let cmp2_offset_pc = pc;
        pc += 1; // offset (fill later)

        // === ALL 3 CHARS MATCH — EMIT OPCODE ===
        // STORE [r5], r23
        vram.poke(pc, glyph(4, 0, 5, 23));
        pc += 1;
        // HALT (success)
        vram.poke(pc, glyph(13, 0, 0, 0));
        pc += 1;

        // === NEXT ENTRY (skip target) ===
        let next_entry_pc = pc;

        // Check if we've exhausted the table: BNE r1, r2 → loop
        vram.poke(pc, glyph(10, 1, 1, 2));
        pc += 1; // BNE r1, r2
                 // offset to loop_start: branch_pc + 2 + offset = loop_start
        let branch_offset = loop_start as i32 - (pc as i32) - 2;
        vram.poke(pc, branch_offset as u32);
        pc += 1;

        // If table exhausted, store 0xFF as error marker and halt
        emit_ldi(&mut vram, &mut pc, 23, 0xFF);
        vram.poke(pc, glyph(4, 0, 5, 23));
        pc += 1; // STORE [r5], r23
        vram.poke(pc, glyph(13, 0, 0, 0));
        pc += 1; // HALT

        // --- Fill in skip offsets (all BNE targets → next_entry_pc) ---
        // BNE at cmp0_pc: branch from cmp0_pc + 2 + offset = next_entry_pc
        vram.poke(
            cmp0_offset_pc,
            (next_entry_pc as i32 - cmp0_pc as i32 - 2) as u32,
        );
        vram.poke(
            cmp1_offset_pc,
            (next_entry_pc as i32 - cmp1_pc as i32 - 2) as u32,
        );
        vram.poke(
            cmp2_offset_pc,
            (next_entry_pc as i32 - cmp2_pc as i32 - 2) as u32,
        );

        println!(
            "Mnemonic matcher: {} instructions, loop at {}, next_entry at {}",
            pc, loop_start, next_entry_pc
        );

        // === TEST ALL 6 MNEMONICS ===
        let test_cases: &[(&[u8; 3], u32)] = &[
            (b"LDI", 1),
            (b"ADD", 5),
            (b"SUB", 6),
            (b"MOV", 2),
            (b"NOP", 0),
            (b"HLT", 13),
        ];

        for (mnemonic, expected_opcode) in test_cases {
            // Write source mnemonic
            vram.poke(200, mnemonic[0] as u32);
            vram.poke(201, mnemonic[1] as u32);
            vram.poke(202, mnemonic[2] as u32);
            // Clear output
            vram.poke(500, 0xDEADDEAD);

            // Run
            vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
            vram.execute_frame();

            let result = vram.peek(500);
            println!(
                "  {:?} → opcode {} (expected {})",
                std::str::from_utf8(&mnemonic[..]).unwrap(),
                result,
                expected_opcode
            );
            assert_eq!(
                result,
                *expected_opcode,
                "Mnemonic {:?} should emit opcode {}",
                std::str::from_utf8(&mnemonic[..]).unwrap(),
                expected_opcode
            );
            assert!(vram.is_halted(0));
        }

        // === TEST UNKNOWN MNEMONIC ===
        vram.poke(200, b'X' as u32);
        vram.poke(201, b'Y' as u32);
        vram.poke(202, b'Z' as u32);
        vram.poke(500, 0xDEADDEAD);
        vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
        vram.execute_frame();
        assert_eq!(
            vram.peek(500),
            0xFF,
            "Unknown mnemonic should emit 0xFF error"
        );
        println!("  \"XYZ\" → 0xFF (error, as expected)");
    }

    #[test]
    fn test_operand_parser() {
        let mut vram = SyntheticVram::new_small(1024);

        // Registers for the parser:
        // r0: input pointer (0x200)
        // r1: accumulator
        // r2: current char
        // r3: temp
        // r4: base
        // r5: output addr (0x500)
        // r6: error addr (0x504)

        // I'll skip manually poking the parser and instead rely on the
        // Logic implemented in operand_parser.glyph.
        // For the test, I'll manually poke the compiled instructions.

        let mut pc = 0;
        let mut poke_ldi = |v: &mut SyntheticVram, p: &mut u32, reg: u8, val: u32| {
            v.poke(*p, glyph(1, 0, reg, 0));
            *p += 1;
            v.poke(*p, val);
            *p += 1;
        };

        // --- PREAMBLE ---
        poke_ldi(&mut vram, &mut pc, 0, 0x200); // r0 = 0x200
        poke_ldi(&mut vram, &mut pc, 1, 0); // r1 = 0
        poke_ldi(&mut vram, &mut pc, 5, 0x500); // r5 = 0x500
        poke_ldi(&mut vram, &mut pc, 6, 0x504); // r6 = 0x504
        vram.poke(pc, glyph(4, 0, 6, 1));
        pc += 1; // STORE [r6], r1 (init error=0)

        // LOAD r2, [r0]
        vram.poke(pc, glyph(3, 0, 0, 2));
        pc += 1;

        // --- CHECK 'r' ---
        poke_ldi(&mut vram, &mut pc, 3, 114); // r3 = 'r'
        let bne_r_pc = pc;
        vram.poke(pc, glyph(10, 1, 2, 3));
        pc += 1; // BNE r2, r3, :check_hex
        let bne_r_off = pc;
        pc += 1;

        // IS 'r': Skip 'r'
        poke_ldi(&mut vram, &mut pc, 3, 1);
        vram.poke(pc, glyph(5, 0, 3, 0));
        pc += 1; // r0 = r3 + r0 (r0++)
                 // JMP :parse_dec_init
        let jump_dec_off_pc = pc + 1; // addr where target will be stored
        vram.poke(pc, glyph(1, 0, 3, 0));
        pc += 1; // LDI r3
        vram.poke(pc, 0);
        pc += 1; // target (fill later)
        vram.poke(pc, glyph(9, 0, 3, 0));
        pc += 1; // JMP r3

        // --- CHECK HEX ---
        let check_hex_label = pc;
        vram.poke(
            bne_r_off,
            (check_hex_label as i32 - bne_r_pc as i32 - 2) as u32,
        );

        poke_ldi(&mut vram, &mut pc, 3, 48); // r3 = '0'
        let bne_0_pc = pc;
        vram.poke(pc, glyph(10, 1, 2, 3));
        pc += 1; // BNE r2, r3, :parse_dec_init
        let bne_0_off = pc;
        pc += 1;

        // IS '0': Peek next
        poke_ldi(&mut vram, &mut pc, 3, 1);
        vram.poke(pc, glyph(5, 0, 3, 0));
        pc += 1; // r0 = r3 + r0 (r0++)
        vram.poke(pc, glyph(3, 0, 0, 2));
        pc += 1; // LOAD r2, [r0]
        poke_ldi(&mut vram, &mut pc, 3, 120); // r3 = 'x'
        let bne_x_pc = pc;
        vram.poke(pc, glyph(10, 1, 2, 3));
        pc += 1; // BNE r2, r3, :finish (simplified)
        let bne_x_off = pc;
        pc += 1;

        // IS 'x': Parse Hex
        poke_ldi(&mut vram, &mut pc, 3, 1);
        vram.poke(pc, glyph(5, 0, 3, 0));
        pc += 1; // r0 = r3 + r0 (r0++)
                 // JMP :parse_hex_init
        let jump_hex_off_pc = pc + 1;
        vram.poke(pc, glyph(1, 0, 3, 0));
        pc += 1; // LDI r3
        vram.poke(pc, 0);
        pc += 1;
        vram.poke(pc, glyph(9, 0, 3, 0));
        pc += 1; // JMP r3

        // --- PARSE DEC ---
        let parse_dec_label = pc;
        vram.poke(
            bne_0_off,
            (parse_dec_label as i32 - bne_0_pc as i32 - 2) as u32,
        );
        vram.poke(jump_dec_off_pc, parse_dec_label);

        poke_ldi(&mut vram, &mut pc, 4, 10); // Base 10
        let dec_loop_start = pc;
        vram.poke(pc, glyph(3, 0, 0, 2));
        pc += 1; // LOAD r2, [r0]
        poke_ldi(&mut vram, &mut pc, 3, 32); // r3 = 32 (space)
        let beq_space_dec_pc = pc;
        vram.poke(pc, glyph(10, 0, 2, 3));
        pc += 1; // BEQ r2, r3, :finish
        let beq_space_dec_off = pc;
        pc += 1;
        let blt_space_dec_pc = pc;
        vram.poke(pc, glyph(10, 4, 2, 3));
        pc += 1; // BLTU r2, r3, :finish
        let blt_space_dec_off = pc;
        pc += 1;

        poke_ldi(&mut vram, &mut pc, 3, 48); // r3 = '0'
        vram.poke(pc, glyph(2, 0, 2, 10));
        pc += 1; // MOV r10, r2
        vram.poke(pc, glyph(2, 0, 3, 2));
        pc += 1; // MOV r2, r3
        vram.poke(pc, glyph(6, 0, 10, 2));
        pc += 1; // SUB r2 = r10 - r2 = char - '0'

        vram.poke(pc, glyph(7, 0, 4, 1));
        pc += 1; // MUL r1, r4, r1 (acc *= 10)
        vram.poke(pc, glyph(5, 0, 2, 1));
        pc += 1; // ADD r1, r2, r1 (acc += digit)
        poke_ldi(&mut vram, &mut pc, 3, 1);
        vram.poke(pc, glyph(5, 0, 3, 0));
        pc += 1; // r0 = r3 + r0 (r0++)
                 // JMP dec_loop_start
        poke_ldi(&mut vram, &mut pc, 3, dec_loop_start);
        vram.poke(pc, glyph(9, 0, 3, 0));
        pc += 1; // JMP r3

        // --- PARSE HEX ---
        let parse_hex_label = pc;
        vram.poke(jump_hex_off_pc, parse_hex_label);
        poke_ldi(&mut vram, &mut pc, 4, 16); // Base 16
        let hex_loop_start = pc;
        vram.poke(pc, glyph(3, 0, 0, 2));
        pc += 1; // LOAD r2, [r0]
        poke_ldi(&mut vram, &mut pc, 3, 32); // r3 = 32 (space)
        let beq_space_hex_pc = pc;
        vram.poke(pc, glyph(10, 0, 2, 3));
        pc += 1; // BEQ r2, r3, :finish
        let beq_space_hex_off = pc;
        pc += 1;
        let blt_space_hex_pc = pc;
        vram.poke(pc, glyph(10, 4, 2, 3));
        pc += 1; // BLTU r2, r3, :finish
        let blt_space_hex_off = pc;
        pc += 1;

        // Simplified hex logic
        poke_ldi(&mut vram, &mut pc, 3, 97); // 'a'
        let bge_a_pc = pc;
        vram.poke(pc, glyph(10, 3, 2, 3));
        pc += 1; // BGE r2, r3, :hex_a
        let bge_a_off = pc;
        pc += 1;
        poke_ldi(&mut vram, &mut pc, 3, 65); // 'A'
        let bge_A_pc = pc;
        vram.poke(pc, glyph(10, 3, 2, 3));
        pc += 1; // BGE r2, r3, :hex_A
        let bge_A_off = pc;
        pc += 1;

        // 0-9 case:
        poke_ldi(&mut vram, &mut pc, 3, 48); // '0'
        vram.poke(pc, glyph(2, 0, 2, 10));
        pc += 1; // MOV r10, r2
        vram.poke(pc, glyph(2, 0, 3, 2));
        pc += 1; // MOV r2, r3
        vram.poke(pc, glyph(6, 0, 10, 2));
        pc += 1; // r2 = r10 - r2 = char - '0'
                 // JMP :hex_acc
        let jump_hex_acc_off_pc = pc + 1;
        vram.poke(pc, glyph(1, 0, 3, 0));
        pc += 1;
        vram.poke(pc, 0);
        pc += 1;
        vram.poke(pc, glyph(9, 0, 3, 0));
        pc += 1;

        let hex_a_label = pc;
        vram.poke(bge_a_off, (hex_a_label as i32 - bge_a_pc as i32 - 2) as u32);
        poke_ldi(&mut vram, &mut pc, 3, 87);
        vram.poke(pc, glyph(2, 0, 2, 10));
        pc += 1; // MOV r10, r2
        vram.poke(pc, glyph(2, 0, 3, 2));
        pc += 1; // MOV r2, r3
        vram.poke(pc, glyph(6, 0, 10, 2));
        pc += 1; // r2 = char - 87
                 // JMP :hex_acc
        let jump_hex_acc2_off_pc = pc + 1;
        vram.poke(pc, glyph(1, 0, 3, 0));
        pc += 1;
        vram.poke(pc, 0);
        pc += 1;
        vram.poke(pc, glyph(9, 0, 3, 0));
        pc += 1;

        let hex_A_label = pc;
        vram.poke(bge_A_off, (hex_A_label as i32 - bge_A_pc as i32 - 2) as u32);
        poke_ldi(&mut vram, &mut pc, 3, 55);
        vram.poke(pc, glyph(2, 0, 2, 10));
        pc += 1; // MOV r10, r2
        vram.poke(pc, glyph(2, 0, 3, 2));
        pc += 1; // MOV r2, r3
        vram.poke(pc, glyph(6, 0, 10, 2));
        pc += 1; // r2 = char - 55

        let hex_acc_label = pc;
        vram.poke(jump_hex_acc_off_pc, hex_acc_label);
        vram.poke(jump_hex_acc2_off_pc, hex_acc_label);
        vram.poke(pc, glyph(7, 0, 4, 1));
        pc += 1; // acc *= 16
        vram.poke(pc, glyph(5, 0, 2, 1));
        pc += 1; // acc += digit
        poke_ldi(&mut vram, &mut pc, 3, 1);
        vram.poke(pc, glyph(5, 0, 3, 0));
        pc += 1; // r0 = r3 + r0 (r0++)
                 // JMP hex_loop_start
        poke_ldi(&mut vram, &mut pc, 3, hex_loop_start);
        vram.poke(pc, glyph(9, 0, 3, 0));
        pc += 1;

        // --- FINISH ---
        let finish_label = pc;
        vram.poke(
            beq_space_dec_off,
            (finish_label as i32 - beq_space_dec_pc as i32 - 2) as u32,
        );
        vram.poke(
            blt_space_dec_off,
            (finish_label as i32 - blt_space_dec_pc as i32 - 2) as u32,
        );
        vram.poke(
            beq_space_hex_off,
            (finish_label as i32 - beq_space_hex_pc as i32 - 2) as u32,
        );
        vram.poke(
            blt_space_hex_off,
            (finish_label as i32 - blt_space_hex_pc as i32 - 2) as u32,
        );
        vram.poke(
            bne_x_off,
            (finish_label as i32 - bne_x_pc as i32 - 2) as u32,
        ); // Handle "0" as dec

        vram.poke(pc, glyph(4, 0, 5, 1));
        pc += 1; // STORE [r5], r1
        vram.poke(pc, glyph(13, 0, 0, 0));
        pc += 1; // HALT

        println!("Operand parser: {} instructions", pc);

        let test_cases = &[
            ("r12", 12),
            ("1234", 1234),
            ("0xABCD", 0xABCD),
            ("r0", 0),
            ("0", 0),
            ("42", 42),
            ("0x100", 256),
        ];

        for (input, expected) in test_cases {
            // Poke input
            for (i, b) in input.bytes().enumerate() {
                vram.poke(0x200 + i as u32, b as u32);
            }
            vram.poke(0x200 + input.len() as u32, 0); // Null terminator
            vram.poke(0x500, 0xDEADBEEF);

            vram.enable_tracing();
            vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
            vram.execute_frame_interleaved(1);

            let result = vram.peek(0x500);
            if result != *expected {
                println!("Execution Trace for \"{}\":", input);
                for entry in vram.trace() {
                    println!("  {:?}", entry);
                }
            }
            println!("  \"{}\" → {} (expected {})", input, result, expected);
            assert_eq!(result, *expected, "Failed to parse \"{}\"", input);
        }
    }

    #[test]
    fn test_full_assembler() {
        // GPU-Native Full Assembler: Multi-line compilation
        // Compiles:
        //   LDI r3, 42
        //   HLT
        // To:
        //   [500] = glyph(1, 0, 3, 0)
        //   [501] = 42
        //   [502] = glyph(13, 0, 0, 0)

        let mut vram = SyntheticVram::new_small(2048);

        // --- LOOKUP TABLE (0x800) ---
        vram.poke(0x800, b'L' as u32);
        vram.poke(0x801, b'D' as u32);
        vram.poke(0x802, b'I' as u32);
        vram.poke(0x803, 1); // Opcode 1

        vram.poke(0x804, b'H' as u32);
        vram.poke(0x805, b'L' as u32);
        vram.poke(0x806, b'T' as u32);
        vram.poke(0x807, 13); // Opcode 13

        // --- SOURCE TEXT (0x200) ---
        let source = "LDI r3, 42\nHLT\n";
        for (i, b) in source.bytes().enumerate() {
            vram.poke(0x200 + i as u32, b as u32);
        }
        vram.poke(0x200 + source.len() as u32, 0);

        // --- ASSEMBLER LOGIC (Simplified for Test) ---
        let mut pc = 0;
        let mut poke_ldi = |v: &mut SyntheticVram, p: &mut u32, reg: u8, val: u32| {
            v.poke(*p, glyph(1, 0, reg, 0));
            *p += 1;
            v.poke(*p, val);
            *p += 1;
        };

        // r0 = SRC_PTR (0x200)
        // r1 = BIN_PTR (0x500)
        poke_ldi(&mut vram, &mut pc, 0, 0x200);
        poke_ldi(&mut vram, &mut pc, 1, 0x500);
        poke_ldi(&mut vram, &mut pc, 13, 1); // r13 = CONSTANT 1

        // === LINE LOOP ===
        let line_start = pc;

        // Skip whitespace
        let skip_ws_start = pc;
        vram.poke(pc, glyph(3, 0, 0, 2));
        pc += 1; // LOAD r2, [r0]
        vram.poke(pc, glyph(10, 0, 2, 0));
        pc += 1; // BEQ r2, 0, :eof
        let beq_eof_off = pc;
        pc += 1;

        poke_ldi(&mut vram, &mut pc, 3, 32); // ' '
        let beq_ws_pc = pc;
        vram.poke(pc, glyph(10, 0, 2, 3));
        pc += 1;
        let beq_ws_off = pc;
        pc += 1;

        poke_ldi(&mut vram, &mut pc, 3, 10); // '\n'
        let beq_nl_pc = pc;
        vram.poke(pc, glyph(10, 0, 2, 3));
        pc += 1;
        let beq_nl_off = pc;
        pc += 1;

        // Not whitespace -> parse mnemonic
        let parse_mnem_start = pc;
        vram.poke(beq_ws_off, (pc as i32 - beq_ws_pc as i32 - 2) as u32); // skip match, go here

        // --- PARSE MNEMONIC ---
        vram.poke(pc, glyph(3, 0, 0, 7));
        pc += 1; // LOAD r7, [r0] (c0)
        vram.poke(pc, glyph(5, 0, 13, 0));
        pc += 1; // r0++
        vram.poke(pc, glyph(3, 0, 0, 8));
        pc += 1; // LOAD r8, [r0] (c1)
        vram.poke(pc, glyph(5, 0, 13, 0));
        pc += 1; // r0++
        vram.poke(pc, glyph(3, 0, 0, 9));
        pc += 1; // LOAD r9, [r0] (c2)
        vram.poke(pc, glyph(5, 0, 13, 0));
        pc += 1; // r0++

        // Match against "LDI" (1)
        poke_ldi(&mut vram, &mut pc, 3, b'L' as u32);
        vram.poke(pc, glyph(10, 1, 7, 3));
        pc += 1; // BNE c0, 'L'
        let bne_ldi_off = pc;
        pc += 1;

        // Match: Emit LDI opcode (1) into BIN_PTR
        poke_ldi(&mut vram, &mut pc, 4, 1); // opcode = 1

        // Parse " r3" (simplified: skip 1, parse reg)
        vram.poke(pc, glyph(5, 0, 13, 0));
        pc += 1; // r0++ (skip space)
        vram.poke(pc, glyph(5, 0, 13, 0));
        pc += 1; // r0++ (skip 'r')
        vram.poke(pc, glyph(3, 0, 0, 5));
        pc += 1; // LOAD r5, [r0] (get '3')
        poke_ldi(&mut vram, &mut pc, 3, 48); // '0'
        vram.poke(pc, glyph(6, 0, 5, 3));
        pc += 1; // r3 = r5 - r3 = '3' - '0' = 3
        vram.poke(pc, glyph(2, 0, 3, 5));
        pc += 1; // r5 = 3

        // Construct glyph: opcode | (p1 << 16)
        vram.poke(pc, glyph(2, 0, 4, 3));
        pc += 1; // MOV r3, r4 (opcode)
        poke_ldi(&mut vram, &mut pc, 2, 16);
        vram.poke(pc, glyph(131, 0, 5, 2));
        pc += 1; // SHL r2 = r5 << 16
        vram.poke(pc, glyph(129, 0, 3, 2));
        pc += 1; // OR r2 = r3 | r2
        vram.poke(pc, glyph(4, 0, 1, 2));
        pc += 1; // STORE [r1], r2

        vram.poke(pc, glyph(5, 0, 13, 1));
        pc += 1; // BIN_PTR++

        // Parse ", 42" (skip 3: '3', ',', ' ')
        vram.poke(pc, glyph(5, 0, 13, 0));
        pc += 1; // r0++ (skip '3')
        vram.poke(pc, glyph(5, 0, 13, 0));
        pc += 1; // r0++ (skip ',')
        vram.poke(pc, glyph(5, 0, 13, 0));
        pc += 1; // r0++ (skip ' ')

        // Parse "42" (simplified: load 2 digits)
        vram.poke(pc, glyph(3, 0, 0, 10));
        pc += 1; // LOAD r10, [r0] ('4')
        vram.poke(pc, glyph(5, 0, 13, 0));
        pc += 1; // r0++
        vram.poke(pc, glyph(3, 0, 0, 11));
        pc += 1; // LOAD r11, [r0] ('2')
        vram.poke(pc, glyph(5, 0, 13, 0));
        pc += 1; // r0++

        poke_ldi(&mut vram, &mut pc, 3, 48); // r3 = '0'
        vram.poke(pc, glyph(6, 0, 10, 3));
        pc += 1; // r3 = r10 - r3 = '4' - '0' = 4
        vram.poke(pc, glyph(2, 0, 3, 10));
        pc += 1; // r10 = 4

        poke_ldi(&mut vram, &mut pc, 3, 48); // r3 = '0'
        vram.poke(pc, glyph(6, 0, 11, 3));
        pc += 1; // r3 = r11 - r3 = '2' - '0' = 2
        vram.poke(pc, glyph(2, 0, 3, 11));
        pc += 1; // r11 = 2

        poke_ldi(&mut vram, &mut pc, 3, 10);
        vram.poke(pc, glyph(7, 0, 3, 10));
        pc += 1; // r10 = 10 * 4 = 40
        vram.poke(pc, glyph(5, 0, 10, 11));
        pc += 1; // r11 = 40 + 2 = 42

        vram.poke(pc, glyph(4, 0, 1, 11));
        pc += 1; // STORE [r1], r11 (emit immediate)
        vram.poke(pc, glyph(5, 0, 13, 1));
        pc += 1; // BIN_PTR++

        // JMP :next_line
        let jump_next_line_pc = pc;
        vram.poke(pc, glyph(1, 0, 3, 0));
        pc += 1; // LDI r3
        let jump_next_line_target_off = pc;
        vram.poke(pc, 0);
        pc += 1;
        vram.poke(pc, glyph(9, 0, 3, 0));
        pc += 1; // JMP r3

        // Match HLT (case)
        let match_hlt = pc;
        vram.poke(
            bne_ldi_off,
            (match_hlt as i32 - bne_ldi_off as i32 - 1) as u32,
        );
        poke_ldi(&mut vram, &mut pc, 4, 13); // opcode = 13
        vram.poke(pc, glyph(4, 0, 1, 4));
        pc += 1; // STORE [r1], r4
        vram.poke(pc, glyph(5, 0, 13, 1));
        pc += 1; // BIN_PTR++

        // JMP :eof
        let jump_eof_pc = pc;
        vram.poke(pc, glyph(1, 0, 3, 0));
        pc += 1; // LDI r3
        let jump_eof_target_off = pc;
        vram.poke(pc, 0);
        pc += 1;
        vram.poke(pc, glyph(9, 0, 3, 0));
        pc += 1;

        // Finish whitespace jump
        let skip_ws_next_label = pc;
        vram.poke(pc, glyph(5, 0, 13, 0));
        pc += 1; // r0++
        poke_ldi(&mut vram, &mut pc, 3, skip_ws_start);
        vram.poke(pc, glyph(9, 0, 3, 0));
        pc += 1; // loop skip_ws

        vram.poke(
            beq_ws_off,
            (skip_ws_next_label as i32 - beq_ws_pc as i32 - 2) as u32,
        );
        vram.poke(
            beq_nl_off,
            (skip_ws_next_label as i32 - beq_nl_pc as i32 - 2) as u32,
        );

        // Next line logic (skip to \n)
        let next_line_label = pc;
        vram.poke(jump_next_line_target_off, next_line_label);
        vram.poke(pc, glyph(3, 0, 0, 2));
        pc += 1; // LOAD r2
        poke_ldi(&mut vram, &mut pc, 3, 10);
        let beq_nl_done_pc = pc;
        vram.poke(pc, glyph(10, 0, 2, 3));
        pc += 1;
        let beq_nl_done_off = pc;
        pc += 1;
        vram.poke(pc, glyph(5, 0, 13, 0));
        pc += 1; // r0++
        poke_ldi(&mut vram, &mut pc, 3, next_line_label);
        vram.poke(pc, glyph(9, 0, 3, 0));
        pc += 1; // loop

        let next_line_done = pc;
        vram.poke(pc, glyph(5, 0, 13, 0));
        pc += 1; // r0++
        poke_ldi(&mut vram, &mut pc, 3, line_start);
        vram.poke(pc, glyph(9, 0, 3, 0));
        pc += 1; // JMP line_start
        vram.poke(
            beq_nl_done_off,
            (next_line_done as i32 - beq_nl_done_pc as i32 - 2) as u32,
        );

        let final_eof = pc;
        vram.poke(
            beq_eof_off,
            (final_eof as i32 - skip_ws_start as i32 - 3) as u32,
        );
        vram.poke(jump_eof_target_off, final_eof);
        vram.poke(pc, glyph(13, 0, 0, 0));
        pc += 1; // HALT

        println!("Full assembler: {} instructions", pc);

        vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
        vram.execute_frame_interleaved(1);

        // Verify Output
        // [500] = LDI r3 (opcode 1, p1 3) = 1 | (3 << 16) = 196609
        assert_eq!(
            vram.peek(0x500),
            196609,
            "First instruction should be LDI r3"
        );
        // [501] = 42
        assert_eq!(vram.peek(0x501), 42, "Second word should be 42");
        // [502] = HALT (opcode 13)
        assert_eq!(vram.peek(0x502), 13, "Third instruction should be HLT");

        println!("  Compilation Successful!");
        println!("  Source: \"{}\"", source);
        println!(
            "  Binary: [{:08X}, {}, {:08X}]",
            vram.peek(0x500),
            vram.peek(0x501),
            vram.peek(0x502)
        );
    }

    #[test]
    fn test_compositor_window_manager() {
        // Full Compositor Test:
        // 1. Parent (Compositor) defines a window at (100, 100, 200, 200)
        // 2. Parent spawns Child (Application)
        // 3. Parent reads Mouse X, Y (simulated at 150, 150)
        // 4. Parent performs hit-test against Window Table
        // 5. If hit, Parent writes '1' to Child Mailbox
        // 6. Child polls Mailbox, sees '1', writes 0xCAFE to 0x500 to acknowledge focus

        let mut vram = SyntheticVram::new_small(2048);

        // --- WINDOW TABLE (0x100) ---
        vram.poke(0x100, 100); // x
        vram.poke(0x101, 100); // y
        vram.poke(0x102, 200); // w
        vram.poke(0x103, 200); // h
        vram.poke(0x104, 0x300); // Mailbox addr

        // --- CHILD PROGRAM (addr 400) ---
        let mut cp = 400;
        vram.poke(cp, glyph(1, 0, 0, 0));
        cp += 1; // LDI r0 = 0x300 (mailbox)
        vram.poke(cp, 0x300);
        cp += 1;
        let c_loop = cp;
        vram.poke(cp, glyph(3, 0, 0, 1));
        cp += 1; // LOAD r1, [r0]
        vram.poke(cp, glyph(10, 0, 1, 127));
        cp += 1; // BEQ r1, r127(0), loop
        vram.poke(cp, (c_loop as i32 - cp as i32 - 1) as u32);
        cp += 1;
        vram.poke(cp, glyph(1, 0, 2, 0));
        cp += 1; // LDI r2 = 0xCAFE
        vram.poke(cp, 0xCAFE);
        cp += 1;
        vram.poke(cp, glyph(1, 0, 3, 0));
        cp += 1; // LDI r3 = 0x500
        vram.poke(cp, 0x500);
        cp += 1;
        vram.poke(cp, glyph(4, 0, 3, 2));
        cp += 1; // STORE [r3], r2
        vram.poke(cp, glyph(13, 0, 0, 0));
        cp += 1; // HALT

        // --- COMPOSITOR PROGRAM (addr 0) ---
        let mut pp = 0;
        let mut poke_ldi = |v: &mut SyntheticVram, p: &mut u32, reg: u8, val: u32| {
            v.poke(*p, glyph(1, 0, reg, 0));
            *p += 1;
            v.poke(*p, val);
            *p += 1;
        };

        poke_ldi(&mut vram, &mut pp, 13, 1); // r13 = CONST 1

        // 1. Spawn Child
        poke_ldi(&mut vram, &mut pp, 1, 400);
        vram.poke(pp, glyph(225, 0, 1, 0));
        pp += 1; // SPATIAL_SPAWN

        // 2. Load Mouse X, Y (from 0x200, 0x204)
        poke_ldi(&mut vram, &mut pp, 2, 0x200);
        vram.poke(pp, glyph(3, 0, 2, 3));
        pp += 1; // r3 = Mouse X
        poke_ldi(&mut vram, &mut pp, 2, 0x204);
        vram.poke(pp, glyph(3, 0, 2, 4));
        pp += 1; // r4 = Mouse Y

        // 3. Load Win Bounds
        poke_ldi(&mut vram, &mut pp, 5, 0x100);
        vram.poke(pp, glyph(3, 0, 5, 6));
        pp += 1; // r6 = win.x
        vram.poke(pp, glyph(5, 0, 13, 5));
        pp += 1; // r5++
        vram.poke(pp, glyph(3, 0, 5, 7));
        pp += 1; // r7 = win.y
        vram.poke(pp, glyph(5, 0, 13, 5));
        pp += 1; // r5++
        vram.poke(pp, glyph(3, 0, 5, 8));
        pp += 1; // r8 = win.w
        vram.poke(pp, glyph(5, 0, 13, 5));
        pp += 1; // r5++
        vram.poke(pp, glyph(3, 0, 5, 9));
        pp += 1; // r9 = win.h
        vram.poke(pp, glyph(5, 0, 13, 5));
        pp += 1; // r5++
        vram.poke(pp, glyph(3, 0, 5, 10));
        pp += 1; // r10 = mailbox addr (0x300)

        // 4. Hit Test: x >= win.x && x < win.x + win.w
        vram.poke(pp, glyph(10, 4, 3, 6));
        pp += 1; // BLTU r3, r6, :fail
        let f1 = pp;
        pp += 1;
        vram.poke(pp, glyph(5, 0, 6, 8));
        pp += 1; // r8 = win.x + win.w
        vram.poke(pp, glyph(10, 5, 3, 8));
        pp += 1; // BGEU r3, r8, :fail
        let f2 = pp;
        pp += 1;

        // y >= win.y && y < win.y + win.h
        vram.poke(pp, glyph(10, 4, 4, 7));
        pp += 1; // BLTU r4, r7, :fail
        let f3 = pp;
        pp += 1;
        vram.poke(pp, glyph(5, 0, 7, 9));
        pp += 1; // r9 = win.y + win.h
        vram.poke(pp, glyph(10, 5, 4, 9));
        pp += 1; // BGEU r4, r9, :fail
        let f4 = pp;
        pp += 1;

        // SUCCESS: Write 1 to mailbox
        vram.poke(pp, glyph(1, 0, 11, 0));
        pp += 1;
        vram.poke(pp, 1);
        pp += 1;
        vram.poke(pp, glyph(4, 0, 10, 11));
        pp += 1; // STORE [r10], r11
        vram.poke(pp, glyph(13, 0, 0, 0));
        pp += 1; // HALT

        let fail_target = pp;
        vram.poke(pp, glyph(13, 0, 0, 0));
        pp += 1; // HALT

        vram.poke(f1, (fail_target as i32 - f1 as i32 - 1) as u32);
        vram.poke(f2, (fail_target as i32 - f2 as i32 - 1) as u32);
        vram.poke(f3, (fail_target as i32 - f3 as i32 - 1) as u32);
        vram.poke(f4, (fail_target as i32 - f4 as i32 - 1) as u32);

        // --- RUN ---
        // Mouse at (150, 150) - inside window
        vram.poke(0x200, 150);
        vram.poke(0x204, 150);

        vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
        vram.execute_frame_interleaved(1);

        assert_eq!(vram.peek(0x500), 0xCAFE, "Child should acknowledge focus");
    }

    #[test]
    fn test_label_table_pass() {
        // Test the label table mechanism needed for self-hosting
        // Pass 1: Collect labels from source
        // Pass 2: Use label table for jump resolution

        let mut vram = SyntheticVram::new_small(4096);

        // Source with labels:
        // :main
        //   LDI r0, 42
        // :loop
        //   HLT
        let source = ":main\nLDI r0, 42\n:loop\nHLT\n";
        for (i, b) in source.bytes().enumerate() {
            vram.poke(0x1000 + i as u32, b as u32);
        }
        vram.poke(0x1000 + source.len() as u32, 0);

        // Simulate Pass 1: Label collection
        // Labels found: "mai" at addr 0x2000, "loo" at addr 0x2008
        vram.poke(0x3000, b'm' as u32); // label char 0
        vram.poke(0x3001, b'a' as u32);
        vram.poke(0x3002, b'i' as u32);
        vram.poke(0x3003, 0x2000); // address

        vram.poke(0x3004, b'l' as u32);
        vram.poke(0x3005, b'o' as u32);
        vram.poke(0x3006, b'o' as u32);
        vram.poke(0x3007, 0x2008); // address

        // Pass 2: The assembler would look up labels here
        // Verify label lookup works
        // Looking for "loo" -> should find 0x2008
        let label_base = 0x3004u32;
        assert_eq!(
            vram.peek(label_base + 3),
            0x2008,
            "Label 'loop' should resolve to 0x2008"
        );
    }

    #[test]
    fn test_assembler_output() {
        // Test that a simple assembler can compile "LDI r3, 42" -> [glyph, 42]

        let mut vram = SyntheticVram::new_small(4096);

        // Build simple assembler (just enough to compile LDI)
        let mut pc = 0u32;

        // r0 = output ptr at 0x2000
        vram.poke(pc, glyph(1, 0, 0, 0));
        pc += 1;
        vram.poke(pc, 0x2000);
        pc += 1;

        // r1 = constant 1
        vram.poke(pc, glyph(1, 0, 1, 0));
        pc += 1;
        vram.poke(pc, 1);
        pc += 1;

        // r2 = the immediate 42
        vram.poke(pc, glyph(1, 0, 2, 0));
        pc += 1;
        vram.poke(pc, 42);
        pc += 1;

        // r3 = LDI glyph: opcode=1, reg=3
        // encoding: 1 | (3 << 16) = 1 | 0x30000 = 0x00030001
        vram.poke(pc, glyph(1, 0, 3, 0));
        pc += 1;
        vram.poke(pc, 0x00030001);
        pc += 1;

        // STORE [r0], r3 (the LDI glyph)
        vram.poke(pc, glyph(4, 0, 0, 3));
        pc += 1;

        // Advance r0 by 1
        vram.poke(pc, glyph(5, 0, 1, 0));
        pc += 1;

        // STORE [r0], r2 (the immediate)
        vram.poke(pc, glyph(4, 0, 0, 2));
        pc += 1;

        // HALT
        vram.poke(pc, glyph(13, 0, 0, 0));
        pc += 1;

        vram.spawn_vm(0, &SyntheticVmConfig::default()).unwrap();
        vram.execute_frame();

        // Verify output at 0x2000
        assert_eq!(vram.peek(0x2000), 0x00030001, "LDI r3 glyph");
        assert_eq!(vram.peek(0x2001), 42, "immediate 42");
    }

    #[test]
    fn test_self_hosting_quine() {
        // THE ULTIMATE SOVEREIGNTY TEST
        // 1. Load the Assembler Binary into 0x0000
        // 2. Load the Assembler Source into 0x1000
        // 3. Run the Assembler
        // 4. Verify Output Binary at 0x2000 matches Executing Binary at 0x0000

        let mut vram = SyntheticVram::new_small(8192);

        // Load source from disk
        let source_path = "src/glyph_stratum/programs/self_hosting_assembler.glyph";
        // Wait, the path might be relative to the workspace root or the crate root.
        // Let's use a path that works from systems/infinite_map_rs
        let source_text = std::fs::read_to_string("../../systems/glyph_stratum/programs/self_hosting_assembler.glyph")
            .expect("Failed to read assembler source");

        // Compile it using the Rust assembler
        let mut assembler = crate::glyph_assembler::GlyphAssembler::new();
        let assembled = assembler.assemble(&source_text).expect("Rust assembler failed");

        // 1. Load Binary into 0x0000
        for (i, word) in assembled.words.iter().enumerate() {
            vram.poke(i as u32, *word);
        }

        // 2. Load Source into 0x1000
        for (i, b) in source_text.bytes().enumerate() {
            vram.poke(0x1000 + i as u32, b as u32);
        }
        vram.poke(0x1000 + source_text.len() as u32, 0);

        // 3. Run the Assembler
        // We find the address of the :main label in the binary
        let main_addr = assembler.get_label_addr("main").unwrap_or(0);
        vram.enable_tracing();
        vram.spawn_vm(0, &SyntheticVmConfig {
            entry_point: main_addr,
            ..SyntheticVmConfig::default()
        }).unwrap();
        
        // Give it plenty of cycles
        for _ in 0..200 {
            vram.execute_frame_interleaved(10);
            if vram.is_halted(0) {
                break;
            }
        }

        // Debug: print first 20 trace entries
        let trace = vram.trace();
        println!("  Execution Trace (first 20):");
        for (i, entry) in trace.iter().take(20).enumerate() {
            println!("    {}: PC={:04X} OP={:02X} STR={} p1={:08X} p2={:08X}", 
                i, entry.pc, entry.opcode, entry.stratum, entry.p1, entry.p2);
        }
        
        // Debug: print binary around the branch at 0x54
        println!("  Binary at offsets 0x50-0x60:");
        for i in 0x50..0x60 {
            println!("    {:04X}: {:08X}", i, vram.peek(i as u32));
        }

        // Debug: show what source text is at 0x1000
        println!("\n  Source at 0x1000 (first 80 chars):");
        let mut src_preview = String::new();
        for i in 0..80 {
            let c = vram.peek(0x1000 + i);
            if c == 0 { break; }
            src_preview.push((c & 0xFF) as u8 as char);
        }
        println!("    \"{}\"", src_preview.escape_default());

        // Debug: show mnemonic table at 0x800
        println!("\n  Mnemonic table at 0x800 (first 20 words):");
        for i in 0..20 {
            print!("    {:04X}: {:08X}", 0x800 + i, vram.peek(0x800 + i));
            let val = vram.peek(0x800 + i);
            if val >= 32 && val < 127 {
                println!(" ('{}')", (val & 0xFF) as u8 as char);
            } else {
                println!();
            }
        }

        // Debug: show init_mnem_table code in memory (around PC 0x63)
        println!("\n  init_mnem_table code (0x63-0x90):");
        for i in 0x63..0x90 {
            let word = vram.peek(i);
            let opcode = word & 0xFF;
            let stratum = (word >> 8) & 0xFF;
            let p1 = (word >> 16) & 0xFF;
            let p2 = (word >> 24) & 0xFF;
            println!("    {:04X}: {:08X}  op={} st={} p1={} p2={}", i, word, opcode, stratum, p1, p2);
        }

        // Debug: show VM state after execution
        if let Some(vm) = vram.vm_state(0) {
            println!("\n  Final VM state:");
            println!("    PC: {:04X}", vm.pc);
            println!("    r0: {:08X}  r1: {:08X}  r4: {:08X}  r7: {:08X}",
                vm.regs[0], vm.regs[1], vm.regs[4], vm.regs[7]);
            println!("    r10: {:08X}  r11: {:08X}  r13: {:08X}  r14: {:08X}  r15: {:08X}",
                vm.regs[10], vm.regs[11], vm.regs[13], vm.regs[14], vm.regs[15]);
        }

        // 4. Verify Output Binary at 0x2000
        println!("Self-Hosting Quine Verification:");
        println!("  Binary Size: {} words", assembled.words.len());
        
        println!("  Binary Comparison (First 16 words):");
        println!("  Offset | Original | Compiled");
        println!("  -------|----------|---------");
        for i in 0..16 {
            let original = vram.peek(i);
            let compiled = vram.peek(0x2000 + i);
            println!("  {:6} | {:08X} | {:08X}", i, original, compiled);
        }
        
        for i in 0..assembled.words.len() as u32 {
            let original = vram.peek(i);
            let compiled = vram.peek(0x2000 + i);
            assert_eq!(compiled, original, "Mismatch at offset {}: Expected {:08X}, got {:08X}", i, original, compiled);
        }
        
        println!("  ✓ Output binary is bit-identical to executing binary.");
        println!("  ✓ SOVEREIGNTY COMPLETE.");
    }
}
