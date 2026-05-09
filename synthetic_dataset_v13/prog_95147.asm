; DESCRIPTION: Composite: Sets a single yellow pixel at (391, 199) then Places a yellow line segment connecting (30, 200) to (484, 157).
; PLAN: r0=391(x), r1=199(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=30(x1), r6=200(y1), r7=484(x2), r8=157(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 391
LDI r1, 199
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 30
LDI r6, 200
LDI r7, 484
LDI r8, 157
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
