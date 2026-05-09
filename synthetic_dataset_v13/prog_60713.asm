; DESCRIPTION: Composite: Renders a orange line between points (105, 128) and (13, 0) then Creates a black rectangular region at (343, 136) spanning 97 by 101 pixels then Renders a black disk with center (229, 159) and radius 52.
; PLAN: r0=105(x1), r1=128(y1), r2=13(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=343(x), r6=136(y), r7=97(width), r8=101(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=229(x), r11=159(y), r12=52(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 105
LDI r1, 128
LDI r2, 13
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 136
LDI r7, 97
LDI r8, 101
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 159
LDI r12, 52
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
