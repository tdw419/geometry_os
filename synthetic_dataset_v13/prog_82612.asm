; DESCRIPTION: Renders a white line between points (339, 54) and (41, 233).
; PLAN: r0=339(x1), r1=54(y1), r2=41(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 54
LDI r2, 41
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
