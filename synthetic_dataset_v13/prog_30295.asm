; DESCRIPTION: Composite: Renders a green line between points (31, 6) and (106, 3) then Renders a yellow box of size 78x47 starting at (90, 87) then Sets a single orange pixel at (27, 212).
; PLAN: r0=31(x1), r1=6(y1), r2=106(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=87(y), r7=78(width), r8=47(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=27(x), r11=212(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 31
LDI r1, 6
LDI r2, 106
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 87
LDI r7, 78
LDI r8, 47
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 27
LDI r11, 212
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
