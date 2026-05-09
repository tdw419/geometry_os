; DESCRIPTION: Composite: Draws a magenta rectangle at (349, 62) with width 117 and height 63 then Places a orange line segment connecting (459, 198) to (235, 102) then Renders a magenta disk with center (169, 109) and radius 53.
; PLAN: r0=349(x), r1=62(y), r2=117(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=459(x1), r6=198(y1), r7=235(x2), r8=102(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=169(x), r11=109(y), r12=53(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 349
LDI r1, 62
LDI r2, 117
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 198
LDI r7, 235
LDI r8, 102
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 169
LDI r11, 109
LDI r12, 53
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
