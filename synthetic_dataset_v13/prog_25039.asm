; DESCRIPTION: Composite: Draws a purple line from (375, 155) to (31, 87) then Places a green 37x107 rectangle at position (267, 23) then Places a red dot at position (11, 84).
; PLAN: r0=375(x1), r1=155(y1), r2=31(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=267(x), r6=23(y), r7=37(width), r8=107(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=11(x), r11=84(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 375
LDI r1, 155
LDI r2, 31
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 23
LDI r7, 37
LDI r8, 107
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 11
LDI r11, 84
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
