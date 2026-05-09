; DESCRIPTION: Renders a yellow disk with center (216, 155) and radius 39.
; PLAN: r0=216(x), r1=155(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 155
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
