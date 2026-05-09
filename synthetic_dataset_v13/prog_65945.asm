; DESCRIPTION: Composite: Draws a magenta rectangle at (385, 62) with width 51 and height 118 then Creates a red circular shape at (306, 154) with radius 72 then Draws a red line from (109, 60) to (233, 178).
; PLAN: r0=385(x), r1=62(y), r2=51(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=154(y), r7=72(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=109(x1), r11=60(y1), r12=233(x2), r13=178(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 62
LDI r2, 51
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 154
LDI r7, 72
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 109
LDI r11, 60
LDI r12, 233
LDI r13, 178
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
