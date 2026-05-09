; DESCRIPTION: Renders a orange disk with center (109, 174) and radius 76.
; PLAN: r0=109(x), r1=174(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 174
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
