; DESCRIPTION: Renders a orange disk with center (409, 104) and radius 76.
; PLAN: r0=409(x), r1=104(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 104
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
