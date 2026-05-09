; DESCRIPTION: Composite: Draws a orange rectangle at (155, 6) with width 108 and height 110 then Draws a yellow circle centered at (204, 191) with radius 20 then Places a yellow line segment connecting (265, 54) to (486, 212).
; PLAN: r0=155(x), r1=6(y), r2=108(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x), r6=191(y), r7=20(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=265(x1), r11=54(y1), r12=486(x2), r13=212(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 155
LDI r1, 6
LDI r2, 108
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 191
LDI r7, 20
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 265
LDI r11, 54
LDI r12, 486
LDI r13, 212
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
