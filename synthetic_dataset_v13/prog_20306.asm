; DESCRIPTION: Places a red line segment connecting (244, 18) to (432, 92).
; PLAN: r0=244(x1), r1=18(y1), r2=432(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 18
LDI r2, 432
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
