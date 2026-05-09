; DESCRIPTION: Draws a blue line from (436, 73) to (322, 157).
; PLAN: r0=436(x1), r1=73(y1), r2=322(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 73
LDI r2, 322
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
