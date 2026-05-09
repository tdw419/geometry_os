; DESCRIPTION: Renders a black box of size 81x58 starting at (418, 147).
; PLAN: r0=418(x), r1=147(y), r2=81(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 147
LDI r2, 81
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
