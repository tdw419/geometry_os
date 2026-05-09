; DESCRIPTION: Draws a red line from (194, 191) to (201, 248).
; PLAN: r0=194(x1), r1=191(y1), r2=201(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 191
LDI r2, 201
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
