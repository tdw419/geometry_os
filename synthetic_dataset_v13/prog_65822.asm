; DESCRIPTION: Renders a yellow line between points (98, 41) and (60, 118).
; PLAN: r0=98(x1), r1=41(y1), r2=60(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 41
LDI r2, 60
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
