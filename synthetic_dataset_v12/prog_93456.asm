; DESCRIPTION: Renders a red line between points (461, 130) and (98, 41).
; PLAN: r0=461(x1), r1=130(y1), r2=98(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 130
LDI r2, 98
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
