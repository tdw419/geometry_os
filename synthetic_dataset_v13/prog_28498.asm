; DESCRIPTION: Places a blue line segment connecting (439, 201) to (161, 127).
; PLAN: r0=439(x1), r1=201(y1), r2=161(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 201
LDI r2, 161
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
