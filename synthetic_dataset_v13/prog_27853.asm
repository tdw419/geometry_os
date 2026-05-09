; DESCRIPTION: Renders a blue disk with center (276, 104) and radius 31.
; PLAN: r0=276(x), r1=104(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 104
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
