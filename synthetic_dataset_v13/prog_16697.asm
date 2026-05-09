; DESCRIPTION: Draws a blue line from (191, 87) to (501, 84).
; PLAN: r0=191(x1), r1=87(y1), r2=501(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 87
LDI r2, 501
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
