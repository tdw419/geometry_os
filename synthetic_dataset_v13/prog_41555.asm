; DESCRIPTION: Places a blue line segment connecting (31, 57) to (140, 218).
; PLAN: r0=31(x1), r1=57(y1), r2=140(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 57
LDI r2, 140
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
