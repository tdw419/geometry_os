; DESCRIPTION: Renders a white disk with center (276, 104) and radius 66.
; PLAN: r0=276(x), r1=104(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 104
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
