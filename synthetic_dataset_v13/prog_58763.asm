; DESCRIPTION: Composite: Places a magenta line segment connecting (427, 245) to (333, 113) then Sets a single red pixel at (423, 11).
; PLAN: r0=427(x1), r1=245(y1), r2=333(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=423(x), r6=11(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 427
LDI r1, 245
LDI r2, 333
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 11
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
