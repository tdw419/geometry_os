; DESCRIPTION: Renders a purple box of size 101x51 starting at (13, 147).
; PLAN: r0=13(x), r1=147(y), r2=101(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 147
LDI r2, 101
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
