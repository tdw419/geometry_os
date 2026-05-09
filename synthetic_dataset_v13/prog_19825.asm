; DESCRIPTION: Composite: Renders a orange line between points (377, 236) and (23, 138) then Draws a magenta rectangle at (158, 105) with width 114 and height 62.
; PLAN: r0=377(x1), r1=236(y1), r2=23(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=158(x), r6=105(y), r7=114(width), r8=62(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 377
LDI r1, 236
LDI r2, 23
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 105
LDI r7, 114
LDI r8, 62
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
