; DESCRIPTION: Renders a orange line between points (227, 142) and (474, 85).
; PLAN: r0=227(x1), r1=142(y1), r2=474(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 142
LDI r2, 474
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
