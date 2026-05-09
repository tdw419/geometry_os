; DESCRIPTION: Places a green circle of radius 63 at center (409, 97).
; PLAN: r0=409(x), r1=97(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 97
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
