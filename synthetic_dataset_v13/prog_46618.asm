; DESCRIPTION: Composite: Creates a white circular shape at (358, 149) with radius 78 then Creates a orange rectangular region at (248, 40) spanning 106 by 70 pixels then Renders a blue line between points (111, 110) and (377, 155).
; PLAN: r0=358(x), r1=149(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x), r6=40(y), r7=106(width), r8=70(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=111(x1), r11=110(y1), r12=377(x2), r13=155(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 358
LDI r1, 149
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 40
LDI r7, 106
LDI r8, 70
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 110
LDI r12, 377
LDI r13, 155
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
