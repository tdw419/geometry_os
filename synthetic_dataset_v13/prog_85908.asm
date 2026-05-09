; DESCRIPTION: Draws a black line from (322, 181) to (44, 5).
; PLAN: r0=322(x1), r1=181(y1), r2=44(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 181
LDI r2, 44
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
