; DESCRIPTION: Renders a black disk with center (334, 121) and radius 75.
; PLAN: r0=334(x), r1=121(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 121
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
