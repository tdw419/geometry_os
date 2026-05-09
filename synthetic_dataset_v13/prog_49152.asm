; DESCRIPTION: Composite: Renders a blue box of size 88x101 starting at (311, 105) then Places a red line segment connecting (299, 98) to (489, 214) then Sets a single green pixel at (47, 69).
; PLAN: r0=311(x), r1=105(y), r2=88(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x1), r6=98(y1), r7=489(x2), r8=214(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=47(x), r11=69(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 311
LDI r1, 105
LDI r2, 88
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 98
LDI r7, 489
LDI r8, 214
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 69
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
