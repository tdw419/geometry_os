; DESCRIPTION: Places a blue line segment connecting (345, 218) to (288, 26).
; PLAN: r0=345(x1), r1=218(y1), r2=288(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 218
LDI r2, 288
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
