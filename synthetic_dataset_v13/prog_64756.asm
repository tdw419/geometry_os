; DESCRIPTION: Composite: Creates a yellow rectangular region at (179, 26) spanning 22 by 103 pixels then Draws a purple circle centered at (112, 185) with radius 31 then Renders a orange line between points (490, 205) and (68, 52).
; PLAN: r0=179(x), r1=26(y), r2=22(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=112(x), r6=185(y), r7=31(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=490(x1), r11=205(y1), r12=68(x2), r13=52(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 26
LDI r2, 22
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 185
LDI r7, 31
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 490
LDI r11, 205
LDI r12, 68
LDI r13, 52
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
