; DESCRIPTION: Composite: Renders a orange line between points (417, 159) and (508, 41) then Creates a purple rectangular region at (292, 155) spanning 10 by 64 pixels then Renders a blue disk with center (233, 67) and radius 25.
; PLAN: r0=417(x1), r1=159(y1), r2=508(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=292(x), r6=155(y), r7=10(width), r8=64(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=233(x), r11=67(y), r12=25(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 417
LDI r1, 159
LDI r2, 508
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 155
LDI r7, 10
LDI r8, 64
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 67
LDI r12, 25
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
