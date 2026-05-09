; DESCRIPTION: Composite: Draws a black line from (332, 160) to (216, 160) then Sets a single cyan pixel at (83, 196).
; PLAN: r0=332(x1), r1=160(y1), r2=216(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=196(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 332
LDI r1, 160
LDI r2, 216
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 196
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
