; DESCRIPTION: Composite: Draws a red line from (8, 181) to (18, 129) then Sets a single blue pixel at (419, 118).
; PLAN: r0=8(x1), r1=181(y1), r2=18(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=419(x), r6=118(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 8
LDI r1, 181
LDI r2, 18
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 118
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
