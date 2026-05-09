; DESCRIPTION: Composite: Draws a blue rectangle at (50, 122) with width 54 and height 111 then Creates a orange circular shape at (263, 122) with radius 49 then Renders a yellow line between points (316, 160) and (506, 122).
; PLAN: r0=50(x), r1=122(y), r2=54(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x), r6=122(y), r7=49(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=316(x1), r11=160(y1), r12=506(x2), r13=122(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 50
LDI r1, 122
LDI r2, 54
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 122
LDI r7, 49
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 316
LDI r11, 160
LDI r12, 506
LDI r13, 122
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
