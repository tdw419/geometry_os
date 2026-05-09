; DESCRIPTION: Composite: Renders a white line between points (87, 190) and (293, 20) then Sets a single yellow pixel at (390, 236).
; PLAN: r0=87(x1), r1=190(y1), r2=293(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=236(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 87
LDI r1, 190
LDI r2, 293
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 236
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
