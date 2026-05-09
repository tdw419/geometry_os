; DESCRIPTION: Composite: Places a black dot at position (360, 219) then Draws a orange line from (35, 203) to (115, 170) then Creates a blue rectangular region at (212, 24) spanning 76 by 119 pixels.
; PLAN: r0=360(x), r1=219(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=35(x1), r6=203(y1), r7=115(x2), r8=170(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=212(x), r11=24(y), r12=76(width), r13=119(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 219
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 35
LDI r6, 203
LDI r7, 115
LDI r8, 170
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 212
LDI r11, 24
LDI r12, 76
LDI r13, 119
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
