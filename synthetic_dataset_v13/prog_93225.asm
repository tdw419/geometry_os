; DESCRIPTION: Places a blue line segment connecting (309, 100) to (188, 77).
; PLAN: r0=309(x1), r1=100(y1), r2=188(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 100
LDI r2, 188
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
