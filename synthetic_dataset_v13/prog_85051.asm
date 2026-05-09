; DESCRIPTION: Places a blue line segment connecting (201, 35) to (160, 150).
; PLAN: r0=201(x1), r1=35(y1), r2=160(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 35
LDI r2, 160
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
