; DESCRIPTION: Renders a blue disk with center (425, 104) and radius 47.
; PLAN: r0=425(x), r1=104(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 104
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
