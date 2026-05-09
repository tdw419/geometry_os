; DESCRIPTION: Composite: Draws a magenta rectangle at (308, 22) with width 70 and height 17 then Draws a green circle centered at (350, 85) with radius 73 then Renders a white line between points (24, 181) and (399, 88).
; PLAN: r0=308(x), r1=22(y), r2=70(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=350(x), r6=85(y), r7=73(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=24(x1), r11=181(y1), r12=399(x2), r13=88(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 22
LDI r2, 70
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 85
LDI r7, 73
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 24
LDI r11, 181
LDI r12, 399
LDI r13, 88
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
