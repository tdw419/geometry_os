; DESCRIPTION: Draws a blue line from (84, 201) to (180, 44).
; PLAN: r0=84(x1), r1=201(y1), r2=180(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 201
LDI r2, 180
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
