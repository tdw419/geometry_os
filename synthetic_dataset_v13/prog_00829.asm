; DESCRIPTION: Composite: Draws a blue line from (492, 109) to (248, 161) then Sets a single blue pixel at (471, 121).
; PLAN: r0=492(x1), r1=109(y1), r2=248(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=471(x), r6=121(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 492
LDI r1, 109
LDI r2, 248
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 121
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
