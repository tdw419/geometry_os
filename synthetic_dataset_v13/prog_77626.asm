; DESCRIPTION: Renders a yellow disk with center (155, 50) and radius 37.
; PLAN: r0=155(x), r1=50(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 50
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
