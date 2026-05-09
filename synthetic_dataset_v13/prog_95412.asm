; DESCRIPTION: Renders a green disk with center (163, 97) and radius 78.
; PLAN: r0=163(x), r1=97(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 97
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
