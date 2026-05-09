; DESCRIPTION: Composite: Sets a single cyan pixel at (414, 191) then Creates a yellow rectangular region at (409, 17) spanning 21 by 52 pixels then Places a orange line segment connecting (465, 172) to (344, 68).
; PLAN: r0=414(x), r1=191(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=409(x), r6=17(y), r7=21(width), r8=52(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=465(x1), r11=172(y1), r12=344(x2), r13=68(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 414
LDI r1, 191
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 409
LDI r6, 17
LDI r7, 21
LDI r8, 52
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 465
LDI r11, 172
LDI r12, 344
LDI r13, 68
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
