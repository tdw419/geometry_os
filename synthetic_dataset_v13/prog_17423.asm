; DESCRIPTION: Composite: Creates a green rectangular region at (66, 88) spanning 89 by 75 pixels then Renders a purple line between points (123, 28) and (470, 49) then Creates a yellow circular shape at (301, 117) with radius 67.
; PLAN: r0=66(x), r1=88(y), r2=89(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x1), r6=28(y1), r7=470(x2), r8=49(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=301(x), r11=117(y), r12=67(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 66
LDI r1, 88
LDI r2, 89
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 28
LDI r7, 470
LDI r8, 49
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 117
LDI r12, 67
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
