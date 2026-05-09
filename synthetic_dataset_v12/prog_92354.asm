; DESCRIPTION: Draws a black line from (276, 179) to (201, 71).
; PLAN: r0=276(x1), r1=179(y1), r2=201(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 179
LDI r2, 201
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
