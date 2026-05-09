; DESCRIPTION: Renders a orange line between points (153, 106) and (176, 219).
; PLAN: r0=153(x1), r1=106(y1), r2=176(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 106
LDI r2, 176
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
