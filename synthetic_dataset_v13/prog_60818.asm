; DESCRIPTION: Composite: Sets a single blue pixel at (451, 193) then Places a red line segment connecting (467, 159) to (209, 112).
; PLAN: r0=451(x), r1=193(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=467(x1), r6=159(y1), r7=209(x2), r8=112(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 193
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 467
LDI r6, 159
LDI r7, 209
LDI r8, 112
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
