; DESCRIPTION: Renders a red line between points (244, 41) and (456, 112).
; PLAN: r0=244(x1), r1=41(y1), r2=456(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 41
LDI r2, 456
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
