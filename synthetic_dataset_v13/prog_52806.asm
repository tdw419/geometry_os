; DESCRIPTION: Composite: Places a red line segment connecting (232, 119) to (497, 141) then Sets a single black pixel at (60, 44).
; PLAN: r0=232(x1), r1=119(y1), r2=497(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=44(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 232
LDI r1, 119
LDI r2, 497
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 44
LDI r7, 0x000000
PSET r5, r6, r7
HALT
