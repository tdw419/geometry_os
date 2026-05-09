; DESCRIPTION: Places a purple circle of radius 11 at center (312, 199).
; PLAN: r0=312(x), r1=199(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 199
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
