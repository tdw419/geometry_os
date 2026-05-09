; DESCRIPTION: Draws a blue line from (11, 231) to (389, 205).
; PLAN: r0=11(x1), r1=231(y1), r2=389(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 231
LDI r2, 389
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
