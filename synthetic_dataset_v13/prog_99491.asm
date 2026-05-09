; DESCRIPTION: Renders a black box of size 57x25 starting at (58, 64).
; PLAN: r0=58(x), r1=64(y), r2=57(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 64
LDI r2, 57
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
