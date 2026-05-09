; DESCRIPTION: Draws a purple line from (322, 98) to (349, 95).
; PLAN: r0=322(x1), r1=98(y1), r2=349(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 98
LDI r2, 349
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
