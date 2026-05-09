; DESCRIPTION: Places a blue line segment connecting (73, 133) to (53, 3).
; PLAN: r0=73(x1), r1=133(y1), r2=53(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 133
LDI r2, 53
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
