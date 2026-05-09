; DESCRIPTION: Renders a orange line between points (214, 97) and (155, 51).
; PLAN: r0=214(x1), r1=97(y1), r2=155(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 97
LDI r2, 155
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
