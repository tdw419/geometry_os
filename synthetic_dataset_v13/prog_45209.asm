; DESCRIPTION: Composite: Draws a magenta rectangle at (95, 65) with width 57 and height 31 then Renders a yellow line between points (1, 122) and (490, 71).
; PLAN: r0=95(x), r1=65(y), r2=57(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=1(x1), r6=122(y1), r7=490(x2), r8=71(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 65
LDI r2, 57
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 122
LDI r7, 490
LDI r8, 71
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
