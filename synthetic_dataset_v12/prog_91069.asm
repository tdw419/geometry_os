; DESCRIPTION: Renders a orange disk with center (195, 142) and radius 78.
; PLAN: r0=195(x), r1=142(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 142
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
