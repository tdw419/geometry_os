; DESCRIPTION: Composite: Draws a yellow rectangle at (268, 98) with width 55 and height 91 then Creates a purple circular shape at (137, 183) with radius 30 then Renders a blue line between points (226, 35) and (288, 118).
; PLAN: r0=268(x), r1=98(y), r2=55(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x), r6=183(y), r7=30(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=226(x1), r11=35(y1), r12=288(x2), r13=118(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 268
LDI r1, 98
LDI r2, 55
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 183
LDI r7, 30
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 226
LDI r11, 35
LDI r12, 288
LDI r13, 118
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
