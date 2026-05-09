; DESCRIPTION: Composite: Renders a orange line between points (285, 222) and (238, 110) then Sets a single red pixel at (388, 74).
; PLAN: r0=285(x1), r1=222(y1), r2=238(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=74(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 285
LDI r1, 222
LDI r2, 238
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 74
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
