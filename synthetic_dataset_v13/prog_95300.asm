; DESCRIPTION: Places a blue line segment connecting (129, 135) to (149, 189).
; PLAN: r0=129(x1), r1=135(y1), r2=149(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 135
LDI r2, 149
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
