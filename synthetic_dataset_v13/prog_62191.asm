; DESCRIPTION: Composite: Draws a white circle centered at (403, 86) with radius 12 then Sets a single yellow pixel at (104, 64).
; PLAN: r0=403(x), r1=86(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x), r6=64(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 403
LDI r1, 86
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 64
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
