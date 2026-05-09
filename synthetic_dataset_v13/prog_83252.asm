; DESCRIPTION: Places a green circle of radius 40 at center (184, 97).
; PLAN: r0=184(x), r1=97(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 97
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
