; DESCRIPTION: Draws a purple line from (486, 11) to (141, 43).
; PLAN: r0=486(x1), r1=11(y1), r2=141(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 11
LDI r2, 141
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
