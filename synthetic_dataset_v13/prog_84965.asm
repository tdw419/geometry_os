; DESCRIPTION: Composite: Draws a magenta line from (252, 182) to (332, 21) then Draws a purple rectangle at (7, 118) with width 107 and height 54.
; PLAN: r0=252(x1), r1=182(y1), r2=332(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=7(x), r6=118(y), r7=107(width), r8=54(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 182
LDI r2, 332
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 118
LDI r7, 107
LDI r8, 54
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
