; DESCRIPTION: Places a blue line segment connecting (343, 161) to (434, 201).
; PLAN: r0=343(x1), r1=161(y1), r2=434(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 161
LDI r2, 434
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
