; DESCRIPTION: Composite: Draws a blue circle centered at (88, 87) with radius 31 then Draws a blue rectangle at (147, 2) with width 13 and height 39 then Renders a orange line between points (192, 61) and (94, 74).
; PLAN: r0=88(x), r1=87(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=147(x), r6=2(y), r7=13(width), r8=39(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=192(x1), r11=61(y1), r12=94(x2), r13=74(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 88
LDI r1, 87
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 147
LDI r6, 2
LDI r7, 13
LDI r8, 39
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 192
LDI r11, 61
LDI r12, 94
LDI r13, 74
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
