; DESCRIPTION: Composite: Sets a single green pixel at (26, 33) then Renders a orange line between points (467, 51) and (200, 130).
; PLAN: r0=26(x), r1=33(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=467(x1), r6=51(y1), r7=200(x2), r8=130(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 26
LDI r1, 33
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 467
LDI r6, 51
LDI r7, 200
LDI r8, 130
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
