; DESCRIPTION: Composite: Places a purple line segment connecting (225, 54) to (389, 6) then Draws a white rectangle at (459, 151) with width 23 and height 100 then Places a orange circle of radius 43 at center (155, 115).
; PLAN: r0=225(x1), r1=54(y1), r2=389(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=459(x), r6=151(y), r7=23(width), r8=100(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=155(x), r11=115(y), r12=43(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 225
LDI r1, 54
LDI r2, 389
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 151
LDI r7, 23
LDI r8, 100
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 115
LDI r12, 43
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
