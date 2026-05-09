; DESCRIPTION: Draws a purple line from (30, 119) to (322, 182).
; PLAN: r0=30(x1), r1=119(y1), r2=322(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 119
LDI r2, 322
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
