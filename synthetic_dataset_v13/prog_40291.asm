; DESCRIPTION: Composite: Sets a single magenta pixel at (454, 105) then Draws a white line from (471, 31) to (472, 135).
; PLAN: r0=454(x), r1=105(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=471(x1), r6=31(y1), r7=472(x2), r8=135(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 454
LDI r1, 105
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 471
LDI r6, 31
LDI r7, 472
LDI r8, 135
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
