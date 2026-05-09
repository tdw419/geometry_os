; DESCRIPTION: Composite: Draws a white rectangle at (222, 168) with width 12 and height 15 then Draws a blue circle centered at (154, 112) with radius 34 then Renders a blue line between points (155, 250) and (379, 63).
; PLAN: r0=222(x), r1=168(y), r2=12(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=154(x), r6=112(y), r7=34(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=155(x1), r11=250(y1), r12=379(x2), r13=63(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 168
LDI r2, 12
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 112
LDI r7, 34
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 155
LDI r11, 250
LDI r12, 379
LDI r13, 63
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
