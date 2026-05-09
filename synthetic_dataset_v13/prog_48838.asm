; DESCRIPTION: Places a green circle of radius 11 at center (451, 148).
; PLAN: r0=451(x), r1=148(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 148
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
