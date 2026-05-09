; DESCRIPTION: Draws a blue line from (371, 102) to (38, 185).
; PLAN: r0=371(x1), r1=102(y1), r2=38(x2), r3=185(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 102
LDI r2, 38
LDI r3, 185
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
