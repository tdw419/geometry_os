; DESCRIPTION: Renders a orange line between points (118, 52) and (107, 44).
; PLAN: r0=118(x1), r1=52(y1), r2=107(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 52
LDI r2, 107
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
