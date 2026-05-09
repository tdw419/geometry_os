; DESCRIPTION: Places a blue circle of radius 15 at center (155, 101).
; PLAN: r0=155(x), r1=101(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 101
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
