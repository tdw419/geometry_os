; DESCRIPTION: Renders a black disk with center (188, 170) and radius 75.
; PLAN: r0=188(x), r1=170(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 170
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
