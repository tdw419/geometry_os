; DESCRIPTION: Composite: Creates a magenta rectangular region at (47, 31) spanning 88 by 77 pixels then Sets a single orange pixel at (309, 161) then Places a cyan line segment connecting (78, 87) to (8, 176).
; PLAN: r0=47(x), r1=31(y), r2=88(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x), r6=161(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=78(x1), r11=87(y1), r12=8(x2), r13=176(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 47
LDI r1, 31
LDI r2, 88
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 161
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 78
LDI r11, 87
LDI r12, 8
LDI r13, 176
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
