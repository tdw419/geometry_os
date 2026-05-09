; DESCRIPTION: Composite: Draws a red line from (236, 32) to (481, 208) then Draws a purple rectangle at (318, 83) with width 113 and height 106.
; PLAN: r0=236(x1), r1=32(y1), r2=481(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=83(y), r7=113(width), r8=106(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 32
LDI r2, 481
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 83
LDI r7, 113
LDI r8, 106
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
