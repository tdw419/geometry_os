; DESCRIPTION: Places a blue circle of radius 24 at center (431, 191).
; PLAN: r0=431(x), r1=191(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 191
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
