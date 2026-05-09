; DESCRIPTION: Composite: Places a cyan 13x112 rectangle at position (388, 11) then Renders a magenta line between points (408, 158) and (370, 122) then Sets a single cyan pixel at (471, 56).
; PLAN: r0=388(x), r1=11(y), r2=13(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=408(x1), r6=158(y1), r7=370(x2), r8=122(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=471(x), r11=56(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 388
LDI r1, 11
LDI r2, 13
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 158
LDI r7, 370
LDI r8, 122
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 471
LDI r11, 56
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
