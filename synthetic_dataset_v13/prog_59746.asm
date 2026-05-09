; DESCRIPTION: Composite: Places a orange line segment connecting (233, 41) to (26, 175) then Sets a single purple pixel at (113, 212) then Creates a blue rectangular region at (376, 157) spanning 25 by 58 pixels.
; PLAN: r0=233(x1), r1=41(y1), r2=26(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=212(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=376(x), r11=157(y), r12=25(width), r13=58(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 41
LDI r2, 26
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 212
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 376
LDI r11, 157
LDI r12, 25
LDI r13, 58
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
