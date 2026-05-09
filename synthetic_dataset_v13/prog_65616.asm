; DESCRIPTION: Places a blue circle of radius 75 at center (97, 78).
; PLAN: r0=97(x), r1=78(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 78
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
