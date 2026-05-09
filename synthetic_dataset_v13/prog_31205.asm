; DESCRIPTION: Composite: Sets a single yellow pixel at (24, 89) then Draws a white line from (438, 192) to (137, 90).
; PLAN: r0=24(x), r1=89(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=438(x1), r6=192(y1), r7=137(x2), r8=90(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 24
LDI r1, 89
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 438
LDI r6, 192
LDI r7, 137
LDI r8, 90
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
