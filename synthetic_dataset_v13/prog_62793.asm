; DESCRIPTION: Composite: Draws a red line from (432, 87) to (311, 117) then Sets a single orange pixel at (375, 203).
; PLAN: r0=432(x1), r1=87(y1), r2=311(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=375(x), r6=203(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 432
LDI r1, 87
LDI r2, 311
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 203
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
