; DESCRIPTION: Composite: Places a orange line segment connecting (130, 159) to (440, 56) then Creates a cyan rectangular region at (12, 179) spanning 118 by 54 pixels then Sets a single blue pixel at (471, 199).
; PLAN: r0=130(x1), r1=159(y1), r2=440(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=12(x), r6=179(y), r7=118(width), r8=54(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=471(x), r11=199(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 130
LDI r1, 159
LDI r2, 440
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 179
LDI r7, 118
LDI r8, 54
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 471
LDI r11, 199
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
