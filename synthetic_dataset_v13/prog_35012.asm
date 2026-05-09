; DESCRIPTION: Composite: Draws a blue rectangle at (230, 141) with width 10 and height 28 then Renders a magenta disk with center (159, 176) and radius 66 then Renders a purple line between points (105, 126) and (486, 112).
; PLAN: r0=230(x), r1=141(y), r2=10(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=159(x), r6=176(y), r7=66(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=105(x1), r11=126(y1), r12=486(x2), r13=112(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 141
LDI r2, 10
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 176
LDI r7, 66
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 105
LDI r11, 126
LDI r12, 486
LDI r13, 112
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
