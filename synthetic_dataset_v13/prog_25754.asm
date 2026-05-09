; DESCRIPTION: Renders a orange line between points (411, 5) and (138, 244).
; PLAN: r0=411(x1), r1=5(y1), r2=138(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 5
LDI r2, 138
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
