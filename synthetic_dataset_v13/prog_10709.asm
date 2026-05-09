; DESCRIPTION: Places a blue line segment connecting (131, 125) to (108, 133).
; PLAN: r0=131(x1), r1=125(y1), r2=108(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 125
LDI r2, 108
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
