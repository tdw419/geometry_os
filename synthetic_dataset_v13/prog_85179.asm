; DESCRIPTION: Places a purple circle of radius 11 at center (145, 147).
; PLAN: r0=145(x), r1=147(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 147
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
