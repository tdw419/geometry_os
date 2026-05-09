; DESCRIPTION: Renders a orange line between points (167, 47) and (287, 10).
; PLAN: r0=167(x1), r1=47(y1), r2=287(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 47
LDI r2, 287
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
