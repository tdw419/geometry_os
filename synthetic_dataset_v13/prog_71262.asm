; DESCRIPTION: Places a blue line segment connecting (484, 225) to (12, 140).
; PLAN: r0=484(x1), r1=225(y1), r2=12(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 225
LDI r2, 12
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
