; DESCRIPTION: Places a purple circle of radius 73 at center (306, 147).
; PLAN: r0=306(x), r1=147(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 147
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
