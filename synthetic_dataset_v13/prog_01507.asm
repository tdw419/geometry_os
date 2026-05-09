; DESCRIPTION: Draws a blue line from (363, 101) to (93, 35).
; PLAN: r0=363(x1), r1=101(y1), r2=93(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 101
LDI r2, 93
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
