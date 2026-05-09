; DESCRIPTION: Composite: Places a magenta line segment connecting (379, 174) to (139, 83) then Sets a single red pixel at (35, 137).
; PLAN: r0=379(x1), r1=174(y1), r2=139(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=35(x), r6=137(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 379
LDI r1, 174
LDI r2, 139
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 137
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
