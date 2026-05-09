; DESCRIPTION: Composite: Sets a single magenta pixel at (139, 77) then Renders a orange line between points (189, 170) and (437, 201).
; PLAN: r0=139(x), r1=77(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=189(x1), r6=170(y1), r7=437(x2), r8=201(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 77
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 189
LDI r6, 170
LDI r7, 437
LDI r8, 201
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
