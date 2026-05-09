; DESCRIPTION: Composite: Renders a black disk with center (264, 106) and radius 73 then Creates a orange rectangular region at (369, 201) spanning 18 by 34 pixels then Renders a blue line between points (135, 207) and (397, 56).
; PLAN: r0=264(x), r1=106(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=369(x), r6=201(y), r7=18(width), r8=34(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=135(x1), r11=207(y1), r12=397(x2), r13=56(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 106
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 369
LDI r6, 201
LDI r7, 18
LDI r8, 34
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 135
LDI r11, 207
LDI r12, 397
LDI r13, 56
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
