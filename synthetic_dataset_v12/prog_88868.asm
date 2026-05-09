; DESCRIPTION: Composite: Places a purple line segment connecting (61, 9) to (278, 89) then Places a yellow dot at position (332, 12).
; PLAN: r0=61(x1), r1=9(y1), r2=278(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=12(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 61
LDI r1, 9
LDI r2, 278
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 12
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
