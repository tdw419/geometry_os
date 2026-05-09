; DESCRIPTION: Composite: Creates a yellow circular shape at (454, 168) with radius 54 then Creates a white rectangular region at (359, 122) spanning 22 by 119 pixels then Places a red line segment connecting (200, 20) to (24, 22).
; PLAN: r0=454(x), r1=168(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=359(x), r6=122(y), r7=22(width), r8=119(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=200(x1), r11=20(y1), r12=24(x2), r13=22(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 454
LDI r1, 168
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 359
LDI r6, 122
LDI r7, 22
LDI r8, 119
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 200
LDI r11, 20
LDI r12, 24
LDI r13, 22
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
