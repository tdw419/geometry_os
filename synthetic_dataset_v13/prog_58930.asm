; DESCRIPTION: Places a blue line segment connecting (200, 117) to (399, 148).
; PLAN: r0=200(x1), r1=117(y1), r2=399(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 117
LDI r2, 399
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
