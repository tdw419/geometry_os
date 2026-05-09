; DESCRIPTION: Places a purple circle of radius 52 at center (250, 136).
; PLAN: r0=250(x), r1=136(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 136
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
