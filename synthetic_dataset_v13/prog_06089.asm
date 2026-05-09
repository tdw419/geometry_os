; DESCRIPTION: Composite: Sets a single purple pixel at (5, 51) then Places a purple line segment connecting (117, 98) to (499, 172).
; PLAN: r0=5(x), r1=51(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=117(x1), r6=98(y1), r7=499(x2), r8=172(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 5
LDI r1, 51
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 117
LDI r6, 98
LDI r7, 499
LDI r8, 172
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
