; DESCRIPTION: Places a blue line segment connecting (100, 184) to (99, 82).
; PLAN: r0=100(x1), r1=184(y1), r2=99(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 184
LDI r2, 99
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
