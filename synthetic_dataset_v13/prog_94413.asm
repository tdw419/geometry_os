; DESCRIPTION: Composite: Sets a single red pixel at (483, 94) then Draws a magenta line from (72, 111) to (378, 194).
; PLAN: r0=483(x), r1=94(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=72(x1), r6=111(y1), r7=378(x2), r8=194(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 483
LDI r1, 94
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 72
LDI r6, 111
LDI r7, 378
LDI r8, 194
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
