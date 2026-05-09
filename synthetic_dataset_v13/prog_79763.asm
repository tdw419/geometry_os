; DESCRIPTION: Draws a blue line from (322, 137) to (4, 43).
; PLAN: r0=322(x1), r1=137(y1), r2=4(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 137
LDI r2, 4
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
