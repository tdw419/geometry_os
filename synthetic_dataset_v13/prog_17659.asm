; DESCRIPTION: Composite: Draws a white rectangle at (408, 165) with width 45 and height 33 then Draws a yellow line from (471, 162) to (486, 77).
; PLAN: r0=408(x), r1=165(y), r2=45(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=471(x1), r6=162(y1), r7=486(x2), r8=77(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 408
LDI r1, 165
LDI r2, 45
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 162
LDI r7, 486
LDI r8, 77
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
