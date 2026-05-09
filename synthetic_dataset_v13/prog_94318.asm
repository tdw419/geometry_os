; DESCRIPTION: Places a red line segment connecting (229, 41) to (184, 217).
; PLAN: r0=229(x1), r1=41(y1), r2=184(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 41
LDI r2, 184
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
