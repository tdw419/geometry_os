; DESCRIPTION: Renders a orange line between points (29, 132) and (81, 15).
; PLAN: r0=29(x1), r1=132(y1), r2=81(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 132
LDI r2, 81
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
