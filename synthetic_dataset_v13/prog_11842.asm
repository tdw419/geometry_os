; DESCRIPTION: Composite: Sets a single purple pixel at (164, 3) then Places a yellow line segment connecting (106, 89) to (94, 179) then Draws a orange rectangle at (40, 143) with width 80 and height 80.
; PLAN: r0=164(x), r1=3(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=106(x1), r6=89(y1), r7=94(x2), r8=179(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=40(x), r11=143(y), r12=80(width), r13=80(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 3
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 106
LDI r6, 89
LDI r7, 94
LDI r8, 179
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 40
LDI r11, 143
LDI r12, 80
LDI r13, 80
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
