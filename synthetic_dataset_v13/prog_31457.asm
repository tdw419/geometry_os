; DESCRIPTION: Composite: Places a red line segment connecting (155, 80) to (40, 89) then Draws a green circle centered at (86, 111) with radius 26.
; PLAN: r0=155(x1), r1=80(y1), r2=40(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=111(y), r7=26(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 155
LDI r1, 80
LDI r2, 40
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 111
LDI r7, 26
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
