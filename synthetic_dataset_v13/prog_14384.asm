; DESCRIPTION: Places a yellow circle of radius 32 at center (358, 147).
; PLAN: r0=358(x), r1=147(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 147
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
