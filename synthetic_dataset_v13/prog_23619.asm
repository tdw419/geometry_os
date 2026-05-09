; DESCRIPTION: Renders a black disk with center (183, 171) and radius 75.
; PLAN: r0=183(x), r1=171(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 171
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
