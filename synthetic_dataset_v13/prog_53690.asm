; DESCRIPTION: Composite: Places a red line segment connecting (93, 175) to (288, 175) then Sets a single yellow pixel at (478, 110).
; PLAN: r0=93(x1), r1=175(y1), r2=288(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=478(x), r6=110(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 93
LDI r1, 175
LDI r2, 288
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 110
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
