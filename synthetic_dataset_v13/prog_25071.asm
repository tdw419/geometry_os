; DESCRIPTION: Composite: Creates a purple circular shape at (318, 68) with radius 57 then Draws a cyan line from (427, 186) to (365, 156) then Creates a orange rectangular region at (331, 56) spanning 30 by 71 pixels.
; PLAN: r0=318(x), r1=68(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=427(x1), r6=186(y1), r7=365(x2), r8=156(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=331(x), r11=56(y), r12=30(width), r13=71(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 318
LDI r1, 68
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 427
LDI r6, 186
LDI r7, 365
LDI r8, 156
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 56
LDI r12, 30
LDI r13, 71
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
