; DESCRIPTION: Composite: Places a red line segment connecting (45, 42) to (212, 170) then Creates a magenta rectangular region at (339, 14) spanning 85 by 119 pixels then Places a yellow dot at position (432, 145).
; PLAN: r0=45(x1), r1=42(y1), r2=212(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=339(x), r6=14(y), r7=85(width), r8=119(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=432(x), r11=145(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 45
LDI r1, 42
LDI r2, 212
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 14
LDI r7, 85
LDI r8, 119
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 432
LDI r11, 145
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
