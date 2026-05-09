; DESCRIPTION: Composite: Sets a single blue pixel at (454, 39) then Places a red line segment connecting (133, 217) to (471, 174).
; PLAN: r0=454(x), r1=39(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=133(x1), r6=217(y1), r7=471(x2), r8=174(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 454
LDI r1, 39
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 133
LDI r6, 217
LDI r7, 471
LDI r8, 174
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
