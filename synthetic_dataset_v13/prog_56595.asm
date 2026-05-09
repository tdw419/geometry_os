; DESCRIPTION: Places a blue line segment connecting (227, 14) to (61, 131).
; PLAN: r0=227(x1), r1=14(y1), r2=61(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 14
LDI r2, 61
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
