; DESCRIPTION: Places a blue circle of radius 11 at center (319, 142).
; PLAN: r0=319(x), r1=142(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 142
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
