; DESCRIPTION: Places a blue line segment connecting (278, 201) to (5, 43).
; PLAN: r0=278(x1), r1=201(y1), r2=5(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 201
LDI r2, 5
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
