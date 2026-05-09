; DESCRIPTION: Composite: Draws a purple line from (169, 216) to (208, 49) then Sets a single orange pixel at (137, 12).
; PLAN: r0=169(x1), r1=216(y1), r2=208(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=12(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 169
LDI r1, 216
LDI r2, 208
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 12
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
