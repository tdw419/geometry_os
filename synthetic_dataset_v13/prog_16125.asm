; DESCRIPTION: Composite: Creates a orange rectangular region at (375, 169) spanning 75 by 22 pixels then Places a magenta line segment connecting (309, 232) to (49, 46) then Places a white dot at position (99, 5).
; PLAN: r0=375(x), r1=169(y), r2=75(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x1), r6=232(y1), r7=49(x2), r8=46(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=99(x), r11=5(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 375
LDI r1, 169
LDI r2, 75
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 232
LDI r7, 49
LDI r8, 46
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 5
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
