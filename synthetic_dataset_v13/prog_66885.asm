; DESCRIPTION: Composite: Draws a blue circle centered at (61, 134) with radius 54 then Places a blue line segment connecting (489, 155) to (276, 151).
; PLAN: r0=61(x), r1=134(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=489(x1), r6=155(y1), r7=276(x2), r8=151(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 134
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 489
LDI r6, 155
LDI r7, 276
LDI r8, 151
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
