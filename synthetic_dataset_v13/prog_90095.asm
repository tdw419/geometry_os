; DESCRIPTION: Composite: Creates a white circular shape at (238, 88) with radius 61 then Sets a single purple pixel at (390, 104).
; PLAN: r0=238(x), r1=88(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=390(x), r6=104(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 238
LDI r1, 88
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 390
LDI r6, 104
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
