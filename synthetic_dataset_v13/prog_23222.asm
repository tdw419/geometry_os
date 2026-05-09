; DESCRIPTION: Composite: Places a red line segment connecting (63, 149) to (62, 169) then Creates a orange rectangular region at (472, 112) spanning 15 by 70 pixels then Draws a green circle centered at (340, 103) with radius 76.
; PLAN: r0=63(x1), r1=149(y1), r2=62(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=472(x), r6=112(y), r7=15(width), r8=70(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=340(x), r11=103(y), r12=76(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 63
LDI r1, 149
LDI r2, 62
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 112
LDI r7, 15
LDI r8, 70
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 103
LDI r12, 76
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
