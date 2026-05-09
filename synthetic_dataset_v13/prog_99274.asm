; DESCRIPTION: Draws a purple line from (312, 134) to (297, 48).
; PLAN: r0=312(x1), r1=134(y1), r2=297(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 134
LDI r2, 297
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
