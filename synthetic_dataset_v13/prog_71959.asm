; DESCRIPTION: Places a red line segment connecting (11, 214) to (495, 41).
; PLAN: r0=11(x1), r1=214(y1), r2=495(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 214
LDI r2, 495
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
