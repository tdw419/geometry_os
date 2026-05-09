; DESCRIPTION: Composite: Creates a red rectangular region at (75, 104) spanning 87 by 88 pixels then Draws a red line from (364, 106) to (353, 63).
; PLAN: r0=75(x), r1=104(y), r2=87(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=364(x1), r6=106(y1), r7=353(x2), r8=63(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 75
LDI r1, 104
LDI r2, 87
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 106
LDI r7, 353
LDI r8, 63
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
