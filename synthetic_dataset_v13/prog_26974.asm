; DESCRIPTION: Composite: Renders a purple line between points (130, 219) and (307, 197) then Creates a yellow rectangular region at (23, 91) spanning 68 by 34 pixels then Draws a blue circle centered at (360, 217) with radius 32.
; PLAN: r0=130(x1), r1=219(y1), r2=307(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=23(x), r6=91(y), r7=68(width), r8=34(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=360(x), r11=217(y), r12=32(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 130
LDI r1, 219
LDI r2, 307
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 91
LDI r7, 68
LDI r8, 34
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 217
LDI r12, 32
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
