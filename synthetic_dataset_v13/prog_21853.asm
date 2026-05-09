; DESCRIPTION: Composite: Draws a yellow line from (11, 164) to (22, 190) then Sets a single blue pixel at (376, 189).
; PLAN: r0=11(x1), r1=164(y1), r2=22(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=376(x), r6=189(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 11
LDI r1, 164
LDI r2, 22
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 189
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
