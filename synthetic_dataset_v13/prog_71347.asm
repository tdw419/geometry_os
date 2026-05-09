; DESCRIPTION: Composite: Sets a single magenta pixel at (321, 69) then Places a orange line segment connecting (347, 6) to (469, 248).
; PLAN: r0=321(x), r1=69(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=347(x1), r6=6(y1), r7=469(x2), r8=248(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 321
LDI r1, 69
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 347
LDI r6, 6
LDI r7, 469
LDI r8, 248
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
