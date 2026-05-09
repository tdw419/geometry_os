; DESCRIPTION: Composite: Creates a green circular shape at (312, 147) with radius 31 then Creates a yellow rectangular region at (371, 104) spanning 79 by 21 pixels then Sets a single orange pixel at (250, 228).
; PLAN: r0=312(x), r1=147(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x), r6=104(y), r7=79(width), r8=21(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=250(x), r11=228(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 312
LDI r1, 147
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 104
LDI r7, 79
LDI r8, 21
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 250
LDI r11, 228
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
