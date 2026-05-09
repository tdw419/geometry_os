; DESCRIPTION: Places a blue line segment connecting (106, 161) to (31, 73).
; PLAN: r0=106(x1), r1=161(y1), r2=31(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 161
LDI r2, 31
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
