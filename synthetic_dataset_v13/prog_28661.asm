; DESCRIPTION: Composite: Sets a single magenta pixel at (422, 50) then Places a red line segment connecting (31, 218) to (74, 106).
; PLAN: r0=422(x), r1=50(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=31(x1), r6=218(y1), r7=74(x2), r8=106(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 50
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 31
LDI r6, 218
LDI r7, 74
LDI r8, 106
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
