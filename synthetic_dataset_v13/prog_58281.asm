; DESCRIPTION: Composite: Places a purple line segment connecting (259, 169) to (445, 30) then Sets a single blue pixel at (83, 229).
; PLAN: r0=259(x1), r1=169(y1), r2=445(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=229(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 259
LDI r1, 169
LDI r2, 445
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 229
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
