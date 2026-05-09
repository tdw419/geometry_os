; DESCRIPTION: Draws a blue line from (159, 75) to (322, 82).
; PLAN: r0=159(x1), r1=75(y1), r2=322(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 75
LDI r2, 322
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
