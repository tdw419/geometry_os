; DESCRIPTION: Renders a black disk with center (261, 151) and radius 78.
; PLAN: r0=261(x), r1=151(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 151
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
