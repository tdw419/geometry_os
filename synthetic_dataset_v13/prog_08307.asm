; DESCRIPTION: Places a purple circle of radius 75 at center (253, 84).
; PLAN: r0=253(x), r1=84(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 84
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
