; DESCRIPTION: Composite: Places a black line segment connecting (131, 249) to (143, 118) then Sets a single black pixel at (411, 221).
; PLAN: r0=131(x1), r1=249(y1), r2=143(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=411(x), r6=221(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 131
LDI r1, 249
LDI r2, 143
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 221
LDI r7, 0x000000
PSET r5, r6, r7
HALT
