; DESCRIPTION: Composite: Sets a single cyan pixel at (311, 182) then Places a purple line segment connecting (8, 199) to (317, 188).
; PLAN: r0=311(x), r1=182(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=8(x1), r6=199(y1), r7=317(x2), r8=188(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 311
LDI r1, 182
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 8
LDI r6, 199
LDI r7, 317
LDI r8, 188
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
