; DESCRIPTION: Composite: Places a red dot at position (260, 250) then Draws a orange line from (121, 148) to (378, 126).
; PLAN: r0=260(x), r1=250(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=121(x1), r6=148(y1), r7=378(x2), r8=126(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 250
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 121
LDI r6, 148
LDI r7, 378
LDI r8, 126
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
