; DESCRIPTION: Places a green circle of radius 75 at center (163, 100).
; PLAN: r0=163(x), r1=100(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 100
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
