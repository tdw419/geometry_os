; DESCRIPTION: Composite: Draws a cyan line from (323, 34) to (355, 125) then Sets a single blue pixel at (131, 17).
; PLAN: r0=323(x1), r1=34(y1), r2=355(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=131(x), r6=17(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 323
LDI r1, 34
LDI r2, 355
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 17
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
