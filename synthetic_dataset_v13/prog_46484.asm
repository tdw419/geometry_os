; DESCRIPTION: Composite: Places a green line segment connecting (500, 40) to (291, 47) then Draws a purple rectangle at (266, 156) with width 11 and height 12.
; PLAN: r0=500(x1), r1=40(y1), r2=291(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=156(y), r7=11(width), r8=12(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 500
LDI r1, 40
LDI r2, 291
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 156
LDI r7, 11
LDI r8, 12
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
