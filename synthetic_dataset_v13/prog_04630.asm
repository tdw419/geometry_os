; DESCRIPTION: Places a green line segment connecting (432, 100) to (381, 238).
; PLAN: r0=432(x1), r1=100(y1), r2=381(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 100
LDI r2, 381
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
