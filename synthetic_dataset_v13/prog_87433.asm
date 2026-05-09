; DESCRIPTION: Composite: Draws a purple line from (366, 222) to (49, 252) then Places a purple 69x78 rectangle at position (241, 145) then Renders a black disk with center (143, 155) and radius 79.
; PLAN: r0=366(x1), r1=222(y1), r2=49(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=145(y), r7=69(width), r8=78(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=143(x), r11=155(y), r12=79(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 366
LDI r1, 222
LDI r2, 49
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 145
LDI r7, 69
LDI r8, 78
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 143
LDI r11, 155
LDI r12, 79
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
