; DESCRIPTION: Composite: Places a purple line segment connecting (155, 83) to (256, 14) then Sets a single green pixel at (196, 51).
; PLAN: r0=155(x1), r1=83(y1), r2=256(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=51(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 155
LDI r1, 83
LDI r2, 256
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 51
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
