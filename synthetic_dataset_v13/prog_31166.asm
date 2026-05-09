; DESCRIPTION: Composite: Draws a purple rectangle at (77, 108) with width 30 and height 80 then Draws a green circle centered at (100, 88) with radius 61 then Renders a purple line between points (486, 52) and (69, 133).
; PLAN: r0=77(x), r1=108(y), r2=30(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=100(x), r6=88(y), r7=61(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=486(x1), r11=52(y1), r12=69(x2), r13=133(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 77
LDI r1, 108
LDI r2, 30
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 88
LDI r7, 61
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 486
LDI r11, 52
LDI r12, 69
LDI r13, 133
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
