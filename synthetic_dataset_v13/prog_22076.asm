; DESCRIPTION: Composite: Places a yellow line segment connecting (471, 118) to (205, 79) then Places a blue 11x30 rectangle at position (483, 87) then Sets a single orange pixel at (61, 232).
; PLAN: r0=471(x1), r1=118(y1), r2=205(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=483(x), r6=87(y), r7=11(width), r8=30(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=61(x), r11=232(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 471
LDI r1, 118
LDI r2, 205
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 87
LDI r7, 11
LDI r8, 30
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 61
LDI r11, 232
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
