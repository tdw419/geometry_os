; DESCRIPTION: Composite: Places a blue line segment connecting (344, 251) to (382, 235) then Sets a single yellow pixel at (496, 138).
; PLAN: r0=344(x1), r1=251(y1), r2=382(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=496(x), r6=138(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 344
LDI r1, 251
LDI r2, 382
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 496
LDI r6, 138
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
