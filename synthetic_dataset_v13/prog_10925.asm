; DESCRIPTION: Renders a orange line between points (409, 113) and (167, 95).
; PLAN: r0=409(x1), r1=113(y1), r2=167(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 113
LDI r2, 167
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
