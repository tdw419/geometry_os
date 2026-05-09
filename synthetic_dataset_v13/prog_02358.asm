; DESCRIPTION: Composite: Sets a single orange pixel at (322, 166) then Draws a purple line from (358, 119) to (240, 185).
; PLAN: r0=322(x), r1=166(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=358(x1), r6=119(y1), r7=240(x2), r8=185(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 166
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 358
LDI r6, 119
LDI r7, 240
LDI r8, 185
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
