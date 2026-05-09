; DESCRIPTION: Places a blue circle of radius 20 at center (451, 233).
; PLAN: r0=451(x), r1=233(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 233
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
