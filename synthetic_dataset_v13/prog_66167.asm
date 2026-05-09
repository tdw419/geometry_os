; DESCRIPTION: Places a blue line segment connecting (452, 121) to (149, 29).
; PLAN: r0=452(x1), r1=121(y1), r2=149(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 121
LDI r2, 149
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
