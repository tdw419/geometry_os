; DESCRIPTION: Composite: Places a orange line segment connecting (366, 4) to (86, 145) then Creates a black rectangular region at (119, 4) spanning 118 by 120 pixels then Places a green circle of radius 56 at center (197, 155).
; PLAN: r0=366(x1), r1=4(y1), r2=86(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=4(y), r7=118(width), r8=120(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=197(x), r11=155(y), r12=56(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 366
LDI r1, 4
LDI r2, 86
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 4
LDI r7, 118
LDI r8, 120
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 155
LDI r12, 56
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
