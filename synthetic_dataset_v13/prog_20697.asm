; DESCRIPTION: Composite: Draws a purple circle centered at (143, 118) with radius 73 then Creates a blue rectangular region at (368, 96) spanning 116 by 17 pixels then Draws a orange line from (123, 119) to (311, 5).
; PLAN: r0=143(x), r1=118(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=368(x), r6=96(y), r7=116(width), r8=17(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=123(x1), r11=119(y1), r12=311(x2), r13=5(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 143
LDI r1, 118
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 368
LDI r6, 96
LDI r7, 116
LDI r8, 17
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 119
LDI r12, 311
LDI r13, 5
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
