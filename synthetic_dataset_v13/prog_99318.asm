; DESCRIPTION: Renders a orange disk with center (244, 104) and radius 58.
; PLAN: r0=244(x), r1=104(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 104
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
