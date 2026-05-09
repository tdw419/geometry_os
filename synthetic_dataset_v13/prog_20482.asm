; DESCRIPTION: Renders a purple line between points (85, 41) and (184, 146).
; PLAN: r0=85(x1), r1=41(y1), r2=184(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 41
LDI r2, 184
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
