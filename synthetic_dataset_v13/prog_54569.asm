; DESCRIPTION: Renders a black box of size 66x66 starting at (31, 64).
; PLAN: r0=31(x), r1=64(y), r2=66(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 64
LDI r2, 66
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
