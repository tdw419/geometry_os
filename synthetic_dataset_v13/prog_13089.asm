; DESCRIPTION: Renders a black disk with center (172, 122) and radius 78.
; PLAN: r0=172(x), r1=122(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 122
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
