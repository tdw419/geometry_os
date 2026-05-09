; DESCRIPTION: Places a yellow line segment connecting (41, 68) to (30, 92).
; PLAN: r0=41(x1), r1=68(y1), r2=30(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 68
LDI r2, 30
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
