; DESCRIPTION: Draws a blue line from (326, 238) to (110, 114).
; PLAN: r0=326(x1), r1=238(y1), r2=110(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 238
LDI r2, 110
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
