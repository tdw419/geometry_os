; DESCRIPTION: Draws a purple line from (461, 45) to (417, 191).
; PLAN: r0=461(x1), r1=45(y1), r2=417(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 45
LDI r2, 417
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
