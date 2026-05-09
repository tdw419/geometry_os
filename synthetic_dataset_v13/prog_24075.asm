; DESCRIPTION: Composite: Draws a blue line from (351, 227) to (91, 125) then Sets a single red pixel at (355, 53).
; PLAN: r0=351(x1), r1=227(y1), r2=91(x2), r3=125(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=53(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 351
LDI r1, 227
LDI r2, 91
LDI r3, 125
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 53
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
