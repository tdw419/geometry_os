; DESCRIPTION: Composite: Draws a black line from (232, 104) to (175, 201) then Sets a single blue pixel at (456, 8).
; PLAN: r0=232(x1), r1=104(y1), r2=175(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=456(x), r6=8(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 232
LDI r1, 104
LDI r2, 175
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 8
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
