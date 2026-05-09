; DESCRIPTION: Composite: Places a black line segment connecting (311, 85) to (268, 46) then Draws a blue rectangle at (266, 45) with width 108 and height 16.
; PLAN: r0=311(x1), r1=85(y1), r2=268(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=45(y), r7=108(width), r8=16(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 311
LDI r1, 85
LDI r2, 268
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 45
LDI r7, 108
LDI r8, 16
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
