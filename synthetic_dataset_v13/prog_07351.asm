; DESCRIPTION: Places a red line segment connecting (306, 41) to (6, 193).
; PLAN: r0=306(x1), r1=41(y1), r2=6(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 41
LDI r2, 6
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
