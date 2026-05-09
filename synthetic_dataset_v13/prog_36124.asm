; DESCRIPTION: Composite: Renders a red line between points (457, 201) and (304, 54) then Sets a single orange pixel at (367, 31).
; PLAN: r0=457(x1), r1=201(y1), r2=304(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=31(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 457
LDI r1, 201
LDI r2, 304
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 31
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
