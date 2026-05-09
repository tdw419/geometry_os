; DESCRIPTION: Composite: Draws a yellow rectangle at (153, 139) with width 95 and height 47 then Places a orange line segment connecting (291, 201) to (229, 243).
; PLAN: r0=153(x), r1=139(y), r2=95(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x1), r6=201(y1), r7=229(x2), r8=243(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 153
LDI r1, 139
LDI r2, 95
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 201
LDI r7, 229
LDI r8, 243
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
