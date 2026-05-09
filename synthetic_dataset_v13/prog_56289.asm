; DESCRIPTION: Composite: Places a red line segment connecting (55, 153) to (467, 10) then Sets a single red pixel at (439, 58).
; PLAN: r0=55(x1), r1=153(y1), r2=467(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=439(x), r6=58(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 55
LDI r1, 153
LDI r2, 467
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 58
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
