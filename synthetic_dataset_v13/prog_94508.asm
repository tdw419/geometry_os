; DESCRIPTION: Places a orange line segment connecting (511, 22) to (12, 44).
; PLAN: r0=511(x1), r1=22(y1), r2=12(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 22
LDI r2, 12
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
