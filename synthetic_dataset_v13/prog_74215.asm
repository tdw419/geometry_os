; DESCRIPTION: Renders a green line between points (137, 5) and (34, 41).
; PLAN: r0=137(x1), r1=5(y1), r2=34(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 5
LDI r2, 34
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
