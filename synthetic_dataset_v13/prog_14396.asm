; DESCRIPTION: Composite: Places a blue line segment connecting (166, 123) to (145, 198) then Sets a single blue pixel at (313, 21).
; PLAN: r0=166(x1), r1=123(y1), r2=145(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=313(x), r6=21(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 166
LDI r1, 123
LDI r2, 145
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 21
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
