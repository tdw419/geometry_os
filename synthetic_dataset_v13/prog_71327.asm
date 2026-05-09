; DESCRIPTION: Composite: Places a red line segment connecting (47, 107) to (37, 171) then Sets a single black pixel at (36, 203).
; PLAN: r0=47(x1), r1=107(y1), r2=37(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=36(x), r6=203(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 47
LDI r1, 107
LDI r2, 37
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 203
LDI r7, 0x000000
PSET r5, r6, r7
HALT
