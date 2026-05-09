; DESCRIPTION: Composite: Places a black line segment connecting (271, 93) to (254, 108) then Draws a green rectangle at (155, 37) with width 112 and height 85.
; PLAN: r0=271(x1), r1=93(y1), r2=254(x2), r3=108(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=155(x), r6=37(y), r7=112(width), r8=85(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 93
LDI r2, 254
LDI r3, 108
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 37
LDI r7, 112
LDI r8, 85
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
