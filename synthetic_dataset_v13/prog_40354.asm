; DESCRIPTION: Composite: Renders a red disk with center (125, 175) and radius 54 then Draws a yellow rectangle at (260, 64) with width 105 and height 107 then Places a yellow line segment connecting (312, 112) to (451, 40).
; PLAN: r0=125(x), r1=175(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x), r6=64(y), r7=105(width), r8=107(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=312(x1), r11=112(y1), r12=451(x2), r13=40(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 175
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 64
LDI r7, 105
LDI r8, 107
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 312
LDI r11, 112
LDI r12, 451
LDI r13, 40
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
