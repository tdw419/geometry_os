; DESCRIPTION: Composite: Sets a single blue pixel at (442, 201) then Renders a orange line between points (208, 126) and (410, 120).
; PLAN: r0=442(x), r1=201(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=208(x1), r6=126(y1), r7=410(x2), r8=120(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 442
LDI r1, 201
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 208
LDI r6, 126
LDI r7, 410
LDI r8, 120
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
