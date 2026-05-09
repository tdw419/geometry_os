; DESCRIPTION: Places a purple line segment connecting (149, 11) to (2, 244).
; PLAN: r0=149(x1), r1=11(y1), r2=2(x2), r3=244(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 11
LDI r2, 2
LDI r3, 244
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
