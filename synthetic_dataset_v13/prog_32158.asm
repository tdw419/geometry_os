; DESCRIPTION: Places a purple circle of radius 51 at center (373, 189).
; PLAN: r0=373(x), r1=189(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 189
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
