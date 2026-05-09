; DESCRIPTION: Composite: Draws a green rectangle at (1, 7) with width 75 and height 110 then Draws a magenta line from (455, 3) to (106, 74).
; PLAN: r0=1(x), r1=7(y), r2=75(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=455(x1), r6=3(y1), r7=106(x2), r8=74(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 1
LDI r1, 7
LDI r2, 75
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 3
LDI r7, 106
LDI r8, 74
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
