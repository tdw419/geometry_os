; DESCRIPTION: Renders a yellow disk with center (359, 105) and radius 80.
; PLAN: r0=359(x), r1=105(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 105
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
