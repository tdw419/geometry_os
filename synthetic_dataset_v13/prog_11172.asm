; DESCRIPTION: Composite: Draws a yellow rectangle at (11, 150) with width 110 and height 106 then Draws a green line from (75, 155) to (8, 19).
; PLAN: r0=11(x), r1=150(y), r2=110(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x1), r6=155(y1), r7=8(x2), r8=19(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 11
LDI r1, 150
LDI r2, 110
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 155
LDI r7, 8
LDI r8, 19
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
