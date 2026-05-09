; DESCRIPTION: Places a red line segment connecting (511, 41) to (407, 38).
; PLAN: r0=511(x1), r1=41(y1), r2=407(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 41
LDI r2, 407
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
