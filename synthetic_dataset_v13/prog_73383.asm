; DESCRIPTION: Composite: Places a purple circle of radius 75 at center (118, 160) then Renders a orange line between points (452, 121) and (367, 222) then Draws a red rectangle at (389, 29) with width 115 and height 37.
; PLAN: r0=118(x), r1=160(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=452(x1), r6=121(y1), r7=367(x2), r8=222(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=389(x), r11=29(y), r12=115(width), r13=37(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 160
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 452
LDI r6, 121
LDI r7, 367
LDI r8, 222
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 389
LDI r11, 29
LDI r12, 115
LDI r13, 37
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
