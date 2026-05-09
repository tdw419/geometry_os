; DESCRIPTION: Composite: Sets a single orange pixel at (472, 35) then Places a orange line segment connecting (238, 250) to (373, 69).
; PLAN: r0=472(x), r1=35(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=238(x1), r6=250(y1), r7=373(x2), r8=69(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 472
LDI r1, 35
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 238
LDI r6, 250
LDI r7, 373
LDI r8, 69
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
