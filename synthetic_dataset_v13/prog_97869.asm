; DESCRIPTION: Places a magenta line segment connecting (31, 25) to (194, 218).
; PLAN: r0=31(x1), r1=25(y1), r2=194(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 25
LDI r2, 194
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
