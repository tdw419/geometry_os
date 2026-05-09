; DESCRIPTION: Places a blue line segment connecting (123, 84) to (419, 120).
; PLAN: r0=123(x1), r1=84(y1), r2=419(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 84
LDI r2, 419
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
