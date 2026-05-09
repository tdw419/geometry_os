; DESCRIPTION: Draws a blue line from (102, 169) to (19, 238).
; PLAN: r0=102(x1), r1=169(y1), r2=19(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 169
LDI r2, 19
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
