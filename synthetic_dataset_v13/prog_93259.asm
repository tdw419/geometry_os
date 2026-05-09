; DESCRIPTION: Composite: Sets a single yellow pixel at (315, 115) then Draws a green line from (138, 232) to (199, 82).
; PLAN: r0=315(x), r1=115(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=138(x1), r6=232(y1), r7=199(x2), r8=82(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 315
LDI r1, 115
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 138
LDI r6, 232
LDI r7, 199
LDI r8, 82
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
