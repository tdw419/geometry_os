; DESCRIPTION: Renders a purple line between points (119, 65) and (41, 161).
; PLAN: r0=119(x1), r1=65(y1), r2=41(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 65
LDI r2, 41
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
