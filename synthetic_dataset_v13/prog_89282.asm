; DESCRIPTION: Composite: Draws a magenta rectangle at (378, 144) with width 69 and height 57 then Draws a blue line from (316, 94) to (138, 104).
; PLAN: r0=378(x), r1=144(y), r2=69(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x1), r6=94(y1), r7=138(x2), r8=104(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 144
LDI r2, 69
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 94
LDI r7, 138
LDI r8, 104
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
