; DESCRIPTION: Composite: Renders a yellow line between points (234, 60) and (188, 94) then Creates a orange rectangular region at (318, 34) spanning 21 by 76 pixels then Creates a white circular shape at (95, 139) with radius 59.
; PLAN: r0=234(x1), r1=60(y1), r2=188(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=34(y), r7=21(width), r8=76(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=95(x), r11=139(y), r12=59(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 234
LDI r1, 60
LDI r2, 188
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 34
LDI r7, 21
LDI r8, 76
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 95
LDI r11, 139
LDI r12, 59
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
