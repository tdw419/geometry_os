; DESCRIPTION: Composite: Places a magenta line segment connecting (94, 11) to (199, 39) then Sets a single magenta pixel at (454, 252).
; PLAN: r0=94(x1), r1=11(y1), r2=199(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=454(x), r6=252(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 94
LDI r1, 11
LDI r2, 199
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 252
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
