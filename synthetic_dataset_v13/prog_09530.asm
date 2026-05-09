; DESCRIPTION: Composite: Creates a magenta rectangular region at (37, 147) spanning 63 by 34 pixels then Renders a orange line between points (75, 3) and (447, 76) then Creates a yellow circular shape at (430, 101) with radius 13.
; PLAN: r0=37(x), r1=147(y), r2=63(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x1), r6=3(y1), r7=447(x2), r8=76(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=430(x), r11=101(y), r12=13(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 37
LDI r1, 147
LDI r2, 63
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 3
LDI r7, 447
LDI r8, 76
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 430
LDI r11, 101
LDI r12, 13
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
