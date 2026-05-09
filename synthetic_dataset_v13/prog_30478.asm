; DESCRIPTION: Composite: Draws a purple rectangle at (221, 81) with width 50 and height 26 then Draws a purple line from (119, 50) to (453, 166).
; PLAN: r0=221(x), r1=81(y), r2=50(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=119(x1), r6=50(y1), r7=453(x2), r8=166(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 221
LDI r1, 81
LDI r2, 50
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 50
LDI r7, 453
LDI r8, 166
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
