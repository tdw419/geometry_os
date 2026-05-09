; DESCRIPTION: Composite: Draws a black rectangle at (51, 43) with width 104 and height 68 then Draws a magenta line from (483, 70) to (98, 46) then Sets a single yellow pixel at (496, 139).
; PLAN: r0=51(x), r1=43(y), r2=104(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=483(x1), r6=70(y1), r7=98(x2), r8=46(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=496(x), r11=139(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 51
LDI r1, 43
LDI r2, 104
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 70
LDI r7, 98
LDI r8, 46
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 496
LDI r11, 139
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
