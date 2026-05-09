; DESCRIPTION: Places a blue line segment connecting (325, 131) to (132, 100).
; PLAN: r0=325(x1), r1=131(y1), r2=132(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 131
LDI r2, 132
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
