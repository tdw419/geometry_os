; DESCRIPTION: Composite: Draws a blue line from (241, 180) to (345, 58) then Sets a single magenta pixel at (388, 145).
; PLAN: r0=241(x1), r1=180(y1), r2=345(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=145(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 241
LDI r1, 180
LDI r2, 345
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 145
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
