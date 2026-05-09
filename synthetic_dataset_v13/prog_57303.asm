; DESCRIPTION: Places a purple circle of radius 11 at center (183, 142).
; PLAN: r0=183(x), r1=142(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 142
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
