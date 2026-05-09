; DESCRIPTION: Composite: Draws a blue line from (439, 169) to (133, 30) then Sets a single magenta pixel at (43, 183).
; PLAN: r0=439(x1), r1=169(y1), r2=133(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=43(x), r6=183(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 439
LDI r1, 169
LDI r2, 133
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 183
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
