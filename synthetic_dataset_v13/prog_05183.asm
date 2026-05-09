; DESCRIPTION: Places a white line segment connecting (170, 41) to (116, 31).
; PLAN: r0=170(x1), r1=41(y1), r2=116(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 41
LDI r2, 116
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
