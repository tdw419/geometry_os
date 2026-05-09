; DESCRIPTION: Composite: Renders a orange line between points (43, 198) and (58, 71) then Creates a green circular shape at (409, 55) with radius 51 then Draws a magenta rectangle at (92, 22) with width 118 and height 71.
; PLAN: r0=43(x1), r1=198(y1), r2=58(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=55(y), r7=51(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=92(x), r11=22(y), r12=118(width), r13=71(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 43
LDI r1, 198
LDI r2, 58
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 55
LDI r7, 51
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 92
LDI r11, 22
LDI r12, 118
LDI r13, 71
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
