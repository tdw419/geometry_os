; DESCRIPTION: Composite: Draws a magenta line from (468, 115) to (360, 208) then Sets a single yellow pixel at (508, 202).
; PLAN: r0=468(x1), r1=115(y1), r2=360(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=508(x), r6=202(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 468
LDI r1, 115
LDI r2, 360
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 508
LDI r6, 202
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
