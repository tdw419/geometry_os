; DESCRIPTION: Composite: Creates a orange rectangular region at (276, 14) spanning 13 by 88 pixels then Places a cyan line segment connecting (355, 20) to (363, 198) then Draws a orange circle centered at (312, 188) with radius 67.
; PLAN: r0=276(x), r1=14(y), r2=13(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x1), r6=20(y1), r7=363(x2), r8=198(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=312(x), r11=188(y), r12=67(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 276
LDI r1, 14
LDI r2, 13
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 20
LDI r7, 363
LDI r8, 198
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 312
LDI r11, 188
LDI r12, 67
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
