; DESCRIPTION: Composite: Draws a blue line from (147, 86) to (211, 52) then Sets a single red pixel at (180, 45).
; PLAN: r0=147(x1), r1=86(y1), r2=211(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=180(x), r6=45(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 147
LDI r1, 86
LDI r2, 211
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 45
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
