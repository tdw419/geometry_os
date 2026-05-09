; DESCRIPTION: Composite: Places a purple circle of radius 72 at center (359, 102) then Places a orange line segment connecting (368, 232) to (312, 90) then Draws a red rectangle at (54, 31) with width 51 and height 18.
; PLAN: r0=359(x), r1=102(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=368(x1), r6=232(y1), r7=312(x2), r8=90(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=54(x), r11=31(y), r12=51(width), r13=18(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 359
LDI r1, 102
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 368
LDI r6, 232
LDI r7, 312
LDI r8, 90
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 31
LDI r12, 51
LDI r13, 18
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
