; DESCRIPTION: Composite: Draws a magenta circle centered at (447, 95) with radius 36 then Places a orange line segment connecting (389, 172) to (199, 113).
; PLAN: r0=447(x), r1=95(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=389(x1), r6=172(y1), r7=199(x2), r8=113(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 447
LDI r1, 95
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 389
LDI r6, 172
LDI r7, 199
LDI r8, 113
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
