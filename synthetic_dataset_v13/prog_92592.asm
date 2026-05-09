; DESCRIPTION: Composite: Renders a orange line between points (501, 227) and (37, 193) then Creates a purple rectangular region at (68, 14) spanning 59 by 75 pixels then Places a blue circle of radius 40 at center (134, 147).
; PLAN: r0=501(x1), r1=227(y1), r2=37(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=14(y), r7=59(width), r8=75(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=134(x), r11=147(y), r12=40(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 501
LDI r1, 227
LDI r2, 37
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 14
LDI r7, 59
LDI r8, 75
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 147
LDI r12, 40
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
