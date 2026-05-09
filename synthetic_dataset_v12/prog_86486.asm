; DESCRIPTION: Composite: Sets a single yellow pixel at (189, 26) then Places a magenta line segment connecting (390, 232) to (359, 131).
; PLAN: r0=189(x), r1=26(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=390(x1), r6=232(y1), r7=359(x2), r8=131(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 26
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 390
LDI r6, 232
LDI r7, 359
LDI r8, 131
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
