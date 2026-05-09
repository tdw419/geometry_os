; DESCRIPTION: Renders a black line between points (93, 124) and (12, 41).
; PLAN: r0=93(x1), r1=124(y1), r2=12(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 124
LDI r2, 12
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
