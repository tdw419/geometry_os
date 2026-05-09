; DESCRIPTION: Composite: Draws a magenta rectangle at (246, 20) with width 105 and height 47 then Renders a orange disk with center (268, 109) and radius 80 then Renders a black line between points (496, 14) and (4, 119).
; PLAN: r0=246(x), r1=20(y), r2=105(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=268(x), r6=109(y), r7=80(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=496(x1), r11=14(y1), r12=4(x2), r13=119(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 20
LDI r2, 105
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 109
LDI r7, 80
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 496
LDI r11, 14
LDI r12, 4
LDI r13, 119
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
