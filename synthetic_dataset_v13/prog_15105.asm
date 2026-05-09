; DESCRIPTION: Composite: Sets a single blue pixel at (83, 185) then Draws a red line from (127, 127) to (195, 214).
; PLAN: r0=83(x), r1=185(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=127(x1), r6=127(y1), r7=195(x2), r8=214(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 83
LDI r1, 185
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 127
LDI r6, 127
LDI r7, 195
LDI r8, 214
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
