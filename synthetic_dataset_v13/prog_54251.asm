; DESCRIPTION: Composite: Draws a green line from (163, 41) to (325, 31) then Sets a single red pixel at (247, 119).
; PLAN: r0=163(x1), r1=41(y1), r2=325(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=119(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 163
LDI r1, 41
LDI r2, 325
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 119
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
