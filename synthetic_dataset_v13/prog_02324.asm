; DESCRIPTION: Composite: Creates a white circular shape at (266, 169) with radius 58 then Creates a yellow rectangular region at (21, 89) spanning 47 by 88 pixels then Sets a single yellow pixel at (438, 126).
; PLAN: r0=266(x), r1=169(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=21(x), r6=89(y), r7=47(width), r8=88(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=438(x), r11=126(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 266
LDI r1, 169
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 21
LDI r6, 89
LDI r7, 47
LDI r8, 88
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 438
LDI r11, 126
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
