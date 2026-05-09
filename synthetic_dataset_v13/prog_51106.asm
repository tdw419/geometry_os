; DESCRIPTION: Composite: Places a orange line segment connecting (421, 41) to (22, 70) then Places a purple 63x118 rectangle at position (3, 51) then Draws a green circle centered at (355, 106) with radius 46.
; PLAN: r0=421(x1), r1=41(y1), r2=22(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=3(x), r6=51(y), r7=63(width), r8=118(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=355(x), r11=106(y), r12=46(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 421
LDI r1, 41
LDI r2, 22
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 51
LDI r7, 63
LDI r8, 118
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 355
LDI r11, 106
LDI r12, 46
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
