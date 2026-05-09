; DESCRIPTION: Composite: Draws a orange line from (311, 222) to (383, 131) then Sets a single black pixel at (315, 237).
; PLAN: r0=311(x1), r1=222(y1), r2=383(x2), r3=131(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=315(x), r6=237(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 311
LDI r1, 222
LDI r2, 383
LDI r3, 131
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 237
LDI r7, 0x000000
PSET r5, r6, r7
HALT
