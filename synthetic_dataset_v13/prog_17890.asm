; DESCRIPTION: Renders a yellow line between points (2, 186) and (41, 35).
; PLAN: r0=2(x1), r1=186(y1), r2=41(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 186
LDI r2, 41
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
