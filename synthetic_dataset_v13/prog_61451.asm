; DESCRIPTION: Composite: Sets a single green pixel at (22, 237) then Creates a yellow rectangular region at (276, 137) spanning 97 by 90 pixels then Draws a black line from (259, 8) to (381, 176).
; PLAN: r0=22(x), r1=237(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=276(x), r6=137(y), r7=97(width), r8=90(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=259(x1), r11=8(y1), r12=381(x2), r13=176(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 22
LDI r1, 237
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 276
LDI r6, 137
LDI r7, 97
LDI r8, 90
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 259
LDI r11, 8
LDI r12, 381
LDI r13, 176
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
