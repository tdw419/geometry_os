; DESCRIPTION: Renders a blue line between points (2, 17) and (352, 41).
; PLAN: r0=2(x1), r1=17(y1), r2=352(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 17
LDI r2, 352
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
