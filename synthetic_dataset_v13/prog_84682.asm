; DESCRIPTION: Composite: Creates a green rectangular region at (30, 85) spanning 45 by 94 pixels then Draws a red line from (469, 15) to (471, 11).
; PLAN: r0=30(x), r1=85(y), r2=45(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=469(x1), r6=15(y1), r7=471(x2), r8=11(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 30
LDI r1, 85
LDI r2, 45
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 15
LDI r7, 471
LDI r8, 11
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
