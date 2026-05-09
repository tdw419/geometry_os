; DESCRIPTION: Composite: Renders a purple line between points (18, 219) and (61, 17) then Renders a blue box of size 26x104 starting at (409, 66) then Draws a blue circle centered at (88, 95) with radius 49.
; PLAN: r0=18(x1), r1=219(y1), r2=61(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=66(y), r7=26(width), r8=104(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=88(x), r11=95(y), r12=49(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 18
LDI r1, 219
LDI r2, 61
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 66
LDI r7, 26
LDI r8, 104
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 88
LDI r11, 95
LDI r12, 49
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
