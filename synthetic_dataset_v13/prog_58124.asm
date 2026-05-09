; DESCRIPTION: Composite: Draws a red line from (179, 5) to (162, 135) then Creates a red rectangular region at (369, 138) spanning 49 by 87 pixels then Draws a red circle centered at (94, 145) with radius 45.
; PLAN: r0=179(x1), r1=5(y1), r2=162(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=138(y), r7=49(width), r8=87(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=94(x), r11=145(y), r12=45(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 179
LDI r1, 5
LDI r2, 162
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 138
LDI r7, 49
LDI r8, 87
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 94
LDI r11, 145
LDI r12, 45
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
