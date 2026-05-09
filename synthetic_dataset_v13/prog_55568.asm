; DESCRIPTION: Places a orange line segment connecting (345, 89) to (31, 141).
; PLAN: r0=345(x1), r1=89(y1), r2=31(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 89
LDI r2, 31
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
