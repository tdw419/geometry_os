; DESCRIPTION: Renders a yellow line between points (248, 6) and (342, 41).
; PLAN: r0=248(x1), r1=6(y1), r2=342(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 6
LDI r2, 342
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
