; DESCRIPTION: Composite: Draws a black line from (230, 176) to (122, 4) then Sets a single red pixel at (238, 122).
; PLAN: r0=230(x1), r1=176(y1), r2=122(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=238(x), r6=122(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 230
LDI r1, 176
LDI r2, 122
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 122
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
