; DESCRIPTION: Draws a black line from (287, 84) to (322, 250).
; PLAN: r0=287(x1), r1=84(y1), r2=322(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 84
LDI r2, 322
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
