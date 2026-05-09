; DESCRIPTION: Composite: Draws a magenta rectangle at (172, 68) with width 78 and height 112 then Renders a white disk with center (140, 138) and radius 79 then Draws a red line from (377, 158) to (469, 215).
; PLAN: r0=172(x), r1=68(y), r2=78(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=140(x), r6=138(y), r7=79(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=377(x1), r11=158(y1), r12=469(x2), r13=215(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 172
LDI r1, 68
LDI r2, 78
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 138
LDI r7, 79
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 377
LDI r11, 158
LDI r12, 469
LDI r13, 215
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
