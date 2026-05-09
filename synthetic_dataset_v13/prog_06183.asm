; DESCRIPTION: Composite: Renders a yellow box of size 78x29 starting at (75, 118) then Draws a red line from (439, 110) to (2, 115) then Sets a single white pixel at (280, 127).
; PLAN: r0=75(x), r1=118(y), r2=78(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x1), r6=110(y1), r7=2(x2), r8=115(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=280(x), r11=127(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 75
LDI r1, 118
LDI r2, 78
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 110
LDI r7, 2
LDI r8, 115
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 127
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
