; DESCRIPTION: Places a green circle of radius 23 at center (409, 185).
; PLAN: r0=409(x), r1=185(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 185
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
