; DESCRIPTION: Composite: Renders a red line between points (495, 96) and (316, 132) then Draws a magenta rectangle at (286, 74) with width 89 and height 95.
; PLAN: r0=495(x1), r1=96(y1), r2=316(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=74(y), r7=89(width), r8=95(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 495
LDI r1, 96
LDI r2, 316
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 74
LDI r7, 89
LDI r8, 95
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
