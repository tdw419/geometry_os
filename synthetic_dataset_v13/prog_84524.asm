; DESCRIPTION: Renders a yellow disk with center (81, 155) and radius 36.
; PLAN: r0=81(x), r1=155(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 155
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
