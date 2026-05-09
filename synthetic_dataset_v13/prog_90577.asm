; DESCRIPTION: Renders a white line between points (35, 79) and (336, 41).
; PLAN: r0=35(x1), r1=79(y1), r2=336(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 79
LDI r2, 336
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
