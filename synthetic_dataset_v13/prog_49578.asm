; DESCRIPTION: Renders a yellow disk with center (155, 119) and radius 80.
; PLAN: r0=155(x), r1=119(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 119
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
