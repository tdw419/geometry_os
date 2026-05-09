; DESCRIPTION: Places a purple circle of radius 58 at center (114, 147).
; PLAN: r0=114(x), r1=147(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 147
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
