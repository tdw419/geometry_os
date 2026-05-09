; DESCRIPTION: Places a blue line segment connecting (145, 122) to (201, 249).
; PLAN: r0=145(x1), r1=122(y1), r2=201(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 122
LDI r2, 201
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
