; DESCRIPTION: Composite: Draws a purple line from (325, 21) to (369, 45) then Sets a single blue pixel at (370, 202).
; PLAN: r0=325(x1), r1=21(y1), r2=369(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=370(x), r6=202(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 325
LDI r1, 21
LDI r2, 369
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 202
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
