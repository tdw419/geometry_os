; DESCRIPTION: Composite: Places a red line segment connecting (87, 139) to (222, 31) then Sets a single yellow pixel at (124, 49).
; PLAN: r0=87(x1), r1=139(y1), r2=222(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=124(x), r6=49(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 87
LDI r1, 139
LDI r2, 222
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 49
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
