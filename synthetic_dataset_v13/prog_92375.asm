; DESCRIPTION: Composite: Sets a single blue pixel at (381, 24) then Renders a orange line between points (235, 49) and (162, 126).
; PLAN: r0=381(x), r1=24(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=235(x1), r6=49(y1), r7=162(x2), r8=126(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 24
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 235
LDI r6, 49
LDI r7, 162
LDI r8, 126
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
