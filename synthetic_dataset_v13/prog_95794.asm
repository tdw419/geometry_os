; DESCRIPTION: Draws a purple line from (300, 185) to (437, 48).
; PLAN: r0=300(x1), r1=185(y1), r2=437(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 185
LDI r2, 437
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
