; DESCRIPTION: Composite: Draws a magenta line from (429, 163) to (430, 65) then Renders a cyan box of size 84x68 starting at (38, 156) then Sets a single yellow pixel at (381, 118).
; PLAN: r0=429(x1), r1=163(y1), r2=430(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=156(y), r7=84(width), r8=68(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=381(x), r11=118(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 429
LDI r1, 163
LDI r2, 430
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 156
LDI r7, 84
LDI r8, 68
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 381
LDI r11, 118
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
