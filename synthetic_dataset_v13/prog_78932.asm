; DESCRIPTION: Renders a black disk with center (456, 77) and radius 35.
; PLAN: r0=456(x), r1=77(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 77
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
