; DESCRIPTION: Places a orange line segment connecting (368, 4) to (73, 34).
; PLAN: r0=368(x1), r1=4(y1), r2=73(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 4
LDI r2, 73
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
