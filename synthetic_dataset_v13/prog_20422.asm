; DESCRIPTION: Renders a yellow line between points (310, 5) and (306, 41).
; PLAN: r0=310(x1), r1=5(y1), r2=306(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 5
LDI r2, 306
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
