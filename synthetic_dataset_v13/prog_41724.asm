; DESCRIPTION: Composite: Draws a red line from (136, 118) to (177, 164) then Sets a single white pixel at (427, 216).
; PLAN: r0=136(x1), r1=118(y1), r2=177(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=427(x), r6=216(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 136
LDI r1, 118
LDI r2, 177
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 216
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
