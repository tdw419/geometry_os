; DESCRIPTION: Composite: Draws a orange line from (58, 90) to (178, 60) then Creates a red rectangular region at (391, 77) spanning 15 by 52 pixels then Places a white dot at position (261, 104).
; PLAN: r0=58(x1), r1=90(y1), r2=178(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=77(y), r7=15(width), r8=52(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=261(x), r11=104(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 58
LDI r1, 90
LDI r2, 178
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 77
LDI r7, 15
LDI r8, 52
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 104
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
