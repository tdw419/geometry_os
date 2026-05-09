; DESCRIPTION: Places a red line segment connecting (457, 58) to (485, 34).
; PLAN: r0=457(x1), r1=58(y1), r2=485(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 58
LDI r2, 485
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
