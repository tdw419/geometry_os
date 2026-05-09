; DESCRIPTION: Places a blue line segment connecting (449, 31) to (172, 77).
; PLAN: r0=449(x1), r1=31(y1), r2=172(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 31
LDI r2, 172
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
