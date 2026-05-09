; DESCRIPTION: Composite: Draws a white line from (379, 48) to (383, 158) then Sets a single yellow pixel at (368, 18).
; PLAN: r0=379(x1), r1=48(y1), r2=383(x2), r3=158(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=18(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 379
LDI r1, 48
LDI r2, 383
LDI r3, 158
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 18
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
