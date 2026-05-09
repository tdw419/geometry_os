; DESCRIPTION: Composite: Draws a green line from (361, 29) to (498, 121) then Sets a single orange pixel at (26, 118).
; PLAN: r0=361(x1), r1=29(y1), r2=498(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=26(x), r6=118(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 361
LDI r1, 29
LDI r2, 498
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 118
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
