; DESCRIPTION: Draws a purple line from (312, 73) to (258, 207).
; PLAN: r0=312(x1), r1=73(y1), r2=258(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 73
LDI r2, 258
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
