; DESCRIPTION: Places a black line segment connecting (31, 100) to (44, 36).
; PLAN: r0=31(x1), r1=100(y1), r2=44(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 100
LDI r2, 44
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
