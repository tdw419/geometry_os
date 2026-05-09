; DESCRIPTION: Composite: Creates a orange rectangular region at (395, 178) spanning 110 by 68 pixels then Places a red line segment connecting (316, 81) to (172, 213) then Sets a single orange pixel at (88, 16).
; PLAN: r0=395(x), r1=178(y), r2=110(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x1), r6=81(y1), r7=172(x2), r8=213(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=88(x), r11=16(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 395
LDI r1, 178
LDI r2, 110
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 81
LDI r7, 172
LDI r8, 213
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 88
LDI r11, 16
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
