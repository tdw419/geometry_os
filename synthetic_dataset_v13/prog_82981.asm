; DESCRIPTION: Composite: Draws a purple line from (104, 95) to (459, 106) then Creates a orange rectangular region at (475, 143) spanning 34 by 89 pixels.
; PLAN: r0=104(x1), r1=95(y1), r2=459(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=475(x), r6=143(y), r7=34(width), r8=89(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 95
LDI r2, 459
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 475
LDI r6, 143
LDI r7, 34
LDI r8, 89
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
