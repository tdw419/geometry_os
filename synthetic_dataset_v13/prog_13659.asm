; DESCRIPTION: Composite: Renders a magenta line between points (163, 205) and (11, 22) then Renders a blue box of size 113x79 starting at (359, 83) then Sets a single green pixel at (82, 41).
; PLAN: r0=163(x1), r1=205(y1), r2=11(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=359(x), r6=83(y), r7=113(width), r8=79(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=82(x), r11=41(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 163
LDI r1, 205
LDI r2, 11
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 83
LDI r7, 113
LDI r8, 79
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 41
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
