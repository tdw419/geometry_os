; DESCRIPTION: Renders a orange line between points (505, 169) and (442, 1).
; PLAN: r0=505(x1), r1=169(y1), r2=442(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 169
LDI r2, 442
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
