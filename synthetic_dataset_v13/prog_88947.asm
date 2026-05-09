; DESCRIPTION: Composite: Draws a purple line from (100, 0) to (190, 108) then Draws a black rectangle at (63, 81) with width 117 and height 73.
; PLAN: r0=100(x1), r1=0(y1), r2=190(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=81(y), r7=117(width), r8=73(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 0
LDI r2, 190
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 81
LDI r7, 117
LDI r8, 73
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
