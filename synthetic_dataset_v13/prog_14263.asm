; DESCRIPTION: Composite: Creates a magenta rectangular region at (276, 55) spanning 41 by 88 pixels then Draws a orange line from (75, 7) to (266, 158) then Places a magenta dot at position (53, 220).
; PLAN: r0=276(x), r1=55(y), r2=41(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x1), r6=7(y1), r7=266(x2), r8=158(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=53(x), r11=220(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 276
LDI r1, 55
LDI r2, 41
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 7
LDI r7, 266
LDI r8, 158
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 220
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
