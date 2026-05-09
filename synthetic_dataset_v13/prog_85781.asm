; DESCRIPTION: Draws a purple line from (51, 88) to (322, 229).
; PLAN: r0=51(x1), r1=88(y1), r2=322(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 88
LDI r2, 322
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
