; DESCRIPTION: Composite: Draws a orange line from (285, 156) to (306, 106) then Draws a white rectangle at (202, 38) with width 10 and height 68 then Sets a single yellow pixel at (192, 185).
; PLAN: r0=285(x1), r1=156(y1), r2=306(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=202(x), r6=38(y), r7=10(width), r8=68(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=192(x), r11=185(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 285
LDI r1, 156
LDI r2, 306
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 38
LDI r7, 10
LDI r8, 68
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 192
LDI r11, 185
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
