; DESCRIPTION: Composite: Creates a yellow rectangular region at (276, 119) spanning 21 by 31 pixels then Creates a white circular shape at (402, 104) with radius 48 then Sets a single white pixel at (36, 112).
; PLAN: r0=276(x), r1=119(y), r2=21(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x), r6=104(y), r7=48(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=36(x), r11=112(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 276
LDI r1, 119
LDI r2, 21
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 104
LDI r7, 48
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 36
LDI r11, 112
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
