; DESCRIPTION: Renders a black disk with center (334, 151) and radius 80.
; PLAN: r0=334(x), r1=151(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 151
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
