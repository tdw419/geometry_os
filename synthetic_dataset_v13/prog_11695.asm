; DESCRIPTION: Renders a yellow disk with center (270, 88) and radius 77.
; PLAN: r0=270(x), r1=88(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 88
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
