; DESCRIPTION: Composite: Places a black line segment connecting (486, 83) to (350, 234) then Sets a single purple pixel at (147, 247).
; PLAN: r0=486(x1), r1=83(y1), r2=350(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=147(x), r6=247(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 486
LDI r1, 83
LDI r2, 350
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 247
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
