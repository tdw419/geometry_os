; DESCRIPTION: Places a red line segment connecting (331, 181) to (41, 218).
; PLAN: r0=331(x1), r1=181(y1), r2=41(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 181
LDI r2, 41
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
