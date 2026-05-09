; DESCRIPTION: Draws a blue line from (65, 231) to (155, 218).
; PLAN: r0=65(x1), r1=231(y1), r2=155(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 231
LDI r2, 155
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
