; DESCRIPTION: Composite: Creates a yellow rectangular region at (5, 159) spanning 56 by 89 pixels then Draws a blue line from (319, 75) to (75, 74).
; PLAN: r0=5(x), r1=159(y), r2=56(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x1), r6=75(y1), r7=75(x2), r8=74(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 5
LDI r1, 159
LDI r2, 56
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 75
LDI r7, 75
LDI r8, 74
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
