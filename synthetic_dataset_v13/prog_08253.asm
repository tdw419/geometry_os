; DESCRIPTION: Composite: Places a green line segment connecting (183, 40) to (452, 233) then Sets a single blue pixel at (211, 155).
; PLAN: r0=183(x1), r1=40(y1), r2=452(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=155(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 183
LDI r1, 40
LDI r2, 452
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 155
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
