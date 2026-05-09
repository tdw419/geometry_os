; DESCRIPTION: Draws a blue line from (97, 94) to (421, 112).
; PLAN: r0=97(x1), r1=94(y1), r2=421(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 94
LDI r2, 421
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
