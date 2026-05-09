; DESCRIPTION: Places a orange line segment connecting (182, 153) to (484, 189).
; PLAN: r0=182(x1), r1=153(y1), r2=484(x2), r3=189(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 153
LDI r2, 484
LDI r3, 189
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
