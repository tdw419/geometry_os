; DESCRIPTION: Composite: Creates a red rectangular region at (241, 64) spanning 41 by 27 pixels then Places a orange line segment connecting (301, 75) to (268, 62).
; PLAN: r0=241(x), r1=64(y), r2=41(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=301(x1), r6=75(y1), r7=268(x2), r8=62(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 64
LDI r2, 41
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 75
LDI r7, 268
LDI r8, 62
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
