; DESCRIPTION: Renders a blue disk with center (259, 155) and radius 77.
; PLAN: r0=259(x), r1=155(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 155
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
