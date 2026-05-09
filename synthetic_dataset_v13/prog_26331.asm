; DESCRIPTION: Places a white line segment connecting (266, 41) to (31, 12).
; PLAN: r0=266(x1), r1=41(y1), r2=31(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 41
LDI r2, 31
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
