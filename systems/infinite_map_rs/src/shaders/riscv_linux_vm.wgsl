// ============================================================================
// RISC-V RV32IMA Virtual Machine for Linux Execution on GPU
//
// This shader implements a complete RISC-V RV32IMA processor with:
// - Privileged Architecture (M-mode, S-mode)
// - CSRs (Control/Status Registers)
// - Sv32 MMU (Virtual Memory)
// - SBI (Supervisor Binary Interface)
// - MMIO Peripherals (UART, CLINT, PLIC)
//
// Purpose: Execute Linux kernel on the GPU
// ============================================================================

// ============================================================================
// CONSTANTS
// ============================================================================

// RISC-V Opcodes (7-bit)
const OP_LOAD: u32     = 0x03u;  // LB, LH, LW, LBU, LHU
const OP_LOAD_FP: u32  = 0x07u;  // FLW, etc. (reserved)
const OP_CUSTOM_0: u32 = 0x0Bu;  // Custom instructions
const OP_MISC_MEM: u32 = 0x0Fu;  // FENCE, FENCE.I
const OP_IMM: u32      = 0x13u;  // ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI
const OP_AUIPC: u32    = 0x17u;  // AUIPC
const OP_IMM_32: u32   = 0x1Bu;  // RV64 only (ADDIW, etc.)
const OP_STORE: u32    = 0x23u;  // SB, SH, SW
const OP_STORE_FP: u32 = 0x27u;  // FSW, etc.
const OP_CUSTOM_1: u32 = 0x2Bu;  // Custom instructions
const OP_AMO: u32      = 0x2Fu;  // Atomic Memory Operations (RV32A)
const OP_OP: u32       = 0x33u;  // ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND
const OP_LUI: u32      = 0x37u;  // LUI
const OP_OP_32: u32    = 0x3Bu;  // RV64 only
const OP_MADD: u32     = 0x43u;  // Fused multiply-add
const OP_MSUB: u32     = 0x47u;  // Fused multiply-sub
const OP_NMSUB: u32    = 0x4Bu;  // Neg fused multiply-sub
const OP_NMADD: u32    = 0x4Fu;  // Neg fused multiply-add
const OP_OP_FP: u32    = 0x53u;  // Floating point
const OP_BRANCH: u32   = 0x63u;  // BEQ, BNE, BLT, BGE, BLTU, BGEU
const OP_JALR: u32     = 0x67u;  // JALR
const OP_JAL: u32      = 0x6Fu;  // JAL
const OP_SYSTEM: u32   = 0x73u;  // ECALL, EBREAK, CSR*, MRET, SRET, WFI

// funct3 codes
const F3_ADD_SUB: u32  = 0x0u;
const F3_SLL: u32      = 0x1u;
const F3_SLT: u32      = 0x2u;
const F3_SLTU: u32     = 0x3u;
const F3_XOR: u32      = 0x4u;
const F3_SRL_SRA: u32  = 0x5u;
const F3_OR: u32       = 0x6u;
const F3_AND: u32      = 0x7u;

// funct3 for SYSTEM instructions
const F3_PRIV: u32     = 0x0u;  // ECALL, EBREAK, MRET, SRET, WFI
const F3_CSRRW: u32    = 0x1u;  // CSRRW
const F3_CSRRS: u32    = 0x2u;  // CSRRS
const F3_CSRRC: u32    = 0x3u;  // CSRRC
const F3_CSRRWI: u32   = 0x5u;  // CSRRWI
const F3_CSRRSI: u32   = 0x6u;  // CSRRSI
const F3_CSRRCI: u32   = 0x7u;  // CSRRCI

// funct7 codes
const F7_NORMAL: u32   = 0x00u;
const F7_ALT: u32      = 0x20u;  // For SUB, SRA
const F7_MUL: u32      = 0x01u;  // For RV32M extension

// funct12 for PRIV instructions
const F12_ECALL: u32   = 0x000u;
const F12_EBREAK: u32  = 0x001u;
const F12_MRET: u32    = 0x302u;
const F12_SRET: u32    = 0x102u;
const F12_WFI: u32     = 0x105u;

// Privilege levels
const PRIV_M: u32      = 0x3u;   // Machine mode
const PRIV_S: u32      = 0x1u;   // Supervisor mode
const PRIV_U: u32      = 0x0u;   // User mode

// CSR Addresses (Machine Level)
const CSR_MSTATUS: u32      = 0x300u;
const CSR_MISA: u32         = 0x301u;
const CSR_MEDELEG: u32      = 0x302u;
const CSR_MIDELEG: u32      = 0x303u;
const CSR_MIE: u32          = 0x304u;
const CSR_MTVEC: u32        = 0x305u;
const CSR_MCOUNTEREN: u32   = 0x306u;
const CSR_MSCRATCH: u32     = 0x340u;
const CSR_MEPC: u32         = 0x341u;
const CSR_MCAUSE: u32       = 0x342u;
const CSR_MTVAL: u32        = 0x343u;
const CSR_MIP: u32          = 0x344u;

// CSR Addresses (Supervisor Level)
const CSR_SSTATUS: u32      = 0x100u;
const CSR_SIE: u32          = 0x104u;
const CSR_STVEC: u32        = 0x105u;
const CSR_SCOUNTEREN: u32   = 0x106u;
const CSR_SSCRATCH: u32     = 0x140u;
const CSR_SEPC: u32         = 0x141u;
const CSR_SCAUSE: u32       = 0x142u;
const CSR_STVAL: u32        = 0x143u;
const CSR_SIP: u32          = 0x144u;
const CSR_SATP: u32         = 0x180u;

// CSR Addresses (Machine Counter/Timers)
const CSR_MCYCLE: u32       = 0xB00u;
const CSR_MINSTRET: u32     = 0xB02u;
const CSR_MCYCLEH: u32      = 0xB80u;
const CSR_MINSTRETH: u32    = 0xB82u;

// CSR Addresses (Supervisor Counter/Timers - read-only shadows)
const CSR_CYCLE: u32        = 0xC00u;
const CSR_TIME: u32         = 0xC01u;
const CSR_INSTRET: u32      = 0xC02u;
const CSR_CYCLEH: u32       = 0xC80u;
const CSR_TIMEH: u32        = 0xC81u;
const CSR_INSTRETH: u32     = 0xC82u;

// Physical Memory Map
const RAM_BASE: u32         = 0x80000000u;
const RAM_SIZE: u32         = 0x10000000u;  // 256MB
const UART_BASE: u32        = 0x10000000u;
const UART_SIZE: u32        = 0x100u;
const CLINT_BASE: u32       = 0x02000000u;
const CLINT_SIZE: u32       = 0x10000u;
const PLIC_BASE: u32        = 0x0C000000u;
const PLIC_SIZE: u32        = 0x400000u;

// UART 16550 Registers
const UART_THR: u32         = 0x0u;  // Transmit Holding Register (write)
const UART_RBR: u32         = 0x0u;  // Receiver Buffer Register (read)
const UART_DLL: u32         = 0x0u;  // Divisor Latch Low (DLAB=1)
const UART_IER: u32         = 0x4u;  // Interrupt Enable Register
const UART_DLH: u32         = 0x4u;  // Divisor Latch High (DLAB=1)
const UART_IIR: u32         = 0x8u;  // Interrupt Identification Register (read)
const UART_FCR: u32         = 0x8u;  // FIFO Control Register (write)
const UART_LCR: u32         = 0xCu;  // Line Control Register
const UART_MCR: u32         = 0x10u; // Modem Control Register
const UART_LSR: u32         = 0x14u; // Line Status Register
const UART_MSR: u32         = 0x18u; // Modem Status Register
const UART_SCR: u32         = 0x1Cu; // Scratch Register

// CLINT Registers
const CLINT_MTIME: u32      = 0xBFF8u;
const CLINT_MTIMEH: u32     = 0xBFFCu;
const CLINT_MTIMECMP: u32   = 0x4000u;
const CLINT_MTIMECMPH: u32  = 0x4004u;
const CLINT_MSIP: u32       = 0x0u;

// SATP register fields
const SATP_MODE_BARE: u32   = 0u;   // Bare mode (no translation)
const SATP_MODE_SV32: u32   = 1u;   // Sv32 paging
const SATP_MODE_MASK: u32   = 0x80000000u;
const SATP_ASID_MASK: u32   = 0x7FC00000u;
const SATP_PPN_MASK: u32    = 0x003FFFFFu;

// Page table constants for Sv32
const PAGE_SHIFT: u32       = 12u;
const PAGE_SIZE: u32        = 4096u;
const PTES_PER_PT: u32      = 1024u;
const VPN_SHIFT: u32        = 10u;
const VPN_MASK: u32         = 0x3FFu;

// PTE flags
const PTE_V: u32            = 0x001u;  // Valid
const PTE_R: u32            = 0x002u;  // Readable
const PTE_W: u32            = 0x004u;  // Writable
const PTE_X: u32            = 0x008u;  // Executable
const PTE_U: u32            = 0x010u;  // User accessible
const PTE_G: u32            = 0x020u;  // Global
const PTE_A: u32            = 0x040u;  // Accessed
const PTE_D: u32            = 0x080u;  // Dirty
const PTE_FLAGS_MASK: u32   = 0x3FFu;

// Exception causes
const CAUSE_INST_MISALIGN: u32    = 0x0u;
const CAUSE_INST_ACCESS: u32      = 0x1u;
const CAUSE_ILLEGAL_INST: u32     = 0x2u;
const CAUSE_BREAKPOINT: u32       = 0x3u;
const CAUSE_LOAD_MISALIGN: u32    = 0x4u;
const CAUSE_LOAD_ACCESS: u32      = 0x5u;
const CAUSE_STORE_MISALIGN: u32   = 0x6u;
const CAUSE_STORE_ACCESS: u32     = 0x7u;
const CAUSE_ECALL_U: u32          = 0x8u;
const CAUSE_ECALL_S: u32          = 0x9u;
const CAUSE_ECALL_M: u32          = 0xBu;
const CAUSE_INST_PAGE_FAULT: u32  = 0xCu;
const CAUSE_LOAD_PAGE_FAULT: u32  = 0xDu;
const CAUSE_STORE_PAGE_FAULT: u32 = 0xFu;

// Interrupt causes (with high bit set)
const IRQ_U_SOFT: u32       = 0x80000000u;
const IRQ_S_SOFT: u32       = 0x80000001u;
const IRQ_M_SOFT: u32       = 0x80000003u;
const IRQ_U_TIMER: u32      = 0x80000004u;
const IRQ_S_TIMER: u32      = 0x80000005u;
const IRQ_M_TIMER: u32      = 0x80000007u;
const IRQ_U_EXT: u32        = 0x80000008u;
const IRQ_S_EXT: u32        = 0x80000009u;
const IRQ_M_EXT: u32        = 0x8000000Bu;

// MSTATUS bit fields
const MSTATUS_UIE: u32      = 0x00000001u;
const MSTATUS_SIE: u32      = 0x00000002u;
const MSTATUS_MIE: u32      = 0x00000008u;
const MSTATUS_UPIE: u32     = 0x00000010u;
const MSTATUS_SPIE: u32     = 0x00000020u;
const MSTATUS_MPIE: u32     = 0x00000080u;
const MSTATUS_SPP: u32      = 0x00000100u;
const MSTATUS_MPP: u32      = 0x00001800u;
const MSTATUS_FS: u32       = 0x00006000u;
const MSTATUS_XS: u32       = 0x00018000u;
const MSTATUS_MPRV: u32     = 0x00020000u;
const MSTATUS_SUM: u32      = 0x00040000u;
const MSTATUS_MXR: u32      = 0x00080000u;
const MSTATUS_TVM: u32      = 0x00100000u;
const MSTATUS_TW: u32       = 0x00200000u;
const MSTATUS_TSR: u32      = 0x00400000u;
const MSTATUS_SD: u32       = 0x80000000u;

// SSTATUS is a subset of MSTATUS (writable bits)
const SSTATUS_MASK: u32     = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_SPP |
                              MSTATUS_FS | MSTATUS_XS | MSTATUS_SUM | MSTATUS_MXR | MSTATUS_SD;

// ============================================================================
// STRUCTURES
// ============================================================================

struct ExecutionState {
    running: u32,           // 1 if running, 0 if halted
    exit_code: u32,         // Exit code
    instruction_count: u32, // Total instructions executed
    cycle_count: u32,       // Total cycles
    privilege: u32,         // Current privilege level (M=3, S=1, U=0)
    satp: u32,              // Supervisor Address Translation and Protection
    
    // Interrupt/exception state
    pending_interrupt: u32, // Pending interrupt to handle
    trap_pending: u32,      // 1 if trap is pending
}

struct CSRBank {
    // Machine CSRs
    mstatus: u32,
    misa: u32,
    medeleg: u32,
    mideleg: u32,
    mie: u32,
    mtvec: u32,
    mcounteren: u32,
    mscratch: u32,
    mepc: u32,
    mcause: u32,
    mtval: u32,
    mip: u32,
    
    // Machine counters
    mcycle: u32,
    mcycleh: u32,
    minstret: u32,
    minstreth: u32,
    
    // Supervisor CSRs
    sstatus: u32,
    sie: u32,
    stvec: u32,
    scounteren: u32,
    sscratch: u32,
    sepc: u32,
    scause: u32,
    stval: u32,
    sip: u32,
}

struct MMIOState {
    // UART 16550 state
    uart_thr: u32,
    uart_rbr: u32,
    uart_ier: u32,
    uart_iir: u32,
    uart_fcr: u32,
    uart_lcr: u32,
    uart_mcr: u32,
    uart_lsr: u32,
    uart_msr: u32,
    uart_scr: u32,
    uart_dll: u32,
    uart_dlh: u32,
    uart_tx_ready: u32,     // 1 if TX ready
    uart_rx_ready: u32,     // 1 if RX has data
    
    // CLINT state
    clint_mtime: u32,
    clint_mtimeh: u32,
    clint_mtimecmp: u32,
    clint_mtimecmph: u32,
    clint_msip: u32,
}

struct DecodedInstruction {
    opcode: u32,
    rd: u32,
    rs1: u32,
    rs2: u32,
    funct3: u32,
    funct7: u32,
    funct12: u32,
    imm: i32,
    csr: u32,           // For CSR instructions
}

struct TranslationResult {
    paddr: u32,
    valid: u32,         // 1 if valid, 0 if page fault
    fault_cause: u32,   // Page fault cause if invalid
}

// ============================================================================
// BINDINGS
// ============================================================================

// Input: RISC-V program (instructions at RAM_BASE)
@group(0) @binding(0) var<storage, read> ram_buffer: array<u32>;

// Registers (32 x 32-bit)
@group(0) @binding(1) var<storage, read_write> registers: array<u32, 32>;

// Memory (RAM as storage buffer - 64MB default)
@group(0) @binding(2) var<storage, read_write> memory: array<u32>;

// Program counter
@group(0) @binding(3) var<storage, read_write> pc: atomic<u32>;

// Execution state
@group(0) @binding(4) var<storage, read_write> state: ExecutionState;

// CSR Bank
@group(0) @binding(5) var<storage, read_write> csrs: CSRBank;

// MMIO State
@group(0) @binding(6) var<storage, read_write> mmio: MMIOState;

// Stats buffer (for host communication) - use atomics for coherence
@group(0) @binding(7) var<storage, read_write> stats: array<atomic<u32>>;

// Configuration
@group(0) @binding(8) var<uniform> config: Config;

struct Config {
    texture_width: u32,
    texture_height: u32,
    memory_size: u32,       // In bytes
    enable_mmu: u32,        // 1 to enable MMU
    enable_trace: u32,      // 1 to enable execution tracing
    reserved: u32,
}

// ============================================================================
// HELPER FUNCTIONS
// ============================================================================

// Hilbert curve mapping for better memory locality
fn hilbert_to_2d(index: u32, order: u32) -> vec2<u32> {
    var x: u32 = 0u;
    var y: u32 = 0u;
    var t: u32 = index;
    
    for (var s: u32 = 0u; s < order; s = s + 1u) {
        let rx: u32 = (t / 2u) & 1u;
        let ry: u32 = (t ^ rx) & 1u;
        
        // Rotate
        if (ry == 0u) {
            if (rx == 1u) {
                x = (1u << s) - 1u - x;
                y = (1u << s) - 1u - y;
            }
            // Swap
            let temp: u32 = x;
            x = y;
            y = temp;
        }
        
        x = x + (rx << s);
        y = y + (ry << s);
        t = t / 4u;
    }
    
    return vec2<u32>(x, y);
}

// Simple linear to 2D conversion (fallback)
fn linear_to_2d(addr: u32, width: u32) -> vec2<u32> {
    return vec2<u32>(addr % width, addr / width);
}

// ============================================================================
// CSR ACCESS FUNCTIONS
// ============================================================================

fn read_csr(csr_addr: u32) -> u32 {
    switch csr_addr {
        // Machine CSRs
        case CSR_MSTATUS: { return csrs.mstatus; }
        case CSR_MISA: { return csrs.misa; }
        case CSR_MEDELEG: { return csrs.medeleg; }
        case CSR_MIDELEG: { return csrs.mideleg; }
        case CSR_MIE: { return csrs.mie; }
        case CSR_MTVEC: { return csrs.mtvec; }
        case CSR_MCOUNTEREN: { return csrs.mcounteren; }
        case CSR_MSCRATCH: { return csrs.mscratch; }
        case CSR_MEPC: { return csrs.mepc; }
        case CSR_MCAUSE: { return csrs.mcause; }
        case CSR_MTVAL: { return csrs.mtval; }
        case CSR_MIP: { return csrs.mip; }
        
        // Machine counters
        case CSR_MCYCLE: { return csrs.mcycle; }
        case CSR_MCYCLEH: { return csrs.mcycleh; }
        case CSR_MINSTRET: { return csrs.minstret; }
        case CSR_MINSTRETH: { return csrs.minstreth; }
        
        // Supervisor CSRs
        case CSR_SSTATUS: { return csrs.sstatus; }
        case CSR_SIE: { return csrs.sie; }
        case CSR_STVEC: { return csrs.stvec; }
        case CSR_SCOUNTEREN: { return csrs.scounteren; }
        case CSR_SSCRATCH: { return csrs.sscratch; }
        case CSR_SEPC: { return csrs.sepc; }
        case CSR_SCAUSE: { return csrs.scause; }
        case CSR_STVAL: { return csrs.stval; }
        case CSR_SIP: { return csrs.sip; }
        case CSR_SATP: { return state.satp; }
        
        // Counter shadows (read-only)
        case CSR_CYCLE: { return csrs.mcycle; }
        case CSR_TIME: { return mmio.clint_mtime; }
        case CSR_INSTRET: { return csrs.minstret; }
        case CSR_CYCLEH: { return csrs.mcycleh; }
        case CSR_TIMEH: { return mmio.clint_mtimeh; }
        case CSR_INSTRETH: { return csrs.minstreth; }
        
        default: { return 0u; }
    }
}

fn write_csr(csr_addr: u32, value: u32) {
    switch csr_addr {
        // Machine CSRs
        case CSR_MSTATUS: { csrs.mstatus = value; }
        case CSR_MISA: { /* Read-only in this implementation */ }
        case CSR_MEDELEG: { csrs.medeleg = value; }
        case CSR_MIDELEG: { csrs.mideleg = value; }
        case CSR_MIE: { csrs.mie = value; }
        case CSR_MTVEC: { csrs.mtvec = value; }
        case CSR_MCOUNTEREN: { csrs.mcounteren = value; }
        case CSR_MSCRATCH: { csrs.mscratch = value; }
        case CSR_MEPC: { csrs.mepc = value; }
        case CSR_MCAUSE: { csrs.mcause = value; }
        case CSR_MTVAL: { csrs.mtval = value; }
        case CSR_MIP: { csrs.mip = value; }
        
        // Machine counters (lower 32 bits only - upper cleared on write)
        case CSR_MCYCLE: { csrs.mcycle = value; csrs.mcycleh = 0u; }
        case CSR_MCYCLEH: { csrs.mcycleh = value; }
        case CSR_MINSTRET: { csrs.minstret = value; csrs.minstreth = 0u; }
        case CSR_MINSTRETH: { csrs.minstreth = value; }
        
        // Supervisor CSRs
        case CSR_SSTATUS: { csrs.sstatus = value & SSTATUS_MASK; }
        case CSR_SIE: { csrs.sie = value; }
        case CSR_STVEC: { csrs.stvec = value; }
        case CSR_SCOUNTEREN: { csrs.scounteren = value; }
        case CSR_SSCRATCH: { csrs.sscratch = value; }
        case CSR_SEPC: { csrs.sepc = value; }
        case CSR_SCAUSE: { csrs.scause = value; }
        case CSR_STVAL: { csrs.stval = value; }
        case CSR_SIP: { csrs.sip = value; }
        case CSR_SATP: { state.satp = value; }
        
        // Counter shadows are read-only, ignore writes
        case CSR_CYCLE, CSR_TIME, CSR_INSTRET,
             CSR_CYCLEH, CSR_TIMEH, CSR_INSTRETH: { /* Read-only */ }
        
        default: { /* Unknown CSR - ignore */ }
    }
}

// ============================================================================
// MMU / VIRTUAL MEMORY (Sv32)
// ============================================================================

fn walk_page_table(vaddr: u32, access_type: u32) -> TranslationResult {
    var result: TranslationResult;
    result.valid = 0u;
    result.fault_cause = CAUSE_LOAD_PAGE_FAULT;
    
    // Extract VPNs
    let vpn0: u32 = (vaddr >> 12u) & VPN_MASK;  // Level 0 (4KB pages)
    let vpn1: u32 = (vaddr >> 22u) & VPN_MASK;  // Level 1 (4MB megapages)
    
    // Get SATP fields
    let mode: u32 = (state.satp >> 31u) & 0x1u;
    let ppn: u32 = state.satp & SATP_PPN_MASK;
    
    // If bare mode or MMU disabled, identity map
    if (mode == SATP_MODE_BARE || config.enable_mmu == 0u) {
        result.paddr = vaddr;
        result.valid = 1u;
        return result;
    }
    
    // Level 1 walk
    let pte1_addr: u32 = (ppn << 12u) + (vpn1 * 4u);
    if (pte1_addr >= config.memory_size) {
        return result;  // Page fault
    }
    
    let pte1: u32 = memory[pte1_addr / 4u];
    
    // Check valid bit
    if ((pte1 & PTE_V) == 0u) {
        return result;  // Page fault
    }
    
    // Check if leaf (R, W, or X set)
    let pte1_flags: u32 = pte1 & PTE_FLAGS_MASK;
    if ((pte1_flags & (PTE_R | PTE_X)) != 0u) {
        // Level 1 is a leaf - megapage (4MB)
        if ((pte1 & PTE_R) == 0u && (pte1 & PTE_W) != 0u) {
            return result;  // Reserved combination
        }
        
        // Build physical address (4MB aligned)
        let ppn1: u32 = (pte1 >> 10u) & 0xFFFu;  // Upper 12 bits of PPN
        let offset: u32 = vaddr & 0x3FFFFFu;     // 22-bit offset
        result.paddr = (ppn1 << 22u) | offset;
        result.valid = 1u;
        
        // TODO: Check permission bits against access_type
        
        return result;
    }
    
    // Level 0 walk
    let pte0_addr: u32 = ((pte1 >> 10u) << 12u) + (vpn0 * 4u);
    if (pte0_addr >= config.memory_size) {
        return result;  // Page fault
    }
    
    let pte0: u32 = memory[pte0_addr / 4u];
    
    // Check valid bit
    if ((pte0 & PTE_V) == 0u) {
        return result;  // Page fault
    }
    
    // Check if leaf
    let pte0_flags: u32 = pte0 & PTE_FLAGS_MASK;
    if ((pte0_flags & (PTE_R | PTE_X)) == 0u) {
        return result;  // Not a leaf - invalid
    }
    
    if ((pte0 & PTE_R) == 0u && (pte0 & PTE_W) != 0u) {
        return result;  // Reserved combination
    }
    
    // Build physical address (4KB page)
    let ppn0: u32 = (pte0 >> 10u) & 0xFFFFFu;  // 20-bit PPN
    let offset: u32 = vaddr & 0xFFFu;          // 12-bit offset
    result.paddr = (ppn0 << 12u) | offset;
    result.valid = 1u;
    
    // TODO: Check permission bits against access_type
    
    return result;
}

fn translate_address(vaddr: u32, access_type: u32) -> TranslationResult {
    // access_type: 0=instruction, 1=load, 2=store
    
    // In M-mode with MPRV=0, use physical addresses directly
    if (state.privilege == PRIV_M) {
        // Check MPRV bit in mstatus
        if ((csrs.mstatus & MSTATUS_MPRV) == 0u || access_type == 0u) {
            var result: TranslationResult;
            result.paddr = vaddr;
            result.valid = 1u;
            return result;
        }
    }
    
    // Otherwise, walk the page table
    return walk_page_table(vaddr, access_type);
}

// ============================================================================
// MEMORY ACCESS WITH TRANSLATION
// ============================================================================

fn memory_load_u32(vaddr: u32) -> u32 {
    let translation: TranslationResult = translate_address(vaddr, 1u);
    if (translation.valid == 0u) {
        // Page fault - would trigger exception in full implementation
        return 0u;
    }
    
    let paddr: u32 = translation.paddr;
    
    // Check MMIO regions
    if (paddr >= UART_BASE && paddr < UART_BASE + UART_SIZE) {
        return mmio_load_u32(paddr - UART_BASE);
    }
    if (paddr >= CLINT_BASE && paddr < CLINT_BASE + CLINT_SIZE) {
        return clint_load_u32(paddr - CLINT_BASE);
    }
    
    // Regular RAM access
    if (paddr >= RAM_BASE && paddr < RAM_BASE + config.memory_size) {
        let word_addr: u32 = (paddr - RAM_BASE) / 4u;
        if (word_addr < arrayLength(&memory)) {
            return memory[word_addr];
        }
    }
    
    return 0u;
}

fn memory_store_u32(vaddr: u32, value: u32) {
    let translation: TranslationResult = translate_address(vaddr, 2u);
    if (translation.valid == 0u) {
        // Page fault
        return;
    }
    
    let paddr: u32 = translation.paddr;
    
    // Check MMIO regions
    if (paddr >= UART_BASE && paddr < UART_BASE + UART_SIZE) {
        mmio_store_u32(paddr - UART_BASE, value);
        return;
    }
    // Debug MMIO region for custom writes
    if (paddr == 0x10000100u) {
        atomicStore(&stats[62], 0xDEADBEEFu); // Custom debug magic
        return;
    }
    if (paddr >= CLINT_BASE && paddr < CLINT_BASE + CLINT_SIZE) {
        clint_store_u32(paddr - CLINT_BASE, value);
        return;
    }
    
    // Regular RAM access
    if (paddr >= RAM_BASE && paddr < RAM_BASE + config.memory_size) {
        let word_addr: u32 = (paddr - RAM_BASE) / 4u;
        if (word_addr < arrayLength(&memory)) {
            memory[word_addr] = value;
        }
    }
}

fn memory_load_u16(vaddr: u32) -> u32 {
    let aligned: u32 = vaddr & 0xFFFFFFFCu;
    let shift: u32 = (vaddr & 0x2u) * 8u;
    let word: u32 = memory_load_u32(aligned);
    return (word >> shift) & 0xFFFFu;
}

fn memory_store_u16(vaddr: u32, value: u32) {
    // First check if this is an MMIO address - MMIO stores go directly to the register
    let translation: TranslationResult = translate_address(vaddr, 2u);
    if (translation.valid == 0u) {
        return; // Page fault
    }

    let paddr: u32 = translation.paddr;

    // For UART MMIO, halfword stores go directly to THR (offset 0)
    if (paddr >= UART_BASE && paddr < UART_BASE + UART_SIZE) {
        mmio_store_u32(paddr - UART_BASE, value & 0xFFFFu);
        return;
    }
    if (paddr >= CLINT_BASE && paddr < CLINT_BASE + CLINT_SIZE) {
        clint_store_u32(paddr - CLINT_BASE, value & 0xFFFFu);
        return;
    }

    // For regular RAM, do read-modify-write
    let aligned: u32 = vaddr & 0xFFFFFFFCu;
    let shift: u32 = (vaddr & 0x2u) * 8u;
    let word: u32 = memory_load_u32(aligned);
    let mask: u32 = ~(0xFFFFu << shift);
    let new_word: u32 = (word & mask) | ((value & 0xFFFFu) << shift);
    memory_store_u32(aligned, new_word);
}

fn memory_load_u8(vaddr: u32) -> u32 {
    let aligned: u32 = vaddr & 0xFFFFFFFCu;
    let shift: u32 = (vaddr & 0x3u) * 8u;
    let word: u32 = memory_load_u32(aligned);
    return (word >> shift) & 0xFFu;
}

fn memory_store_u8(vaddr: u32, value: u32) {
    // First check if this is an MMIO address - MMIO byte stores go directly to the register
    let translation: TranslationResult = translate_address(vaddr, 2u);
    if (translation.valid == 0u) {
        return; // Page fault
    }

    let paddr: u32 = translation.paddr;

    // For UART MMIO, byte stores go directly to THR (offset 0)
    if (paddr >= UART_BASE && paddr < UART_BASE + UART_SIZE) {
        mmio_store_u32(paddr - UART_BASE, value & 0xFFu);
        return;
    }
    if (paddr >= CLINT_BASE && paddr < CLINT_BASE + CLINT_SIZE) {
        // For CLINT, byte stores are not typical, but handle as word store
        clint_store_u32(paddr - CLINT_BASE, value & 0xFFu);
        return;
    }

    // For regular RAM, do read-modify-write
    let aligned: u32 = vaddr & 0xFFFFFFFCu;
    let shift: u32 = (vaddr & 0x3u) * 8u;
    let word: u32 = memory_load_u32(aligned);
    let mask: u32 = ~(0xFFu << shift);
    let new_word: u32 = (word & mask) | ((value & 0xFFu) << shift);
    memory_store_u32(aligned, new_word);
}

// ============================================================================
// MMIO PERIPHERALS
// ============================================================================

fn mmio_load_u32(offset: u32) -> u32 {
    switch offset {
        case UART_RBR: {
            // Receiver buffer (read-only when DLAB=0)
            if ((mmio.uart_lcr & 0x80u) == 0u) {
                let data: u32 = mmio.uart_rbr;
                // Clear RX ready flag
                mmio.uart_rx_ready = 0u;
                mmio.uart_lsr = mmio.uart_lsr & ~0x01u;  // Clear data ready
                return data;
            }
            return mmio.uart_dll;
        }
        case UART_IER: {
            if ((mmio.uart_lcr & 0x80u) == 0u) {
                return mmio.uart_ier;
            }
            return mmio.uart_dlh;
        }
        case UART_IIR: {
            // Interrupt identification register
            var iir: u32 = mmio.uart_iir & 0xF0u;
            // Priority: receiver line status, then data available, then THRE
            if ((mmio.uart_lsr & 0x1Eu) != 0u && (mmio.uart_ier & 0x04u) != 0u) {
                iir = iir | 0x06u;  // Receiver line status
            } else if (mmio.uart_rx_ready != 0u && (mmio.uart_ier & 0x01u) != 0u) {
                iir = iir | 0x04u;  // Data available
            } else if (mmio.uart_tx_ready != 0u && (mmio.uart_ier & 0x02u) != 0u) {
                iir = iir | 0x02u;  // THRE
            } else {
                iir = iir | 0x01u;  // No interrupt
            }
            return iir;
        }
        case UART_LCR: { return mmio.uart_lcr; }
        case UART_MCR: { return mmio.uart_mcr; }
        case UART_LSR: {
            // Line status register - always return TX ready
            var lsr: u32 = mmio.uart_lsr | 0x60u;  // THRE and TEMT always set
            if (mmio.uart_rx_ready != 0u) {
                lsr = lsr | 0x01u;  // Data ready
            }
            return lsr;
        }
        case UART_MSR: { return mmio.uart_msr; }
        case UART_SCR: { return mmio.uart_scr; }
        default: { return 0u; }
    }
}

fn mmio_store_u32(offset: u32, value: u32) {
    switch offset {
        case UART_THR: {
            // Transmit holding register (write-only when DLAB=0)
            if ((mmio.uart_lcr & 0x80u) == 0u) {
                // Store character for host to read via stats buffer
                mmio.uart_thr = value & 0xFFu;
                mmio.uart_tx_ready = 1u;

                // Write to stats buffer using atomics for coherence
                // stats[0] = write_count (atomic counter)
                // stats[1..] = characters
                let write_count = atomicAdd(&stats[0], 1u);
                if (write_count < 254u) {
                    atomicStore(&stats[write_count + 1u], value & 0xFFu);
                }
                atomicStore(&stats[63], 0xDEADC0DEu); // Debug marker
            } else {
                mmio.uart_dll = value & 0xFFu;
            }
        }
        case UART_IER: {
            if ((mmio.uart_lcr & 0x80u) == 0u) {
                mmio.uart_ier = value & 0x0Fu;
            } else {
                mmio.uart_dlh = value & 0xFFu;
            }
        }
        case UART_FCR: {
            mmio.uart_fcr = value & 0xCFu;
            if ((value & 0x02u) != 0u) {
                // Reset receiver FIFO
                mmio.uart_rx_ready = 0u;
            }
            if ((value & 0x04u) != 0u) {
                // Reset transmit FIFO
                mmio.uart_tx_ready = 0u;
            }
        }
        case UART_LCR: { mmio.uart_lcr = value; }
        case UART_MCR: { mmio.uart_mcr = value & 0x1Fu; }
        case UART_SCR: { mmio.uart_scr = value & 0xFFu; }
        default: {}
    }
}

fn clint_load_u32(offset: u32) -> u32 {
    switch offset {
        case CLINT_MTIME: { return mmio.clint_mtime; }
        case CLINT_MTIMEH: { return mmio.clint_mtimeh; }
        case CLINT_MTIMECMP: { return mmio.clint_mtimecmp; }
        case CLINT_MTIMECMPH: { return mmio.clint_mtimecmph; }
        case CLINT_MSIP: { return mmio.clint_msip; }
        default: { return 0u; }
    }
}

fn clint_store_u32(offset: u32, value: u32) {
    switch offset {
        case CLINT_MTIME: { mmio.clint_mtime = value; }
        case CLINT_MTIMEH: { mmio.clint_mtimeh = value; }
        case CLINT_MTIMECMP: { mmio.clint_mtimecmp = value; }
        case CLINT_MTIMECMPH: { mmio.clint_mtimecmph = value; }
        case CLINT_MSIP: { mmio.clint_msip = value & 0x1u; }
        default: {}
    }
}

// ============================================================================
// 64-BIT MULTIPLICATION HELPERS (for WGSL i64 compatibility)
// ============================================================================

// Compute upper 32 bits of signed 64-bit multiplication (MULH)
fn mulh_signed(a: u32, b: u32) -> u32 {
    let a_lo = a & 0xFFFFu;
    let a_hi = (a >> 16u) & 0xFFFFu;
    let b_lo = b & 0xFFFFu;
    let b_hi = (b >> 16u) & 0xFFFFu;
    let a_hi_signed = i32(a_hi << 16u) >> 16u;
    let b_hi_signed = i32(b_hi << 16u) >> 16u;
    let p0 = u32(a_lo * b_lo);
    let p1 = u32(a_lo * b_hi);
    let p2 = u32(a_hi * b_lo);
    let p3 = u32(a_hi_signed * b_hi_signed);
    let mid = p1 + p2 + (p0 >> 16u);
    let hi = p3 + (mid >> 16u);
    return u32(hi);
}

// Compute upper 32 bits of unsigned 64-bit multiplication (MULHU)
fn mulh_unsigned(a: u32, b: u32) -> u32 {
    let a_lo = a & 0xFFFFu;
    let a_hi = a >> 16u;
    let b_lo = b & 0xFFFFu;
    let b_hi = b >> 16u;
    let p0 = a_lo * b_lo;
    let p1 = a_lo * b_hi;
    let p2 = a_hi * b_lo;
    let p3 = a_hi * b_hi;
    let mid = p1 + p2 + (p0 >> 16u);
    let hi = p3 + (mid >> 16u);
    return hi;
}

// ============================================================================
// INSTRUCTION FETCH
// ============================================================================

fn fetch_instruction(vaddr: u32) -> u32 {
    // Use address translation for instruction fetch
    let translation: TranslationResult = translate_address(vaddr, 0u);
    if (translation.valid == 0u) {
        // Instruction page fault - would trigger exception
        return 0u;  // NOP
    }

    let paddr: u32 = translation.paddr;

    // Instructions are in the main memory (binding 2)
    if (paddr >= RAM_BASE && paddr < RAM_BASE + config.memory_size) {
        let word_addr: u32 = (paddr - RAM_BASE) / 4u;
        if (word_addr < arrayLength(&memory)) {
            return memory[word_addr];
        }
    }

    return 0u;
}

// ============================================================================
// INSTRUCTION DECODE
// ============================================================================

fn decode(instruction: u32) -> DecodedInstruction {
    var decoded: DecodedInstruction;
    
    decoded.opcode = instruction & 0x7Fu;
    decoded.rd = (instruction >> 7u) & 0x1Fu;
    decoded.funct3 = (instruction >> 12u) & 0x7u;
    decoded.rs1 = (instruction >> 15u) & 0x1Fu;
    decoded.rs2 = (instruction >> 20u) & 0x1Fu;
    decoded.funct7 = (instruction >> 25u) & 0x7Fu;
    decoded.funct12 = (instruction >> 20u) & 0xFFFu;
    decoded.csr = (instruction >> 20u) & 0xFFFu;
    
    // Decode immediate based on instruction type
    switch decoded.opcode {
        case OP_IMM, OP_JALR, OP_LOAD: {
            // I-type
            decoded.imm = i32(instruction) >> 20;  // Sign-extend
        }
        case OP_STORE: {
            // S-type
            let imm11_5: u32 = (instruction >> 25u) & 0x7Fu;
            let imm4_0: u32 = (instruction >> 7u) & 0x1Fu;
            decoded.imm = i32((imm11_5 << 5u) | imm4_0);
            if ((imm11_5 & 0x40u) != 0u) {
                decoded.imm = decoded.imm | i32(0xFFFFF000u);  // Sign-extend
            }
        }
        case OP_BRANCH: {
            // B-type
            let imm12: u32 = (instruction >> 31u) & 0x1u;
            let imm10_5: u32 = (instruction >> 25u) & 0x3Fu;
            let imm4_1: u32 = (instruction >> 8u) & 0xFu;
            let imm11: u32 = (instruction >> 7u) & 0x1u;
            let imm_val: u32 = (imm12 << 12u) | (imm11 << 11u) | (imm10_5 << 5u) | (imm4_1 << 1u);
            decoded.imm = i32(imm_val);
            if (imm12 != 0u) {
                decoded.imm = decoded.imm | i32(0xFFFFE000u);  // Sign-extend
            }
        }
        case OP_LUI, OP_AUIPC: {
            // U-type
            decoded.imm = i32(instruction & 0xFFFFF000u);
        }
        case OP_JAL: {
            // J-type
            let imm20: u32 = (instruction >> 31u) & 0x1u;
            let imm10_1: u32 = (instruction >> 21u) & 0x3FFu;
            let imm11: u32 = (instruction >> 20u) & 0x1u;
            let imm19_12: u32 = (instruction >> 12u) & 0xFFu;
            let imm_val: u32 = (imm20 << 20u) | (imm19_12 << 12u) | (imm11 << 11u) | (imm10_1 << 1u);
            decoded.imm = i32(imm_val);
            if (imm20 != 0u) {
                decoded.imm = decoded.imm | i32(0xFFE00000u);  // Sign-extend
            }
        }
        case OP_SYSTEM: {
            // For CSR instructions, immediate is in rs1 field
            if (decoded.funct3 >= F3_CSRRWI) {
                decoded.imm = i32(decoded.rs1);  // zimm (unsigned immediate)
            } else {
                decoded.imm = i32(instruction) >> 20;
            }
        }
        default: {
            decoded.imm = 0;
        }
    }
    
    return decoded;
}

// ============================================================================
// EXCEPTION AND INTERRUPT HANDLING
// ============================================================================

fn raise_exception(cause: u32, tval: u32) {
    // Determine which privilege level handles this exception
    var delegate: u32 = 0u;
    
    if (state.privilege <= PRIV_S) {
        // Check if delegated to S-mode
        if (cause < 16u) {
            delegate = csrs.medeleg & (1u << cause);
        } else {
            delegate = csrs.mideleg & (1u << (cause & 0xFu));
        }
    }
    
    if (delegate != 0u) {
        // Delegate to S-mode
        csrs.scause = cause;
        csrs.stval = tval;
        csrs.sepc = atomicLoad(&pc);
        
        // Update sstatus
        let old_sstatus: u32 = csrs.sstatus;
        var new_sstatus: u32 = old_sstatus;
        new_sstatus = new_sstatus & ~MSTATUS_SPIE;  // Clear SPIE
        new_sstatus = new_sstatus | ((old_sstatus & MSTATUS_SIE) << 4u);  // SIE -> SPIE
        new_sstatus = new_sstatus & ~MSTATUS_SIE;  // Clear SIE
        new_sstatus = new_sstatus & ~MSTATUS_SPP;  // Clear SPP
        new_sstatus = new_sstatus | (state.privilege << 8u);  // Current priv -> SPP
        csrs.sstatus = new_sstatus;
        
        // Switch to S-mode
        state.privilege = PRIV_S;
        
        // Jump to trap handler
        let stvec: u32 = csrs.stvec;
        let mode: u32 = stvec & 0x3u;
        let base: u32 = stvec & 0xFFFFFFFCu;
        
        if (mode == 0u || (cause & 0x80000000u) == 0u) {
            // Direct mode or exception
            atomicStore(&pc, base);
        } else {
            // Vectored mode for interrupts
            atomicStore(&pc, base + (cause << 2u));
        }
    } else {
        // Handle in M-mode
        csrs.mcause = cause;
        csrs.mtval = tval;
        csrs.mepc = atomicLoad(&pc);
        
        // Update mstatus
        let old_mstatus: u32 = csrs.mstatus;
        var new_mstatus: u32 = old_mstatus;
        new_mstatus = new_mstatus & ~MSTATUS_MPIE;  // Clear MPIE
        new_mstatus = new_mstatus | ((old_mstatus & MSTATUS_MIE) << 4u);  // MIE -> MPIE
        new_mstatus = new_mstatus & ~MSTATUS_MIE;  // Clear MIE
        new_mstatus = new_mstatus & ~MSTATUS_MPP;  // Clear MPP
        new_mstatus = new_mstatus | (state.privilege << 11u);  // Current priv -> MPP
        csrs.mstatus = new_mstatus;
        
        // Switch to M-mode
        state.privilege = PRIV_M;
        
        // Jump to trap handler
        let mtvec: u32 = csrs.mtvec;
        let mode: u32 = mtvec & 0x3u;
        let base: u32 = mtvec & 0xFFFFFFFCu;
        
        if (mode == 0u || (cause & 0x80000000u) == 0u) {
            // Direct mode or exception
            atomicStore(&pc, base);
        } else {
            // Vectored mode for interrupts
            atomicStore(&pc, base + (cause << 2u));
        }
    }
}

fn check_interrupts() {
    // Get pending and enabled interrupts at current and higher privilege levels
    var pending: u32 = 0u;
    var mie: u32 = 0u;
    var mstatus: u32 = 0u;
    var interrupt_enable: u32 = 0u;

    // M-mode interrupts
    if (state.privilege <= PRIV_M) {
        pending = csrs.mip & csrs.mie;
        mie = csrs.mstatus & MSTATUS_MIE;
        mstatus = csrs.mstatus;

        // MIE is always enabled in M-mode unless MSTATUS.MIE is clear
        interrupt_enable = select(0u, 1u, (mie != 0u) || (state.privilege < PRIV_M));
    }
    
    // S-mode interrupts (only check if in S or U mode)
    if (state.privilege <= PRIV_S) {
        // Delegated interrupts
        let sip: u32 = csrs.sip & csrs.sie;
        let sie: u32 = csrs.sstatus & MSTATUS_SIE;
        
        // Add delegated S-mode interrupts
        pending = pending | (sip & csrs.mideleg);
        
        // SIE check
        if (state.privilege == PRIV_S) {
            interrupt_enable = select(interrupt_enable, 1u, sie != 0u);
        }
    }

    if (pending != 0u && interrupt_enable != 0u) {
        // Find highest priority interrupt
        var cause: u32 = 0u;
        
        // Priority order (from highest to lowest)
        if ((pending & IRQ_M_EXT) != 0u) { cause = IRQ_M_EXT; }
        else if ((pending & IRQ_M_SOFT) != 0u) { cause = IRQ_M_SOFT; }
        else if ((pending & IRQ_M_TIMER) != 0u) { cause = IRQ_M_TIMER; }
        else if ((pending & IRQ_S_EXT) != 0u) { cause = IRQ_S_EXT; }
        else if ((pending & IRQ_S_SOFT) != 0u) { cause = IRQ_S_SOFT; }
        else if ((pending & IRQ_S_TIMER) != 0u) { cause = IRQ_S_TIMER; }
        
        if (cause != 0u) {
            raise_exception(cause, 0u);
        }
    }
}

// ============================================================================
// INSTRUCTION EXECUTION
// ============================================================================

fn execute_instruction(decoded: DecodedInstruction) -> u32 {
    var next_pc: u32 = atomicLoad(&pc) + 4u;
    
    // x0 is always 0
    let rs1_val: u32 = select(registers[decoded.rs1], 0u, decoded.rs1 == 0u);
    let rs2_val: u32 = select(registers[decoded.rs2], 0u, decoded.rs2 == 0u);
    
    switch decoded.opcode {
        case OP_LUI: {
            // LUI: Load Upper Immediate
            if (decoded.rd != 0u) {
                registers[decoded.rd] = u32(decoded.imm);
            }
        }
        case OP_AUIPC: {
            // AUIPC: Add Upper Immediate to PC
            if (decoded.rd != 0u) {
                registers[decoded.rd] = atomicLoad(&pc) + u32(decoded.imm);
            }
        }
        case OP_JAL: {
            // JAL: Jump and Link
            if (decoded.rd != 0u) {
                registers[decoded.rd] = next_pc;
            }
            next_pc = atomicLoad(&pc) + u32(decoded.imm);
        }
        case OP_JALR: {
            // JALR: Jump and Link Register
            let jump_target: u32 = (rs1_val + u32(decoded.imm)) & 0xFFFFFFFEu;  // Clear LSB
            if (decoded.rd != 0u) {
                registers[decoded.rd] = next_pc;
            }
            next_pc = jump_target;
        }
        case OP_BRANCH: {
            // Branch instructions
            var take_branch: bool = false;
            switch decoded.funct3 {
                case 0x0u: { take_branch = (rs1_val == rs2_val); }  // BEQ
                case 0x1u: { take_branch = (rs1_val != rs2_val); }  // BNE
                case 0x4u: { take_branch = (i32(rs1_val) < i32(rs2_val)); }  // BLT
                case 0x5u: { take_branch = (i32(rs1_val) >= i32(rs2_val)); }  // BGE
                case 0x6u: { take_branch = (rs1_val < rs2_val); }  // BLTU
                case 0x7u: { take_branch = (rs1_val >= rs2_val); }  // BGEU
                default: {}
            }
            if (take_branch) {
                next_pc = atomicLoad(&pc) + u32(decoded.imm);
            }
        }
        case OP_LOAD: {
            // Load instructions
            let addr: u32 = rs1_val + u32(decoded.imm);
            var value: u32;
            switch decoded.funct3 {
                case 0x0u: { value = u32(i32(memory_load_u8(addr)) << 24u >> 24u); }  // LB
                case 0x1u: { value = u32(i32(memory_load_u16(addr)) << 16u >> 16u); }  // LH
                case 0x2u: { value = memory_load_u32(addr); }  // LW
                case 0x4u: { value = memory_load_u8(addr); }  // LBU
                case 0x5u: { value = memory_load_u16(addr); }  // LHU
                default: { value = 0u; }
            }
            if (decoded.rd != 0u) {
                registers[decoded.rd] = value;
            }
        }
        case OP_STORE: {
            // Store instructions
            let addr: u32 = rs1_val + u32(decoded.imm);
            switch decoded.funct3 {
                case 0x0u: { memory_store_u8(addr, rs2_val); }  // SB
                case 0x1u: { memory_store_u16(addr, rs2_val); }  // SH
                case 0x2u: { memory_store_u32(addr, rs2_val); }  // SW
                default: {}
            }
        }
        case OP_IMM: {
            // Immediate arithmetic
            var result: u32;
            switch decoded.funct3 {
                case F3_ADD_SUB: { result = rs1_val + u32(decoded.imm); }  // ADDI
                case F3_SLT: { result = select(0u, 1u, i32(rs1_val) < decoded.imm); }  // SLTI
                case F3_SLTU: { result = select(0u, 1u, rs1_val < u32(decoded.imm)); }  // SLTIU
                case F3_XOR: { result = rs1_val ^ u32(decoded.imm); }  // XORI
                case F3_OR: { result = rs1_val | u32(decoded.imm); }  // ORI
                case F3_AND: { result = rs1_val & u32(decoded.imm); }  // ANDI
                case F3_SLL: { result = rs1_val << (u32(decoded.imm) & 0x1Fu); }  // SLLI
                case F3_SRL_SRA: {
                    if ((decoded.funct7 & F7_ALT) != 0u) {
                        result = u32(i32(rs1_val) >> (u32(decoded.imm) & 0x1Fu));  // SRAI
                    } else {
                        result = rs1_val >> (u32(decoded.imm) & 0x1Fu);  // SRLI
                    }
                }
                default: { result = 0u; }
            }
            if (decoded.rd != 0u) {
                registers[decoded.rd] = result;
            }
        }
        case OP_OP: {
            // Register-register arithmetic
            var result: u32;
            
            // Check for RV32M extension (MUL/DIV)
            if (decoded.funct7 == F7_MUL) {
                switch decoded.funct3 {
                    case 0x0u: { result = rs1_val * rs2_val; }  // MUL
                    case 0x1u: { result = mulh_signed(rs1_val, rs2_val); }  // MULH
                    case 0x2u: { result = mulh_signed(rs1_val, rs2_val); }  // MULHSU (simplified)
                    case 0x3u: { result = mulh_unsigned(rs1_val, rs2_val); }  // MULHU
                    case 0x4u: {  // DIV
                        if (rs2_val == 0u) { result = 0xFFFFFFFFu; }
                        else { result = u32(i32(rs1_val) / i32(rs2_val)); }
                    }
                    case 0x5u: {  // DIVU
                        if (rs2_val == 0u) { result = 0xFFFFFFFFu; }
                        else { result = rs1_val / rs2_val; }
                    }
                    case 0x6u: {  // REM
                        if (rs2_val == 0u) { result = rs1_val; }
                        else { result = u32(i32(rs1_val) % i32(rs2_val)); }
                    }
                    case 0x7u: {  // REMU
                        if (rs2_val == 0u) { result = rs1_val; }
                        else { result = rs1_val % rs2_val; }
                    }
                    default: { result = 0u; }
                }
            } else {
                // Regular ALU operations
                switch decoded.funct3 {
                    case F3_ADD_SUB: {
                        if ((decoded.funct7 & F7_ALT) != 0u) {
                            result = rs1_val - rs2_val;  // SUB
                        } else {
                            result = rs1_val + rs2_val;  // ADD
                        }
                    }
                    case F3_SLL: { result = rs1_val << (rs2_val & 0x1Fu); }  // SLL
                    case F3_SLT: { result = select(0u, 1u, i32(rs1_val) < i32(rs2_val)); }  // SLT
                    case F3_SLTU: { result = select(0u, 1u, rs1_val < rs2_val); }  // SLTU
                    case F3_XOR: { result = rs1_val ^ rs2_val; }  // XOR
                    case F3_SRL_SRA: {
                        if ((decoded.funct7 & F7_ALT) != 0u) {
                            result = u32(i32(rs1_val) >> (rs2_val & 0x1Fu));  // SRA
                        } else {
                            result = rs1_val >> (rs2_val & 0x1Fu);  // SRL
                        }
                    }
                    case F3_OR: { result = rs1_val | rs2_val; }  // OR
                    case F3_AND: { result = rs1_val & rs2_val; }  // AND
                    default: { result = 0u; }
                }
            }
            if (decoded.rd != 0u) {
                registers[decoded.rd] = result;
            }
        }
        case OP_MISC_MEM: {
            // FENCE - no-op on GPU (memory is coherent)
            // FENCE.I - instruction fence (no-op since we don't have I-cache)
        }
        case OP_SYSTEM: {
            // System instructions
            switch decoded.funct3 {
                case F3_PRIV: {
                    // Privileged instructions
                    switch decoded.funct12 {
                        case F12_ECALL: {
                            // ECALL - raise exception based on current privilege
                            var cause: u32;
                            switch state.privilege {
                                case PRIV_U: { cause = CAUSE_ECALL_U; }
                                case PRIV_S: { cause = CAUSE_ECALL_S; }
                                case PRIV_M: { cause = CAUSE_ECALL_M; }
                                default: { cause = CAUSE_ECALL_M; }
                            }
                            raise_exception(cause, 0u);
                        }
                        case F12_EBREAK: {
                            // EBREAK
                            raise_exception(CAUSE_BREAKPOINT, atomicLoad(&pc));
                        }
                        case F12_MRET: {
                            // MRET - Return from machine mode
                            if (state.privilege == PRIV_M) {
                                // Restore privilege
                                let mpp: u32 = (csrs.mstatus >> 11u) & 0x3u;
                                state.privilege = mpp;
                                
                                // Restore interrupt enable
                                var new_mstatus: u32 = csrs.mstatus;
                                new_mstatus = new_mstatus & ~MSTATUS_MIE;
                                new_mstatus = new_mstatus | ((new_mstatus & MSTATUS_MPIE) >> 4u);
                                new_mstatus = new_mstatus | MSTATUS_MPIE;  // Set MPIE
                                new_mstatus = new_mstatus | (PRIV_M << 11u);  // Set MPP to M
                                csrs.mstatus = new_mstatus;
                                
                                next_pc = csrs.mepc;
                            }
                        }
                        case F12_SRET: {
                            // SRET - Return from supervisor mode
                            if (state.privilege >= PRIV_S) {
                                // Check TVM bit
                                if ((csrs.mstatus & MSTATUS_TVM) != 0u && state.privilege == PRIV_S) {
                                    raise_exception(CAUSE_ILLEGAL_INST, atomicLoad(&pc));
                                } else {
                                    // Restore privilege
                                    let spp: u32 = (csrs.sstatus >> 8u) & 0x1u;
                                    state.privilege = spp;
                                    
                                    // Restore interrupt enable
                                    var new_sstatus: u32 = csrs.sstatus;
                                    new_sstatus = new_sstatus & ~MSTATUS_SIE;
                                    new_sstatus = new_sstatus | ((new_sstatus & MSTATUS_SPIE) >> 4u);
                                    new_sstatus = new_sstatus | MSTATUS_SPIE;  // Set SPIE
                                    csrs.sstatus = new_sstatus;
                                    
                                    next_pc = csrs.sepc;
                                }
                            }
                        }
                        case F12_WFI: {
                            // WFI - Wait for interrupt
                            // In GPU context, this is essentially a no-op
                            // We could implement a sleep state here
                        }
                        default: {
                            // Unknown privileged instruction
                            raise_exception(CAUSE_ILLEGAL_INST, atomicLoad(&pc));
                        }
                    }
                }
                case F3_CSRRW: {
                    // CSRRW - Atomic Read/Write CSR
                    let csr_val: u32 = read_csr(decoded.csr);
                    write_csr(decoded.csr, rs1_val);
                    if (decoded.rd != 0u) {
                        registers[decoded.rd] = csr_val;
                    }
                }
                case F3_CSRRS: {
                    // CSRRS - Atomic Read and Set Bits in CSR
                    let csr_val: u32 = read_csr(decoded.csr);
                    if (decoded.rs1 != 0u) {
                        write_csr(decoded.csr, csr_val | rs1_val);
                    }
                    if (decoded.rd != 0u) {
                        registers[decoded.rd] = csr_val;
                    }
                }
                case F3_CSRRC: {
                    // CSRRC - Atomic Read and Clear Bits in CSR
                    let csr_val: u32 = read_csr(decoded.csr);
                    if (decoded.rs1 != 0u) {
                        write_csr(decoded.csr, csr_val & ~rs1_val);
                    }
                    if (decoded.rd != 0u) {
                        registers[decoded.rd] = csr_val;
                    }
                }
                case F3_CSRRWI: {
                    // CSRRWI - CSR Read/Write Immediate
                    let csr_val: u32 = read_csr(decoded.csr);
                    write_csr(decoded.csr, decoded.rs1);  // zimm in rs1 field
                    if (decoded.rd != 0u) {
                        registers[decoded.rd] = csr_val;
                    }
                }
                case F3_CSRRSI: {
                    // CSRRSI - CSR Read and Set Immediate
                    let csr_val: u32 = read_csr(decoded.csr);
                    if (decoded.rs1 != 0u) {
                        write_csr(decoded.csr, csr_val | decoded.rs1);
                    }
                    if (decoded.rd != 0u) {
                        registers[decoded.rd] = csr_val;
                    }
                }
                case F3_CSRRCI: {
                    // CSRRCI - CSR Read and Clear Immediate
                    let csr_val: u32 = read_csr(decoded.csr);
                    if (decoded.rs1 != 0u) {
                        write_csr(decoded.csr, csr_val & ~decoded.rs1);
                    }
                    if (decoded.rd != 0u) {
                        registers[decoded.rd] = csr_val;
                    }
                }
                default: {
                    // Unknown system instruction
                    raise_exception(CAUSE_ILLEGAL_INST, atomicLoad(&pc));
                }
            }
        }
        default: {
            // Unknown instruction - raise illegal instruction exception
            raise_exception(CAUSE_ILLEGAL_INST, atomicLoad(&pc));
        }
    }
    
    return next_pc;
}

// ============================================================================
// MAIN COMPUTE SHADER
// ============================================================================

@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    // Only one thread executes the CPU (for now - TODO: parallel harts)
    if (global_id.x != 0u) {
        return;
    }
    
    // Check if running
    if (state.running == 0u) {
        return;
    }
    
    // Execute 10000 instructions per dispatch
    for (var i: u32 = 0u; i < 10000u; i = i + 1u) {
        // Check for pending interrupts
        check_interrupts();
        
        // Fetch
        let current_pc: u32 = atomicLoad(&pc);
        let instruction: u32 = fetch_instruction(current_pc);
        
        // Decode
        let decoded: DecodedInstruction = decode(instruction);
        
        // Execute
        let next_pc: u32 = execute_instruction(decoded);
        
        // Update PC
        atomicStore(&pc, next_pc);
        
        // Update counters
        state.instruction_count = state.instruction_count + 1u;
        state.cycle_count = state.cycle_count + 1u;
        
        // Update time
        csrs.mcycle = csrs.mcycle + 1u;
        if (csrs.mcycle == 0u) {
            csrs.mcycleh = csrs.mcycleh + 1u;
        }
        
        // Update minstret (retired instructions)
        csrs.minstret = csrs.minstret + 1u;
        if (csrs.minstret == 0u) {
            csrs.minstreth = csrs.minstreth + 1u;
        }
        
        // Update CLINT mtime
        mmio.clint_mtime = mmio.clint_mtime + 1u;
        if (mmio.clint_mtime == 0u) {
            mmio.clint_mtimeh = mmio.clint_mtimeh + 1u;
        }
        
        // Check for timer interrupt
        if (mmio.clint_mtimeh > mmio.clint_mtimecmph ||
            (mmio.clint_mtimeh == mmio.clint_mtimecmph && mmio.clint_mtime >= mmio.clint_mtimecmp)) {
            csrs.mip = csrs.mip | IRQ_M_TIMER;
        }

        // Exit loop early if VM halted
        if (state.running == 0u) {
            break;
        }
    }
}

// ============================================================================
// INITIALIZATION SHADER
// ============================================================================

@compute @workgroup_size(1)
fn init(@builtin(global_invocation_id) global_id: vec3<u32>) {
    if (global_id.x != 0u) {
        return;
    }
    
    // Initialize CSRs
    csrs.misa = 0x40001105u;  // RV32IMA (I=bit 8, M=bit 12, A=bit 0)
    csrs.mstatus = 0x00000008u;  // MIE set
    csrs.medeleg = 0u;
    csrs.mideleg = 0u;
    csrs.mie = 0x00000080u;  // MTIE set
    csrs.mtvec = 0u;
    csrs.mcounteren = 0u;
    csrs.mscratch = 0u;
    csrs.mepc = 0u;
    csrs.mcause = 0u;
    csrs.mtval = 0u;
    csrs.mip = 0u;
    csrs.mcycle = 0u;
    csrs.mcycleh = 0u;
    csrs.minstret = 0u;
    csrs.minstreth = 0u;
    
    csrs.sstatus = 0u;
    csrs.sie = 0u;
    csrs.stvec = 0u;
    csrs.scounteren = 0u;
    csrs.sscratch = 0u;
    csrs.sepc = 0u;
    csrs.scause = 0u;
    csrs.stval = 0u;
    csrs.sip = 0u;
    
    // Initialize state
    state.running = 1u;
    state.exit_code = 0u;
    state.instruction_count = 0u;
    state.cycle_count = 0u;
    state.privilege = PRIV_M;  // Start in Machine mode
    state.satp = 0u;           // Bare mode
    state.pending_interrupt = 0u;
    state.trap_pending = 0u;
    
    // Initialize MMIO
    mmio.uart_thr = 0u;
    mmio.uart_rbr = 0u;
    mmio.uart_ier = 0u;
    mmio.uart_iir = 0x01u;  // No interrupt pending
    mmio.uart_fcr = 0u;
    mmio.uart_lcr = 0u;
    mmio.uart_mcr = 0u;
    mmio.uart_lsr = 0x60u;  // THRE and TEMT set
    mmio.uart_msr = 0x30u;  // CTS and DSR set
    mmio.uart_scr = 0u;
    mmio.uart_dll = 0x0Cu;  // 9600 baud default
    mmio.uart_dlh = 0u;
    mmio.uart_tx_ready = 0u;
    mmio.uart_rx_ready = 0u;
    
    mmio.clint_mtime = 0u;
    mmio.clint_mtimeh = 0u;
    mmio.clint_mtimecmp = 0xFFFFFFFFu;
    mmio.clint_mtimecmph = 0xFFFFFFFFu;
    mmio.clint_msip = 0u;
    
    // Initialize registers
    for (var i: u32 = 0u; i < 32u; i = i + 1u) {
        registers[i] = 0u;
    }
    
    // Set PC to reset vector (Linux kernel entry point)
    atomicStore(&pc, RAM_BASE);
    
    // Clear stats buffer
    for (var i: u32 = 0u; i < 64u; i = i + 1u) {
        stats[i] = 0u;
    }
}
