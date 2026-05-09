; DESCRIPTION: Draws a purple line from (45, 31) to (467, 251).
; PLAN: r0=45(x1), r1=31(y1), r2=467(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 31
LDI r2, 467
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
