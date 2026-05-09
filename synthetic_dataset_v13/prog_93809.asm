; DESCRIPTION: Places a red line segment connecting (463, 252) to (92, 41).
; PLAN: r0=463(x1), r1=252(y1), r2=92(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 252
LDI r2, 92
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
