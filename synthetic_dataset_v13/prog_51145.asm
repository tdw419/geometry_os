; DESCRIPTION: Composite: Places a purple line segment connecting (319, 95) to (46, 66) then Places a green dot at position (366, 199) then Draws a purple rectangle at (93, 37) with width 89 and height 24.
; PLAN: r0=319(x1), r1=95(y1), r2=46(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=366(x), r6=199(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=93(x), r11=37(y), r12=89(width), r13=24(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 319
LDI r1, 95
LDI r2, 46
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 199
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 93
LDI r11, 37
LDI r12, 89
LDI r13, 24
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
