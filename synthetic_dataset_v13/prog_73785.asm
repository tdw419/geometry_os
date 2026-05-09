; DESCRIPTION: Composite: Draws a magenta circle centered at (235, 133) with radius 54 then Renders a blue line between points (159, 163) and (52, 155) then Draws a red rectangle at (310, 138) with width 79 and height 45.
; PLAN: r0=235(x), r1=133(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=159(x1), r6=163(y1), r7=52(x2), r8=155(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=310(x), r11=138(y), r12=79(width), r13=45(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 133
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 159
LDI r6, 163
LDI r7, 52
LDI r8, 155
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 138
LDI r12, 79
LDI r13, 45
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
