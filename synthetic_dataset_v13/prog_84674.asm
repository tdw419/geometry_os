; DESCRIPTION: Composite: Draws a yellow line from (139, 90) to (433, 216) then Sets a single blue pixel at (330, 112).
; PLAN: r0=139(x1), r1=90(y1), r2=433(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=112(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 139
LDI r1, 90
LDI r2, 433
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 112
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
