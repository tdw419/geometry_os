; DESCRIPTION: Places a cyan 53x64 rectangle at position (64, 101).
; PLAN: r0=64(x), r1=101(y), r2=53(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 101
LDI r2, 53
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
