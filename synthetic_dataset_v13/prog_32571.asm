; DESCRIPTION: Renders a orange line between points (90, 219) and (115, 81).
; PLAN: r0=90(x1), r1=219(y1), r2=115(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 219
LDI r2, 115
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
