; DESCRIPTION: Draws a blue line from (451, 78) to (378, 134).
; PLAN: r0=451(x1), r1=78(y1), r2=378(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 78
LDI r2, 378
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
