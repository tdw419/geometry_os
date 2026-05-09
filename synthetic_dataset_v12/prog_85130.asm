; DESCRIPTION: Draws a blue line from (158, 255) to (247, 119).
; PLAN: r0=158(x1), r1=255(y1), r2=247(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 255
LDI r2, 247
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
