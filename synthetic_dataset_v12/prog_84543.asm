; DESCRIPTION: Composite: Places a yellow line segment connecting (20, 76) to (378, 223) then Draws a purple rectangle at (118, 6) with width 13 and height 91.
; PLAN: r0=20(x1), r1=76(y1), r2=378(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=118(x), r6=6(y), r7=13(width), r8=91(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 20
LDI r1, 76
LDI r2, 378
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 6
LDI r7, 13
LDI r8, 91
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
