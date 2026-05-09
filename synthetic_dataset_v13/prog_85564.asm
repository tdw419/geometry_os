; DESCRIPTION: Composite: Renders a yellow line between points (423, 56) and (69, 65) then Creates a red rectangular region at (200, 218) spanning 108 by 34 pixels then Draws a blue circle centered at (158, 188) with radius 12.
; PLAN: r0=423(x1), r1=56(y1), r2=69(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=218(y), r7=108(width), r8=34(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=158(x), r11=188(y), r12=12(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 423
LDI r1, 56
LDI r2, 69
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 218
LDI r7, 108
LDI r8, 34
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 188
LDI r12, 12
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
