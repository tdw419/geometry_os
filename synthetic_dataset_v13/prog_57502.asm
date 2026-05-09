; DESCRIPTION: Composite: Renders a yellow line between points (112, 77) and (347, 110) then Sets a single magenta pixel at (266, 26).
; PLAN: r0=112(x1), r1=77(y1), r2=347(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=26(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 112
LDI r1, 77
LDI r2, 347
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 26
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
