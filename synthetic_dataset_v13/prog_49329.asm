; DESCRIPTION: Composite: Creates a white rectangular region at (139, 9) spanning 67 by 89 pixels then Draws a yellow circle centered at (129, 91) with radius 25 then Places a magenta line segment connecting (137, 198) to (95, 192).
; PLAN: r0=139(x), r1=9(y), r2=67(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x), r6=91(y), r7=25(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=137(x1), r11=198(y1), r12=95(x2), r13=192(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 139
LDI r1, 9
LDI r2, 67
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 91
LDI r7, 25
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 137
LDI r11, 198
LDI r12, 95
LDI r13, 192
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
