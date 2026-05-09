; DESCRIPTION: Composite: Draws a red circle centered at (430, 183) with radius 54 then Creates a purple rectangular region at (87, 77) spanning 44 by 119 pixels then Draws a blue line from (138, 135) to (74, 115).
; PLAN: r0=430(x), r1=183(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x), r6=77(y), r7=44(width), r8=119(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=138(x1), r11=135(y1), r12=74(x2), r13=115(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 430
LDI r1, 183
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 77
LDI r7, 44
LDI r8, 119
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 138
LDI r11, 135
LDI r12, 74
LDI r13, 115
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
