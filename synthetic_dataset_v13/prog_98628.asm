; DESCRIPTION: Composite: Draws a purple line from (365, 54) to (461, 138) then Sets a single yellow pixel at (170, 78).
; PLAN: r0=365(x1), r1=54(y1), r2=461(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=78(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 365
LDI r1, 54
LDI r2, 461
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 78
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
