; DESCRIPTION: Composite: Places a black line segment connecting (266, 157) to (55, 25) then Sets a single black pixel at (24, 22).
; PLAN: r0=266(x1), r1=157(y1), r2=55(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=24(x), r6=22(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 266
LDI r1, 157
LDI r2, 55
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 22
LDI r7, 0x000000
PSET r5, r6, r7
HALT
