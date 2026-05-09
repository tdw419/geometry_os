; DESCRIPTION: Composite: Places a orange line segment connecting (332, 197) to (317, 39) then Sets a single orange pixel at (462, 201).
; PLAN: r0=332(x1), r1=197(y1), r2=317(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=462(x), r6=201(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 332
LDI r1, 197
LDI r2, 317
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 201
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
