; DESCRIPTION: Places a magenta circle of radius 79 at center (208, 147).
; PLAN: r0=208(x), r1=147(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 147
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
