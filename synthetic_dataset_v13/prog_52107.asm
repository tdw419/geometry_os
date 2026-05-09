; DESCRIPTION: Places a blue line segment connecting (321, 185) to (53, 206).
; PLAN: r0=321(x1), r1=185(y1), r2=53(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 185
LDI r2, 53
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
