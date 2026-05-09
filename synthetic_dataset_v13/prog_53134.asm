; DESCRIPTION: Composite: Draws a green line from (99, 238) to (6, 143) then Creates a magenta rectangular region at (318, 65) spanning 89 by 89 pixels then Places a red dot at position (22, 250).
; PLAN: r0=99(x1), r1=238(y1), r2=6(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=65(y), r7=89(width), r8=89(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=22(x), r11=250(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 99
LDI r1, 238
LDI r2, 6
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 65
LDI r7, 89
LDI r8, 89
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 22
LDI r11, 250
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
