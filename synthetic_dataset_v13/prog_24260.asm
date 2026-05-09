; DESCRIPTION: Composite: Places a blue dot at position (158, 25) then Draws a orange line from (471, 110) to (83, 176).
; PLAN: r0=158(x), r1=25(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=471(x1), r6=110(y1), r7=83(x2), r8=176(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 158
LDI r1, 25
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 471
LDI r6, 110
LDI r7, 83
LDI r8, 176
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
