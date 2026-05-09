; DESCRIPTION: Composite: Places a orange line segment connecting (302, 180) to (266, 49) then Draws a yellow rectangle at (42, 6) with width 45 and height 20.
; PLAN: r0=302(x1), r1=180(y1), r2=266(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=42(x), r6=6(y), r7=45(width), r8=20(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 302
LDI r1, 180
LDI r2, 266
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 6
LDI r7, 45
LDI r8, 20
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
