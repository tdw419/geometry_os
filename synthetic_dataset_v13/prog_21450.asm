; DESCRIPTION: Places a purple circle of radius 15 at center (491, 144).
; PLAN: r0=491(x), r1=144(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 491
LDI r1, 144
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
