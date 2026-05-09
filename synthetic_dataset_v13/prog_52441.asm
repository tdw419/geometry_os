; DESCRIPTION: Renders a black disk with center (233, 80) and radius 15.
; PLAN: r0=233(x), r1=80(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 80
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
