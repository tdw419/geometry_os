; DESCRIPTION: Composite: Sets a single blue pixel at (314, 137) then Places a magenta line segment connecting (11, 241) to (66, 232) then Creates a red rectangular region at (256, 110) spanning 88 by 106 pixels.
; PLAN: r0=314(x), r1=137(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=11(x1), r6=241(y1), r7=66(x2), r8=232(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=256(x), r11=110(y), r12=88(width), r13=106(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 314
LDI r1, 137
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 11
LDI r6, 241
LDI r7, 66
LDI r8, 232
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 110
LDI r12, 88
LDI r13, 106
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
