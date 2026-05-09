; DESCRIPTION: Places a blue line segment connecting (89, 145) to (496, 13).
; PLAN: r0=89(x1), r1=145(y1), r2=496(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 145
LDI r2, 496
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
