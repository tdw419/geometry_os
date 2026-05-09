; DESCRIPTION: Composite: Draws a blue line from (84, 11) to (429, 227) then Draws a magenta rectangle at (285, 45) with width 77 and height 50.
; PLAN: r0=84(x1), r1=11(y1), r2=429(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=285(x), r6=45(y), r7=77(width), r8=50(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 11
LDI r2, 429
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 45
LDI r7, 77
LDI r8, 50
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
