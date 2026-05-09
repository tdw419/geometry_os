; DESCRIPTION: Composite: Sets a single yellow pixel at (258, 60) then Draws a blue line from (483, 70) to (457, 13).
; PLAN: r0=258(x), r1=60(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=483(x1), r6=70(y1), r7=457(x2), r8=13(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 60
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 483
LDI r6, 70
LDI r7, 457
LDI r8, 13
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
