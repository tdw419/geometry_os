; DESCRIPTION: Composite: Sets a single purple pixel at (461, 97) then Draws a black line from (422, 78) to (311, 216).
; PLAN: r0=461(x), r1=97(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=422(x1), r6=78(y1), r7=311(x2), r8=216(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 461
LDI r1, 97
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 422
LDI r6, 78
LDI r7, 311
LDI r8, 216
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
