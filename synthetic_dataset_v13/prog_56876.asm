; DESCRIPTION: Renders a orange disk with center (358, 141) and radius 18.
; PLAN: r0=358(x), r1=141(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 141
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
