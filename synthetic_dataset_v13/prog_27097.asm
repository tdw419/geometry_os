; DESCRIPTION: Draws a blue line from (158, 122) to (159, 58).
; PLAN: r0=158(x1), r1=122(y1), r2=159(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 122
LDI r2, 159
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
