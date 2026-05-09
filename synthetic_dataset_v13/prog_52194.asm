; DESCRIPTION: Composite: Draws a green line from (180, 139) to (508, 252) then Draws a blue circle centered at (311, 150) with radius 71.
; PLAN: r0=180(x1), r1=139(y1), r2=508(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=150(y), r7=71(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 180
LDI r1, 139
LDI r2, 508
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 150
LDI r7, 71
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
