# Phase 44: Test Program for Profiler Validation
# This program has loops that should trigger hot block detection
#
# Expected behavior:
# - Basic block at 0x100 (loop start) should have high execution count
# - Basic block at 0x10c (loop body) should have ~10,000 executions
# - Basic block at 0x114 (after loop) should have 1 execution

# Simple counter loop: for (i = 0; i < 10000; i++) { sum += i; }
# Entry point
0x100:    lui x1, 0       # x1 = 0 (counter i)
0x104:    lui x2, 0       # x2 = 0 (sum)
0x108:    addi x3, x0, 10000  # x3 = 10000 (loop limit)

# Loop start (hot block - should execute ~10,000 times)
0x10c:    beq x1, x3, 0x114   # if i == 10000, exit loop

# Loop body (hot block - should execute ~10,000 times)
0x110:    add x2, x2, x1   # sum += i
0x114:    addi x1, x1, 1   # i++
0x118:    jal x0, -12      # jump to 0x10c (loop start)

# Exit (cold block - should execute once)
0x11c:    lui x5, 0x10000  # Write result to MMIO
0x120:    addi x5, x5, 0   # MMIO address
0x124:    sw x2, 0(x5)     # Store sum to MMIO

# Infinite loop
0x128:    jal x0, 0        # spin forever
