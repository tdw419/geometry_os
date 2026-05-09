; DESCRIPTION: Composite: Draws a orange line from (133, 51) to (128, 101) then Creates a white rectangular region at (286, 143) spanning 47 by 73 pixels then Sets a single yellow pixel at (162, 20).
; PLAN: r0=133(x1), r1=51(y1), r2=128(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=143(y), r7=47(width), r8=73(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=162(x), r11=20(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 133
LDI r1, 51
LDI r2, 128
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 143
LDI r7, 47
LDI r8, 73
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 20
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
