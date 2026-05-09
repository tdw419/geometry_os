; DESCRIPTION: Composite: Places a orange 98x66 rectangle at position (283, 8) then Places a purple line segment connecting (203, 254) to (483, 82) then Places a red dot at position (167, 155).
; PLAN: r0=283(x), r1=8(y), r2=98(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=203(x1), r6=254(y1), r7=483(x2), r8=82(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=167(x), r11=155(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 283
LDI r1, 8
LDI r2, 98
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 254
LDI r7, 483
LDI r8, 82
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 167
LDI r11, 155
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
