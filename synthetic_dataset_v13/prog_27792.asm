; DESCRIPTION: Composite: Sets a single orange pixel at (195, 98) then Places a orange line segment connecting (33, 238) to (432, 28).
; PLAN: r0=195(x), r1=98(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=33(x1), r6=238(y1), r7=432(x2), r8=28(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 195
LDI r1, 98
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 33
LDI r6, 238
LDI r7, 432
LDI r8, 28
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
