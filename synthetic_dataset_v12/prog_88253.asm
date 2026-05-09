; DESCRIPTION: Composite: Sets a single blue pixel at (3, 172) then Places a orange line segment connecting (400, 119) to (482, 212).
; PLAN: r0=3(x), r1=172(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=400(x1), r6=119(y1), r7=482(x2), r8=212(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 172
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 400
LDI r6, 119
LDI r7, 482
LDI r8, 212
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
