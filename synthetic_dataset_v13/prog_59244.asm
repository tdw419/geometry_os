; DESCRIPTION: Composite: Creates a yellow rectangular region at (89, 231) spanning 13 by 24 pixels then Renders a purple line between points (89, 117) and (275, 220) then Creates a orange circular shape at (127, 110) with radius 51.
; PLAN: r0=89(x), r1=231(y), r2=13(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x1), r6=117(y1), r7=275(x2), r8=220(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=127(x), r11=110(y), r12=51(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 89
LDI r1, 231
LDI r2, 13
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 117
LDI r7, 275
LDI r8, 220
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 127
LDI r11, 110
LDI r12, 51
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
