; DESCRIPTION: Composite: Draws a yellow circle centered at (102, 169) with radius 72 then Creates a yellow rectangular region at (392, 123) spanning 22 by 79 pixels then Draws a purple line from (183, 143) to (353, 183).
; PLAN: r0=102(x), r1=169(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=392(x), r6=123(y), r7=22(width), r8=79(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=183(x1), r11=143(y1), r12=353(x2), r13=183(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 169
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 392
LDI r6, 123
LDI r7, 22
LDI r8, 79
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 183
LDI r11, 143
LDI r12, 353
LDI r13, 183
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
