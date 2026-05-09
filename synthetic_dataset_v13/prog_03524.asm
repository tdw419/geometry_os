; DESCRIPTION: Composite: Draws a magenta line from (177, 153) to (26, 134) then Draws a blue rectangle at (116, 40) with width 118 and height 43.
; PLAN: r0=177(x1), r1=153(y1), r2=26(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=40(y), r7=118(width), r8=43(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 177
LDI r1, 153
LDI r2, 26
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 40
LDI r7, 118
LDI r8, 43
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
