; DESCRIPTION: Composite: Places a yellow circle of radius 33 at center (326, 132) then Creates a purple rectangular region at (87, 68) spanning 78 by 75 pixels then Renders a orange line between points (452, 41) and (250, 220).
; PLAN: r0=326(x), r1=132(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x), r6=68(y), r7=78(width), r8=75(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=452(x1), r11=41(y1), r12=250(x2), r13=220(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 326
LDI r1, 132
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 68
LDI r7, 78
LDI r8, 75
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 452
LDI r11, 41
LDI r12, 250
LDI r13, 220
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
