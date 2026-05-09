; DESCRIPTION: Composite: Sets a single red pixel at (363, 218) then Draws a black line from (87, 140) to (62, 165).
; PLAN: r0=363(x), r1=218(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=87(x1), r6=140(y1), r7=62(x2), r8=165(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 218
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 87
LDI r6, 140
LDI r7, 62
LDI r8, 165
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
