; DESCRIPTION: Renders a yellow box of size 32x92 starting at (179, 31).
; PLAN: r0=179(x), r1=31(y), r2=32(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 31
LDI r2, 32
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
