; DESCRIPTION: Composite: Places a orange line segment connecting (388, 70) to (458, 89) then Sets a single red pixel at (2, 239).
; PLAN: r0=388(x1), r1=70(y1), r2=458(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=2(x), r6=239(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 388
LDI r1, 70
LDI r2, 458
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 239
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
