; DESCRIPTION: Composite: Creates a purple rectangular region at (129, 105) spanning 22 by 87 pixels then Renders a orange line between points (200, 178) and (22, 49) then Draws a blue circle centered at (293, 185) with radius 58.
; PLAN: r0=129(x), r1=105(y), r2=22(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x1), r6=178(y1), r7=22(x2), r8=49(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=293(x), r11=185(y), r12=58(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 129
LDI r1, 105
LDI r2, 22
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 178
LDI r7, 22
LDI r8, 49
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 185
LDI r12, 58
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
