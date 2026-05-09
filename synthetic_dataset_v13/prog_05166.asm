; DESCRIPTION: Renders a yellow disk with center (270, 110) and radius 75.
; PLAN: r0=270(x), r1=110(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 110
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
