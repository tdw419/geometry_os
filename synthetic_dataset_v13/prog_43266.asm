; DESCRIPTION: Composite: Draws a yellow line from (510, 6) to (191, 147) then Sets a single magenta pixel at (195, 244).
; PLAN: r0=510(x1), r1=6(y1), r2=191(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=195(x), r6=244(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 510
LDI r1, 6
LDI r2, 191
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 244
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
