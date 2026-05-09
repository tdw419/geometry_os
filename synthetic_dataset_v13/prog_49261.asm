; DESCRIPTION: Renders a orange line between points (189, 19) and (505, 244).
; PLAN: r0=189(x1), r1=19(y1), r2=505(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 19
LDI r2, 505
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
