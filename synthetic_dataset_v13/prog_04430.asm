; DESCRIPTION: Places a blue line segment connecting (288, 162) to (159, 79).
; PLAN: r0=288(x1), r1=162(y1), r2=159(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 162
LDI r2, 159
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
