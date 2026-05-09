; DESCRIPTION: Composite: Draws a magenta line from (363, 131) to (506, 156) then Draws a magenta rectangle at (324, 179) with width 83 and height 70.
; PLAN: r0=363(x1), r1=131(y1), r2=506(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=179(y), r7=83(width), r8=70(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 131
LDI r2, 506
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 179
LDI r7, 83
LDI r8, 70
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
