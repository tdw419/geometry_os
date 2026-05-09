; DESCRIPTION: Composite: Sets a single orange pixel at (332, 204) then Renders a magenta line between points (34, 216) and (93, 18).
; PLAN: r0=332(x), r1=204(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=34(x1), r6=216(y1), r7=93(x2), r8=18(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 204
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 34
LDI r6, 216
LDI r7, 93
LDI r8, 18
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
