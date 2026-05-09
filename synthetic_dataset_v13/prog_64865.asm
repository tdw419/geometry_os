; DESCRIPTION: Composite: Places a purple line segment connecting (211, 184) to (325, 94) then Sets a single blue pixel at (403, 119).
; PLAN: r0=211(x1), r1=184(y1), r2=325(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=403(x), r6=119(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 211
LDI r1, 184
LDI r2, 325
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 119
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
