; DESCRIPTION: Draws a yellow line from (336, 51) to (322, 141).
; PLAN: r0=336(x1), r1=51(y1), r2=322(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 51
LDI r2, 322
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
