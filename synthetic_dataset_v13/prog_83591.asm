; DESCRIPTION: Composite: Sets a single yellow pixel at (129, 117) then Places a purple line segment connecting (190, 26) to (469, 241).
; PLAN: r0=129(x), r1=117(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=190(x1), r6=26(y1), r7=469(x2), r8=241(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 117
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 190
LDI r6, 26
LDI r7, 469
LDI r8, 241
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
