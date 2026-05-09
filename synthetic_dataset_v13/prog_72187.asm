; DESCRIPTION: Places a blue line segment connecting (74, 140) to (201, 180).
; PLAN: r0=74(x1), r1=140(y1), r2=201(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 140
LDI r2, 201
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
