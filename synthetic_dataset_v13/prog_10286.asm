; DESCRIPTION: Places a blue circle of radius 22 at center (454, 232).
; PLAN: r0=454(x), r1=232(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 454
LDI r1, 232
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
