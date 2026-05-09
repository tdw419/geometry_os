; DESCRIPTION: Composite: Renders a orange line between points (358, 65) and (70, 45) then Sets a single purple pixel at (163, 66) then Draws a green rectangle at (12, 58) with width 84 and height 94.
; PLAN: r0=358(x1), r1=65(y1), r2=70(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=163(x), r6=66(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=12(x), r11=58(y), r12=84(width), r13=94(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 358
LDI r1, 65
LDI r2, 70
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 66
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 12
LDI r11, 58
LDI r12, 84
LDI r13, 94
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
