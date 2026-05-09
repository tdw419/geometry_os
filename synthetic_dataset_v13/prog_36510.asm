; DESCRIPTION: Draws a purple line from (139, 164) to (112, 119).
; PLAN: r0=139(x1), r1=164(y1), r2=112(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 164
LDI r2, 112
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
