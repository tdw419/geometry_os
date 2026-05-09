; DESCRIPTION: Draws a blue line from (93, 46) to (153, 51).
; PLAN: r0=93(x1), r1=46(y1), r2=153(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 46
LDI r2, 153
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
