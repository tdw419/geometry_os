; DESCRIPTION: Composite: Renders a red line between points (52, 117) and (38, 147) then Draws a yellow circle centered at (227, 118) with radius 38 then Draws a yellow rectangle at (329, 113) with width 51 and height 59.
; PLAN: r0=52(x1), r1=117(y1), r2=38(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=118(y), r7=38(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=329(x), r11=113(y), r12=51(width), r13=59(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 52
LDI r1, 117
LDI r2, 38
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 118
LDI r7, 38
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 329
LDI r11, 113
LDI r12, 51
LDI r13, 59
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
