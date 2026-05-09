; DESCRIPTION: Places a blue line segment connecting (106, 214) to (149, 121).
; PLAN: r0=106(x1), r1=214(y1), r2=149(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 214
LDI r2, 149
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
