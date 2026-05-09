; DESCRIPTION: Composite: Draws a green line from (170, 155) to (141, 219) then Draws a blue rectangle at (25, 65) with width 76 and height 119.
; PLAN: r0=170(x1), r1=155(y1), r2=141(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=65(y), r7=76(width), r8=119(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 170
LDI r1, 155
LDI r2, 141
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 65
LDI r7, 76
LDI r8, 119
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
