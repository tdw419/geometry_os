; DESCRIPTION: Composite: Draws a purple rectangle at (101, 95) with width 57 and height 79 then Draws a magenta line from (200, 252) to (73, 134).
; PLAN: r0=101(x), r1=95(y), r2=57(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x1), r6=252(y1), r7=73(x2), r8=134(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 95
LDI r2, 57
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 252
LDI r7, 73
LDI r8, 134
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
