; DESCRIPTION: Places a blue line segment connecting (18, 201) to (343, 33).
; PLAN: r0=18(x1), r1=201(y1), r2=343(x2), r3=33(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 201
LDI r2, 343
LDI r3, 33
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
