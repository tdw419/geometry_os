; DESCRIPTION: Places a red line segment connecting (87, 41) to (358, 22).
; PLAN: r0=87(x1), r1=41(y1), r2=358(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 41
LDI r2, 358
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
