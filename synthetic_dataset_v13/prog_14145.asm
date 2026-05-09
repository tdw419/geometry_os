; DESCRIPTION: Composite: Draws a yellow line from (140, 155) to (241, 118) then Sets a single green pixel at (268, 39).
; PLAN: r0=140(x1), r1=155(y1), r2=241(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=268(x), r6=39(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 140
LDI r1, 155
LDI r2, 241
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 39
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
