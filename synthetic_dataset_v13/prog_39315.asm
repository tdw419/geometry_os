; DESCRIPTION: Renders a red line between points (241, 41) and (408, 233).
; PLAN: r0=241(x1), r1=41(y1), r2=408(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 41
LDI r2, 408
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
