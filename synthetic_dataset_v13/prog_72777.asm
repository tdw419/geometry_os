; DESCRIPTION: Composite: Sets a single blue pixel at (83, 134) then Draws a blue line from (178, 227) to (496, 127).
; PLAN: r0=83(x), r1=134(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=178(x1), r6=227(y1), r7=496(x2), r8=127(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 83
LDI r1, 134
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 178
LDI r6, 227
LDI r7, 496
LDI r8, 127
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
