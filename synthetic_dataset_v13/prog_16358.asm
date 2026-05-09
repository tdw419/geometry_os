; DESCRIPTION: Renders a orange line between points (17, 35) and (443, 34).
; PLAN: r0=17(x1), r1=35(y1), r2=443(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 35
LDI r2, 443
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
