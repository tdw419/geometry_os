; DESCRIPTION: Composite: Draws a magenta rectangle at (339, 41) with width 97 and height 73 then Draws a green line from (240, 140) to (216, 112).
; PLAN: r0=339(x), r1=41(y), r2=97(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x1), r6=140(y1), r7=216(x2), r8=112(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 339
LDI r1, 41
LDI r2, 97
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 140
LDI r7, 216
LDI r8, 112
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
