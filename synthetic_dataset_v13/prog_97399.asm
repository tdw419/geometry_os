; DESCRIPTION: Draws a blue line from (63, 231) to (97, 92).
; PLAN: r0=63(x1), r1=231(y1), r2=97(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 231
LDI r2, 97
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
