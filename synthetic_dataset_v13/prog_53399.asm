; DESCRIPTION: Draws a blue line from (18, 181) to (451, 51).
; PLAN: r0=18(x1), r1=181(y1), r2=451(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 181
LDI r2, 451
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
