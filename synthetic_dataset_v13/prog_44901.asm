; DESCRIPTION: Composite: Renders a yellow line between points (26, 95) and (229, 73) then Sets a single yellow pixel at (369, 219).
; PLAN: r0=26(x1), r1=95(y1), r2=229(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=219(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 26
LDI r1, 95
LDI r2, 229
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 219
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
