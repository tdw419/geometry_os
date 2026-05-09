; DESCRIPTION: Places a blue line segment connecting (79, 5) to (456, 201).
; PLAN: r0=79(x1), r1=5(y1), r2=456(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 5
LDI r2, 456
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
