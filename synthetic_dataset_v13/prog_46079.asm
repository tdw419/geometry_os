; DESCRIPTION: Places a blue circle of radius 53 at center (319, 136).
; PLAN: r0=319(x), r1=136(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 136
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
