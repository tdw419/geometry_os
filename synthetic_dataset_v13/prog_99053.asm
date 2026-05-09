; DESCRIPTION: Renders a red line between points (41, 58) and (143, 102).
; PLAN: r0=41(x1), r1=58(y1), r2=143(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 58
LDI r2, 143
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
