; DESCRIPTION: Composite: Draws a white rectangle at (188, 33) with width 100 and height 83 then Draws a orange circle centered at (356, 83) with radius 29 then Renders a purple line between points (100, 119) and (455, 172).
; PLAN: r0=188(x), r1=33(y), r2=100(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x), r6=83(y), r7=29(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=100(x1), r11=119(y1), r12=455(x2), r13=172(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 188
LDI r1, 33
LDI r2, 100
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 83
LDI r7, 29
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 100
LDI r11, 119
LDI r12, 455
LDI r13, 172
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
