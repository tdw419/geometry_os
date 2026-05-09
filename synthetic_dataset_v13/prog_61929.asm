; DESCRIPTION: Composite: Places a orange line segment connecting (319, 194) to (375, 194) then Sets a single red pixel at (96, 94).
; PLAN: r0=319(x1), r1=194(y1), r2=375(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=96(x), r6=94(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 319
LDI r1, 194
LDI r2, 375
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 94
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
