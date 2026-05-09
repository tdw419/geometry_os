; DESCRIPTION: Renders a red line between points (78, 38) and (378, 41).
; PLAN: r0=78(x1), r1=38(y1), r2=378(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 38
LDI r2, 378
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
