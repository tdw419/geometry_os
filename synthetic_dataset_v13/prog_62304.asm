; DESCRIPTION: Composite: Renders a blue line between points (410, 102) and (448, 190) then Sets a single yellow pixel at (472, 88).
; PLAN: r0=410(x1), r1=102(y1), r2=448(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=472(x), r6=88(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 410
LDI r1, 102
LDI r2, 448
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 88
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
