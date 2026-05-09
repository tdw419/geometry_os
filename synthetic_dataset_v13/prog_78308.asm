; DESCRIPTION: Composite: Places a blue line segment connecting (342, 164) to (511, 207) then Sets a single purple pixel at (201, 140).
; PLAN: r0=342(x1), r1=164(y1), r2=511(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=201(x), r6=140(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 342
LDI r1, 164
LDI r2, 511
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 140
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
