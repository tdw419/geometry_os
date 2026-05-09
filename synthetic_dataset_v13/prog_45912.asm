; DESCRIPTION: Composite: Draws a blue line from (493, 87) to (163, 131) then Sets a single orange pixel at (448, 227).
; PLAN: r0=493(x1), r1=87(y1), r2=163(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=448(x), r6=227(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 493
LDI r1, 87
LDI r2, 163
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 227
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
