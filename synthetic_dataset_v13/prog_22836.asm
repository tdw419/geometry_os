; DESCRIPTION: Composite: Places a orange line segment connecting (162, 221) to (316, 15) then Sets a single blue pixel at (93, 108).
; PLAN: r0=162(x1), r1=221(y1), r2=316(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=108(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 162
LDI r1, 221
LDI r2, 316
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 108
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
