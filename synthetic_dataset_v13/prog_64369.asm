; DESCRIPTION: Places a blue line segment connecting (312, 53) to (419, 208).
; PLAN: r0=312(x1), r1=53(y1), r2=419(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 53
LDI r2, 419
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
