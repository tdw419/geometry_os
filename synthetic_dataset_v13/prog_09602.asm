; DESCRIPTION: Places a red line segment connecting (27, 41) to (194, 185).
; PLAN: r0=27(x1), r1=41(y1), r2=194(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 41
LDI r2, 194
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
