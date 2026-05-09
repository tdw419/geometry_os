; DESCRIPTION: Composite: Draws a black line from (146, 153) to (477, 146) then Sets a single magenta pixel at (467, 200).
; PLAN: r0=146(x1), r1=153(y1), r2=477(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=200(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 146
LDI r1, 153
LDI r2, 477
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 200
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
