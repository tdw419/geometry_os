; DESCRIPTION: Composite: Places a purple line segment connecting (338, 184) to (120, 111) then Draws a orange circle centered at (468, 131) with radius 29.
; PLAN: r0=338(x1), r1=184(y1), r2=120(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=468(x), r6=131(y), r7=29(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 338
LDI r1, 184
LDI r2, 120
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 131
LDI r7, 29
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
