; DESCRIPTION: Renders a black box of size 100x64 starting at (339, 42).
; PLAN: r0=339(x), r1=42(y), r2=100(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 42
LDI r2, 100
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
