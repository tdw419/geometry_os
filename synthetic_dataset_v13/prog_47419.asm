; DESCRIPTION: Composite: Sets a single blue pixel at (430, 9) then Draws a orange line from (492, 235) to (247, 43).
; PLAN: r0=430(x), r1=9(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=492(x1), r6=235(y1), r7=247(x2), r8=43(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 430
LDI r1, 9
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 492
LDI r6, 235
LDI r7, 247
LDI r8, 43
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
