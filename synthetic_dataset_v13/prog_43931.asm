; DESCRIPTION: Composite: Places a red 58x114 rectangle at position (452, 30) then Draws a orange circle centered at (179, 94) with radius 68 then Sets a single orange pixel at (500, 205).
; PLAN: r0=452(x), r1=30(y), r2=58(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=179(x), r6=94(y), r7=68(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=500(x), r11=205(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 452
LDI r1, 30
LDI r2, 58
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 94
LDI r7, 68
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 500
LDI r11, 205
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
