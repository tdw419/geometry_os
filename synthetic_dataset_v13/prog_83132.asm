; DESCRIPTION: Places a blue line segment connecting (200, 254) to (55, 170).
; PLAN: r0=200(x1), r1=254(y1), r2=55(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 254
LDI r2, 55
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
