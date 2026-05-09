; DESCRIPTION: Composite: Places a green line segment connecting (418, 107) to (116, 61) then Sets a single green pixel at (302, 179).
; PLAN: r0=418(x1), r1=107(y1), r2=116(x2), r3=61(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=179(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 418
LDI r1, 107
LDI r2, 116
LDI r3, 61
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 179
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
