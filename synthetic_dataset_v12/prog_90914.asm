; DESCRIPTION: Composite: Creates a yellow rectangular region at (325, 70) spanning 109 by 107 pixels then Draws a orange line from (467, 218) to (95, 52) then Renders a yellow disk with center (399, 185) and radius 10.
; PLAN: r0=325(x), r1=70(y), r2=109(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=467(x1), r6=218(y1), r7=95(x2), r8=52(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=399(x), r11=185(y), r12=10(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 325
LDI r1, 70
LDI r2, 109
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 218
LDI r7, 95
LDI r8, 52
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 399
LDI r11, 185
LDI r12, 10
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
