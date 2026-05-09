; DESCRIPTION: Composite: Places a white line segment connecting (504, 235) to (430, 64) then Creates a black rectangular region at (304, 102) spanning 69 by 66 pixels then Sets a single yellow pixel at (234, 111).
; PLAN: r0=504(x1), r1=235(y1), r2=430(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=102(y), r7=69(width), r8=66(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=234(x), r11=111(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 504
LDI r1, 235
LDI r2, 430
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 102
LDI r7, 69
LDI r8, 66
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 111
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
