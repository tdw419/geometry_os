; DESCRIPTION: Composite: Places a yellow line segment connecting (181, 38) to (133, 43) then Sets a single yellow pixel at (293, 47).
; PLAN: r0=181(x1), r1=38(y1), r2=133(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=47(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 181
LDI r1, 38
LDI r2, 133
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 47
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
