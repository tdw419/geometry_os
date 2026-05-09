; DESCRIPTION: Composite: Draws a orange rectangle at (430, 58) with width 23 and height 112 then Renders a white line between points (378, 179) and (455, 81).
; PLAN: r0=430(x), r1=58(y), r2=23(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=378(x1), r6=179(y1), r7=455(x2), r8=81(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 430
LDI r1, 58
LDI r2, 23
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 179
LDI r7, 455
LDI r8, 81
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
