// Phase 44: Profiler Unit Tests
//
// This test verifies that the profiler structures are correctly aligned
// and can be created/initialized properly.

#[test]
fn test_profiler_entry_size() {
    // Verify ProfilerEntry is 20 bytes (5 u32s)
    // This matches the WGSL layout for proper GPU readback
    // TODO: Re-enable when riscv_executor is exported from lib.rs
    // use infinite_map_rs::riscv_executor::ProfilerEntry;

    use crate::riscv_executor::ProfilerEntry;

    let entry = ProfilerEntry {
        pc: 0x100,
        count: 10000,
        _pad: [0, 0, 0],
    };

    assert_eq!(entry.pc, 0x100);
    assert_eq!(entry.count, 10000);
    assert_eq!(std::mem::size_of::<ProfilerEntry>(), 20);
}

#[test]
fn test_profiler_entry_default() {
    // Verify default initialization
    // TODO: Re-enable when riscv_executor is exported from lib.rs
    // use infinite_map_rs::riscv_executor::ProfilerEntry;

    use crate::riscv_executor::ProfilerEntry;

    let entry = ProfilerEntry::default();

    assert_eq!(entry.pc, 0);
    assert_eq!(entry.count, 0);
    assert_eq!(entry._pad, [0, 0, 0]);
}
