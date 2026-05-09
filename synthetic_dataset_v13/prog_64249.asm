; DESCRIPTION: Renders a red line between points (336, 41) and (217, 179).
; PLAN: r0=336(x1), r1=41(y1), r2=217(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 41
LDI r2, 217
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
