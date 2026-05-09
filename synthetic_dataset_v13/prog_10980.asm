; DESCRIPTION: Composite: Draws a orange rectangle at (285, 89) with width 13 and height 10 then Renders a magenta line between points (2, 178) and (221, 235).
; PLAN: r0=285(x), r1=89(y), r2=13(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=2(x1), r6=178(y1), r7=221(x2), r8=235(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 285
LDI r1, 89
LDI r2, 13
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 178
LDI r7, 221
LDI r8, 235
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
