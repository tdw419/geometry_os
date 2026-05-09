; DESCRIPTION: Renders a orange line between points (484, 188) and (286, 24).
; PLAN: r0=484(x1), r1=188(y1), r2=286(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 188
LDI r2, 286
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
