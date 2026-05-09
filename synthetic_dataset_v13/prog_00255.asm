; DESCRIPTION: Composite: Renders a orange line between points (328, 67) and (12, 170) then Renders a magenta disk with center (172, 78) and radius 54 then Draws a purple rectangle at (402, 12) with width 35 and height 109.
; PLAN: r0=328(x1), r1=67(y1), r2=12(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=172(x), r6=78(y), r7=54(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=402(x), r11=12(y), r12=35(width), r13=109(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 328
LDI r1, 67
LDI r2, 12
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 78
LDI r7, 54
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 402
LDI r11, 12
LDI r12, 35
LDI r13, 109
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
