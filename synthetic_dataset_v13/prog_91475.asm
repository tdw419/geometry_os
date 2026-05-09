; DESCRIPTION: Composite: Draws a blue rectangle at (232, 6) with width 106 and height 68 then Renders a magenta line between points (282, 60) and (235, 68).
; PLAN: r0=232(x), r1=6(y), r2=106(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=282(x1), r6=60(y1), r7=235(x2), r8=68(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 232
LDI r1, 6
LDI r2, 106
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 60
LDI r7, 235
LDI r8, 68
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
