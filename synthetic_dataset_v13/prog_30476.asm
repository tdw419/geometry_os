; DESCRIPTION: Composite: Draws a purple line from (344, 245) to (101, 200) then Draws a red rectangle at (66, 10) with width 81 and height 95.
; PLAN: r0=344(x1), r1=245(y1), r2=101(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=66(x), r6=10(y), r7=81(width), r8=95(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 344
LDI r1, 245
LDI r2, 101
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 10
LDI r7, 81
LDI r8, 95
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
