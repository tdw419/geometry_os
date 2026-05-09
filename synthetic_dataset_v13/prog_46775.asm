; DESCRIPTION: Composite: Draws a green rectangle at (341, 118) with width 114 and height 112 then Places a black line segment connecting (291, 19) to (109, 153) then Renders a black disk with center (293, 160) and radius 65.
; PLAN: r0=341(x), r1=118(y), r2=114(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x1), r6=19(y1), r7=109(x2), r8=153(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=293(x), r11=160(y), r12=65(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 341
LDI r1, 118
LDI r2, 114
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 19
LDI r7, 109
LDI r8, 153
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 160
LDI r12, 65
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
