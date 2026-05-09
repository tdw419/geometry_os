; DESCRIPTION: Composite: Draws a magenta rectangle at (121, 170) with width 101 and height 11 then Draws a orange line from (424, 130) to (21, 122).
; PLAN: r0=121(x), r1=170(y), r2=101(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=424(x1), r6=130(y1), r7=21(x2), r8=122(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 121
LDI r1, 170
LDI r2, 101
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 130
LDI r7, 21
LDI r8, 122
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
