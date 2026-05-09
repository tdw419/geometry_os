; DESCRIPTION: Renders a black box of size 49x114 starting at (147, 57).
; PLAN: r0=147(x), r1=57(y), r2=49(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 57
LDI r2, 49
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
