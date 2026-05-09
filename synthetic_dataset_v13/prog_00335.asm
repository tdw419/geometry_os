; DESCRIPTION: Renders a yellow disk with center (155, 75) and radius 38.
; PLAN: r0=155(x), r1=75(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 75
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
