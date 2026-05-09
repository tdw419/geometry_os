; DESCRIPTION: Composite: Creates a white circular shape at (225, 88) with radius 72 then Sets a single red pixel at (275, 157).
; PLAN: r0=225(x), r1=88(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=275(x), r6=157(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 225
LDI r1, 88
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 275
LDI r6, 157
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
