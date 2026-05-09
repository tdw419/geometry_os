; DESCRIPTION: Composite: Places a orange dot at position (378, 238) then Draws a black line from (182, 10) to (106, 168).
; PLAN: r0=378(x), r1=238(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=182(x1), r6=10(y1), r7=106(x2), r8=168(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 238
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 182
LDI r6, 10
LDI r7, 106
LDI r8, 168
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
