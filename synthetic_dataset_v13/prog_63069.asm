; DESCRIPTION: Composite: Creates a blue rectangular region at (253, 89) spanning 19 by 100 pixels then Draws a red line from (140, 84) to (104, 232).
; PLAN: r0=253(x), r1=89(y), r2=19(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=140(x1), r6=84(y1), r7=104(x2), r8=232(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 89
LDI r2, 19
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 84
LDI r7, 104
LDI r8, 232
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
