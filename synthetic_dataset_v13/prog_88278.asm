; DESCRIPTION: Places a red line segment connecting (41, 28) to (97, 26).
; PLAN: r0=41(x1), r1=28(y1), r2=97(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 28
LDI r2, 97
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
