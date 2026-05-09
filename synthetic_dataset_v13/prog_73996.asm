; DESCRIPTION: Places a cyan 81x64 rectangle at position (117, 42).
; PLAN: r0=117(x), r1=42(y), r2=81(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 42
LDI r2, 81
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
