; DESCRIPTION: Places a red line segment connecting (501, 31) to (130, 121).
; PLAN: r0=501(x1), r1=31(y1), r2=130(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 31
LDI r2, 130
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
