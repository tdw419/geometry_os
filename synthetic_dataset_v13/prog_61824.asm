; DESCRIPTION: Places a purple circle of radius 32 at center (88, 147).
; PLAN: r0=88(x), r1=147(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 147
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
