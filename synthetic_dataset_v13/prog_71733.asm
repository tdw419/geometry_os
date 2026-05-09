; DESCRIPTION: Composite: Draws a yellow rectangle at (130, 87) with width 116 and height 36 then Draws a purple line from (27, 22) to (84, 182).
; PLAN: r0=130(x), r1=87(y), r2=116(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=27(x1), r6=22(y1), r7=84(x2), r8=182(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 87
LDI r2, 116
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 22
LDI r7, 84
LDI r8, 182
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
