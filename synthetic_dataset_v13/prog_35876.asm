; DESCRIPTION: Composite: Renders a orange line between points (137, 198) and (237, 66) then Renders a cyan box of size 58x51 starting at (433, 187) then Draws a blue circle centered at (241, 105) with radius 43.
; PLAN: r0=137(x1), r1=198(y1), r2=237(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=187(y), r7=58(width), r8=51(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=241(x), r11=105(y), r12=43(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 137
LDI r1, 198
LDI r2, 237
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 187
LDI r7, 58
LDI r8, 51
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 241
LDI r11, 105
LDI r12, 43
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
