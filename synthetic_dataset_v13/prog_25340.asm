; DESCRIPTION: Composite: Draws a blue line from (438, 89) to (47, 145) then Creates a purple circular shape at (77, 139) with radius 19.
; PLAN: r0=438(x1), r1=89(y1), r2=47(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=77(x), r6=139(y), r7=19(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 438
LDI r1, 89
LDI r2, 47
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 139
LDI r7, 19
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
