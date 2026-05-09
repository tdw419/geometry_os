; DESCRIPTION: Places a black line segment connecting (133, 189) to (227, 100).
; PLAN: r0=133(x1), r1=189(y1), r2=227(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 189
LDI r2, 227
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
