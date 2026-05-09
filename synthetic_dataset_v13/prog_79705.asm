; DESCRIPTION: Draws a blue line from (11, 200) to (356, 145).
; PLAN: r0=11(x1), r1=200(y1), r2=356(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 200
LDI r2, 356
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
