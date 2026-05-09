; DESCRIPTION: Renders a yellow line between points (311, 41) and (117, 13).
; PLAN: r0=311(x1), r1=41(y1), r2=117(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 41
LDI r2, 117
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
