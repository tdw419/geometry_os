; DESCRIPTION: Composite: Sets a single blue pixel at (431, 52) then Places a red line segment connecting (66, 162) to (332, 250).
; PLAN: r0=431(x), r1=52(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=66(x1), r6=162(y1), r7=332(x2), r8=250(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 52
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 66
LDI r6, 162
LDI r7, 332
LDI r8, 250
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
