; DESCRIPTION: Composite: Places a red line segment connecting (441, 45) to (51, 117) then Sets a single red pixel at (447, 188).
; PLAN: r0=441(x1), r1=45(y1), r2=51(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=447(x), r6=188(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 441
LDI r1, 45
LDI r2, 51
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 188
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
