; DESCRIPTION: Composite: Draws a white line from (94, 211) to (258, 82) then Sets a single blue pixel at (429, 80).
; PLAN: r0=94(x1), r1=211(y1), r2=258(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=429(x), r6=80(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 94
LDI r1, 211
LDI r2, 258
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 80
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
