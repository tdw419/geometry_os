; DESCRIPTION: Renders a blue disk with center (81, 170) and radius 13.
; PLAN: r0=81(x), r1=170(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 170
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
