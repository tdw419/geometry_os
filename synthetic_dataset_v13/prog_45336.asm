; DESCRIPTION: Composite: Sets a single purple pixel at (496, 88) then Places a red line segment connecting (3, 241) to (307, 182).
; PLAN: r0=496(x), r1=88(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=3(x1), r6=241(y1), r7=307(x2), r8=182(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 496
LDI r1, 88
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 3
LDI r6, 241
LDI r7, 307
LDI r8, 182
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
