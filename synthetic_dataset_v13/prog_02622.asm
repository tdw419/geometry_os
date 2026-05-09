; DESCRIPTION: Composite: Sets a single cyan pixel at (85, 94) then Places a orange line segment connecting (481, 222) to (159, 26) then Draws a magenta rectangle at (396, 147) with width 97 and height 58.
; PLAN: r0=85(x), r1=94(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=481(x1), r6=222(y1), r7=159(x2), r8=26(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=396(x), r11=147(y), r12=97(width), r13=58(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 94
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 481
LDI r6, 222
LDI r7, 159
LDI r8, 26
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 396
LDI r11, 147
LDI r12, 97
LDI r13, 58
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
