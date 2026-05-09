; DESCRIPTION: Composite: Sets a single yellow pixel at (483, 43) then Draws a yellow line from (327, 225) to (358, 221).
; PLAN: r0=483(x), r1=43(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=327(x1), r6=225(y1), r7=358(x2), r8=221(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 483
LDI r1, 43
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 327
LDI r6, 225
LDI r7, 358
LDI r8, 221
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
