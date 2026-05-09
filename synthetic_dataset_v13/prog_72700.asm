; DESCRIPTION: Composite: Draws a magenta rectangle at (109, 136) with width 26 and height 73 then Renders a red line between points (201, 9) and (170, 161) then Draws a orange circle centered at (392, 122) with radius 30.
; PLAN: r0=109(x), r1=136(y), r2=26(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x1), r6=9(y1), r7=170(x2), r8=161(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=392(x), r11=122(y), r12=30(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 109
LDI r1, 136
LDI r2, 26
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 9
LDI r7, 170
LDI r8, 161
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 392
LDI r11, 122
LDI r12, 30
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
