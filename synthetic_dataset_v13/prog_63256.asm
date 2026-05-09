; DESCRIPTION: Renders a white line between points (35, 105) and (41, 12).
; PLAN: r0=35(x1), r1=105(y1), r2=41(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 105
LDI r2, 41
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
