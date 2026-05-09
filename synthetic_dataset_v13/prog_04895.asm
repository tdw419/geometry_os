; DESCRIPTION: Draws a blue line from (396, 132) to (269, 238).
; PLAN: r0=396(x1), r1=132(y1), r2=269(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 132
LDI r2, 269
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
