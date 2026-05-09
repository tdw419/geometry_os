; DESCRIPTION: Composite: Draws a green rectangle at (377, 78) with width 12 and height 105 then Draws a blue line from (482, 64) to (68, 194).
; PLAN: r0=377(x), r1=78(y), r2=12(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=482(x1), r6=64(y1), r7=68(x2), r8=194(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 377
LDI r1, 78
LDI r2, 12
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 64
LDI r7, 68
LDI r8, 194
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
