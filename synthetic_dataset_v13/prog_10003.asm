; DESCRIPTION: Composite: Sets a single cyan pixel at (77, 232) then Draws a magenta line from (348, 227) to (7, 235).
; PLAN: r0=77(x), r1=232(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=348(x1), r6=227(y1), r7=7(x2), r8=235(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 77
LDI r1, 232
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 348
LDI r6, 227
LDI r7, 7
LDI r8, 235
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
