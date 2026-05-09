; DESCRIPTION: Places a blue line segment connecting (31, 185) to (78, 26).
; PLAN: r0=31(x1), r1=185(y1), r2=78(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 185
LDI r2, 78
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
