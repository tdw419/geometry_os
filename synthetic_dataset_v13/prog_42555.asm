; DESCRIPTION: Composite: Places a purple line segment connecting (258, 140) to (26, 220) then Draws a red circle centered at (447, 44) with radius 38.
; PLAN: r0=258(x1), r1=140(y1), r2=26(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=447(x), r6=44(y), r7=38(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 258
LDI r1, 140
LDI r2, 26
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 44
LDI r7, 38
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
