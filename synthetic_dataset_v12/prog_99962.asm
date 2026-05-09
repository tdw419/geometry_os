; DESCRIPTION: Places a blue line segment connecting (355, 30) to (274, 133).
; PLAN: r0=355(x1), r1=30(y1), r2=274(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 30
LDI r2, 274
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
