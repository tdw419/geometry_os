; DESCRIPTION: Draws a blue line from (390, 15) to (470, 185).
; PLAN: r0=390(x1), r1=15(y1), r2=470(x2), r3=185(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 15
LDI r2, 470
LDI r3, 185
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
