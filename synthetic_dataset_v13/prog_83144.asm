; DESCRIPTION: Composite: Sets a single orange pixel at (241, 71) then Draws a yellow line from (389, 76) to (194, 15).
; PLAN: r0=241(x), r1=71(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=389(x1), r6=76(y1), r7=194(x2), r8=15(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 71
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 389
LDI r6, 76
LDI r7, 194
LDI r8, 15
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
