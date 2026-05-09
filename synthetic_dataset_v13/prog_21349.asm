; DESCRIPTION: Composite: Places a orange line segment connecting (483, 89) to (62, 85) then Draws a white rectangle at (22, 157) with width 118 and height 87 then Sets a single blue pixel at (28, 206).
; PLAN: r0=483(x1), r1=89(y1), r2=62(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=22(x), r6=157(y), r7=118(width), r8=87(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=28(x), r11=206(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 483
LDI r1, 89
LDI r2, 62
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 157
LDI r7, 118
LDI r8, 87
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 28
LDI r11, 206
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
