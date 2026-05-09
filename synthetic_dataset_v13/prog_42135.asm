; DESCRIPTION: Renders a yellow box of size 45x101 starting at (147, 75).
; PLAN: r0=147(x), r1=75(y), r2=45(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 75
LDI r2, 45
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
