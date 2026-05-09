; DESCRIPTION: Composite: Places a black dot at position (331, 127) then Places a blue line segment connecting (314, 254) to (483, 106).
; PLAN: r0=331(x), r1=127(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=314(x1), r6=254(y1), r7=483(x2), r8=106(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 331
LDI r1, 127
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 314
LDI r6, 254
LDI r7, 483
LDI r8, 106
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
