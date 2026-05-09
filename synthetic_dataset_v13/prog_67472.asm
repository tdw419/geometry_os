; DESCRIPTION: Composite: Sets a single blue pixel at (393, 96) then Places a red line segment connecting (139, 79) to (272, 75).
; PLAN: r0=393(x), r1=96(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=139(x1), r6=79(y1), r7=272(x2), r8=75(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 393
LDI r1, 96
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 139
LDI r6, 79
LDI r7, 272
LDI r8, 75
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
