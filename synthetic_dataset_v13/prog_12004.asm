; DESCRIPTION: Composite: Draws a purple line from (95, 121) to (376, 79) then Sets a single blue pixel at (140, 39).
; PLAN: r0=95(x1), r1=121(y1), r2=376(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=39(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 95
LDI r1, 121
LDI r2, 376
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 39
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
