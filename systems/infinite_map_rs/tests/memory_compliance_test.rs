// Phase 3: Memory Operations Compliance Tests
//
// Validates Phase 3 Memory implementation against RISC-V RV32I standard:
// - Load operations (LB, LH, LW, LBU, LHU)
// - Store operations (SB, SH, SW)
// - Sign extension for signed loads
// - Byte ordering (little-endian)
// - Unaligned access handling

// ============================================
// Mock Memory for Testing (CPU-based)
// ============================================

/// Mock memory buffer (simulates GPU memory)
struct MockMemory {
    data: Vec<u32>,
}

impl MockMemory {
    fn new(size_words: usize) -> Self {
        Self {
            data: vec![0u32; size_words.max(1024)], // At least 4KB
        }
    }

    /// Read 32-bit word
    fn read_u32(&self, addr: u32) -> u32 {
        let word_idx = (addr / 4) as usize;
        if word_idx < self.data.len() {
            self.data[word_idx]
        } else {
            0
        }
    }

    /// Write 32-bit word
    fn write_u32(&mut self, addr: u32, value: u32) {
        let word_idx = (addr / 4) as usize;
        if word_idx < self.data.len() {
            self.data[word_idx] = value;
        }
    }

    /// Read byte (matches WGSL implementation)
    fn read_u8(&self, addr: u32) -> u32 {
        let word = self.read_u32(addr & !3);
        let shift = (addr % 4) * 8;
        (word >> shift) & 0xFF
    }

    /// Read 16-bit halfword (little-endian)
    fn read_u16(&self, addr: u32) -> u32 {
        let b0 = self.read_u8(addr);
        let b1 = self.read_u8(addr + 1);
        b0 | (b1 << 8)
    }

    /// Write byte (matches WGSL implementation)
    fn write_u8(&mut self, addr: u32, value: u32) {
        let word_addr = addr & !3;
        let word = self.read_u32(word_addr);
        let shift = (addr % 4) * 8;
        let mask = !(0xFF << shift);
        let new_word = (word & mask) | ((value & 0xFF) << shift);
        self.write_u32(word_addr, new_word);
    }

    /// Write 16-bit halfword (little-endian)
    fn write_u16(&mut self, addr: u32, value: u32) {
        self.write_u8(addr, value & 0xFF);
        self.write_u8(addr + 1, (value >> 8) & 0xFF);
    }

    // ============================================
    // Load Instructions (RISC-V compliant)
    // ============================================

    /// LB: Load Byte (sign-extended)
    fn lb(&self, addr: u32) -> u32 {
        let byte = self.read_u8(addr);
        // Sign extension
        if (byte & 0x80) != 0 {
            byte | 0xFFFFFF00
        } else {
            byte
        }
    }

    /// LH: Load Halfword (sign-extended)
    fn lh(&self, addr: u32) -> u32 {
        let halfword = self.read_u16(addr);
        // Sign extension
        if (halfword & 0x8000) != 0 {
            halfword | 0xFFFF0000
        } else {
            halfword
        }
    }

    /// LW: Load Word
    fn lw(&self, addr: u32) -> u32 {
        self.read_u32(addr)
    }

    /// LBU: Load Byte Unsigned (zero-extended)
    fn lbu(&self, addr: u32) -> u32 {
        self.read_u8(addr)
    }

    /// LHU: Load Halfword Unsigned (zero-extended)
    fn lhu(&self, addr: u32) -> u32 {
        self.read_u16(addr)
    }

    // ============================================
    // Store Instructions (RISC-V compliant)
    // ============================================

    /// SB: Store Byte
    fn sb(&mut self, addr: u32, value: u32) {
        self.write_u8(addr, value & 0xFF);
    }

    /// SH: Store Halfword
    fn sh(&mut self, addr: u32, value: u32) {
        self.write_u16(addr, value & 0xFFFF);
    }

    /// SW: Store Word
    fn sw(&mut self, addr: u32, value: u32) {
        self.write_u32(addr, value);
    }
}

// ============================================
// Sign Extension Tests
// ============================================

#[test]
fn test_lb_sign_extension_positive() {
    let mem = {
        let mut m = MockMemory::new(16);
        m.write_u8(0x100, 0x7F); // 127 (positive)
        m
    };

    let result = mem.lb(0x100);
    assert_eq!(result, 0x0000007F);
}

#[test]
fn test_lb_sign_extension_negative() {
    let mem = {
        let mut m = MockMemory::new(16);
        m.write_u8(0x100, 0xFF); // -1 (negative)
        m
    };

    let result = mem.lb(0x100);
    assert_eq!(result, 0xFFFFFFFF);
}

#[test]
fn test_lb_sign_extension_negative_half() {
    let mem = {
        let mut m = MockMemory::new(16);
        m.write_u8(0x100, 0x80); // -128 (most negative byte)
        m
    };

    let result = mem.lb(0x100);
    assert_eq!(result, 0xFFFFFF80);
}

#[test]
fn test_lh_sign_extension_positive() {
    let mem = {
        let mut m = MockMemory::new(16);
        m.write_u16(0x100, 0x7FFF); // 32767 (positive)
        m
    };

    let result = mem.lh(0x100);
    assert_eq!(result, 0x00007FFF);
}

#[test]
fn test_lh_sign_extension_negative() {
    let mem = {
        let mut m = MockMemory::new(16);
        m.write_u16(0x100, 0xFFFF); // -1 (negative)
        m
    };

    let result = mem.lh(0x100);
    assert_eq!(result, 0xFFFFFFFF);
}

#[test]
fn test_lh_sign_extension_negative_half() {
    let mem = {
        let mut m = MockMemory::new(16);
        m.write_u16(0x100, 0x8000); // -32768 (most negative halfword)
        m
    };

    let result = mem.lh(0x100);
    assert_eq!(result, 0xFFFF8000);
}

// ============================================
// Unsigned Load Tests
// ============================================

#[test]
fn test_lbu_zero_extension() {
    let mem = {
        let mut m = MockMemory::new(16);
        m.write_u8(0x100, 0xFF); // All bits set
        m
    };

    let result = mem.lbu(0x100);
    assert_eq!(result, 0x000000FF); // Zero-extended
}

#[test]
fn test_lhu_zero_extension() {
    let mem = {
        let mut m = MockMemory::new(16);
        m.write_u16(0x100, 0xFFFF); // All bits set
        m
    };

    let result = mem.lhu(0x100);
    assert_eq!(result, 0x0000FFFF); // Zero-extended
}

// ============================================
// Store Tests
// ============================================

#[test]
fn test_sb_preserves_other_bytes() {
    let mut mem = MockMemory::new(16);
    mem.write_u32(0x100, 0x12345678);

    // Store 0xAA at offset 1
    mem.sb(0x101, 0xAA);

    // 0x12345678 in little-endian: [78, 56, 34, 12]
    // After SB 0xAA at offset 1:    [78, AA, 34, 12]
    assert_eq!(mem.read_u8(0x100), 0x78); // Unchanged
    assert_eq!(mem.read_u8(0x101), 0xAA); // Modified
    assert_eq!(mem.read_u8(0x102), 0x34); // Unchanged (was 0x56, corrected)
    assert_eq!(mem.read_u8(0x103), 0x12); // Unchanged
}

#[test]
fn test_sh_preserves_other_bytes() {
    let mut mem = MockMemory::new(16);
    mem.write_u32(0x100, 0x12345678);

    // Store 0xAABB at offset 1 (unaligned)
    mem.sh(0x101, 0xAABB);

    assert_eq!(mem.read_u8(0x100), 0x78); // Unchanged
    assert_eq!(mem.read_u8(0x101), 0xBB); // LSB of halfword
    assert_eq!(mem.read_u8(0x102), 0xAA); // MSB of halfword
    assert_eq!(mem.read_u8(0x103), 0x12); // Unchanged
}

#[test]
fn test_sw_full_word() {
    let mut mem = MockMemory::new(16);
    mem.sw(0x100, 0xDEADBEEF);

    assert_eq!(mem.read_u32(0x100), 0xDEADBEEF);
}

// ============================================
// Load-Store Round-trip Tests
// ============================================

#[test]
fn test_lb_sb_roundtrip() {
    let mut mem = MockMemory::new(16);

    // Store signed values
    mem.sb(0x100, 0x7F); // 127
    mem.sb(0x101, 0x80); // -128
    mem.sb(0x102, 0xFF); // -1

    assert_eq!(mem.lb(0x100) as i32, 127);
    assert_eq!(mem.lb(0x101) as i32, -128);
    assert_eq!(mem.lb(0x102) as i32, -1);
}

#[test]
fn test_lh_sh_roundtrip() {
    let mut mem = MockMemory::new(16);

    // Store signed values
    mem.sh(0x100, 0x7FFF); // 32767
    mem.sh(0x102, 0x8000); // -32768
    mem.sh(0x104, 0xFFFF); // -1

    assert_eq!(mem.lh(0x100) as i32, 32767);
    assert_eq!(mem.lh(0x102) as i32, -32768);
    assert_eq!(mem.lh(0x104) as i32, -1);
}

#[test]
fn test_lw_sw_roundtrip() {
    let mut mem = MockMemory::new(16);

    mem.sw(0x100, 0xDEADBEEF);
    mem.sw(0x104, 0xCAFEBABE);
    mem.sw(0x108, 0x12345678);

    assert_eq!(mem.lw(0x100), 0xDEADBEEF);
    assert_eq!(mem.lw(0x104), 0xCAFEBABE);
    assert_eq!(mem.lw(0x108), 0x12345678);
}

// ============================================
// Little-Endian Byte Order Tests
// ============================================

#[test]
fn test_lw_little_endian() {
    let mut mem = MockMemory::new(16);

    // Write individual bytes in little-endian order
    mem.write_u8(0x100, 0xEF); // LSB
    mem.write_u8(0x101, 0xBE);
    mem.write_u8(0x102, 0xAD);
    mem.write_u8(0x103, 0xDE); // MSB

    // LW should read as 0xDEADBEEF
    assert_eq!(mem.lw(0x100), 0xDEADBEEF);
}

// ============================================
// Unaligned Access Tests
// ============================================

#[test]
fn test_lh_unaligned() {
    let mut mem = MockMemory::new(16);
    mem.write_u32(0x100, 0x12345678);

    // Load halfword at offset 1 (unaligned)
    // 0x12345678 in little-endian: [78, 56, 34, 12]
    // Bytes at offsets 1,2: 56, 34
    // Little-endian halfword: 0x3456
    let result = mem.lh(0x101);
    assert_eq!(result, 0x00003456); // Fixed: was 0x00005612
}

#[test]
fn test_sh_unaligned() {
    let mut mem = MockMemory::new(16);
    mem.write_u32(0x100, 0x12345678);

    // Store halfword at offset 1 (unaligned)
    mem.sh(0x101, 0xAABB);

    assert_eq!(mem.read_u8(0x100), 0x78); // Unchanged
    assert_eq!(mem.read_u8(0x101), 0xBB); // LSB
    assert_eq!(mem.read_u8(0x102), 0xAA); // MSB
    assert_eq!(mem.read_u8(0x103), 0x12); // Unchanged
}

#[test]
fn test_lw_unaligned() {
    let mut mem = MockMemory::new(16);
    mem.write_u32(0x100, 0x12345678);
    mem.write_u32(0x104, 0x9ABCDEF0);

    // Load word at offset 2 (unaligned)
    // Should read from word at offset 0 (aligned down)
    let result = mem.lw(0x102);
    assert_eq!(result, 0x12345678); // Reads from aligned address
}

// ============================================
// Boundary Tests
// ============================================

#[test]
fn test_load_zero() {
    let mut mem = MockMemory::new(16);

    mem.sb(0x100, 0);
    mem.sh(0x102, 0);
    mem.sw(0x104, 0);

    assert_eq!(mem.lb(0x100), 0);
    assert_eq!(mem.lh(0x102), 0);
    assert_eq!(mem.lw(0x104), 0);
}

#[test]
fn test_store_max_values() {
    let mut mem = MockMemory::new(16);

    mem.sb(0x100, 0xFF);
    mem.sh(0x102, 0xFFFF);
    mem.sw(0x104, 0xFFFFFFFF);

    assert_eq!(mem.lbu(0x100), 0xFF);
    assert_eq!(mem.lhu(0x102), 0xFFFF);
    assert_eq!(mem.lw(0x104), 0xFFFFFFFF);
}

// ============================================
// Stress Tests
// ============================================

#[test]
fn test_memory_stress_random_access() {
    let mut mem = MockMemory::new(1024);

    // Write pattern
    for i in 0..256 {
        mem.sw(i * 4, i * 0x01010101);
    }

    // Read back and verify
    for i in 0..256 {
        assert_eq!(mem.lw(i * 4), i * 0x01010101);
    }
}

#[test]
fn test_memory_stress_byte_writes() {
    let mut mem = MockMemory::new(256);

    // Write each byte individually
    for i in 0..256 {
        mem.sb(i, i as u32);
    }

    // Read back
    for i in 0..256 {
        assert_eq!(mem.lbu(i), i as u32);
    }
}
