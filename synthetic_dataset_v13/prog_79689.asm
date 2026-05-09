; DESCRIPTION: Composite: Draws a orange line from (484, 126) to (306, 156) then Creates a cyan rectangular region at (381, 130) spanning 53 by 79 pixels then Sets a single cyan pixel at (508, 202).
; PLAN: r0=484(x1), r1=126(y1), r2=306(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=381(x), r6=130(y), r7=53(width), r8=79(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=508(x), r11=202(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 484
LDI r1, 126
LDI r2, 306
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 130
LDI r7, 53
LDI r8, 79
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 508
LDI r11, 202
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
