; DESCRIPTION: Places a blue line segment connecting (162, 183) to (438, 79).
; PLAN: r0=162(x1), r1=183(y1), r2=438(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 183
LDI r2, 438
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
