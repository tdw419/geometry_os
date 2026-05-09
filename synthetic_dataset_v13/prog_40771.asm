; DESCRIPTION: Renders a orange line between points (286, 232) and (471, 132).
; PLAN: r0=286(x1), r1=232(y1), r2=471(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 232
LDI r2, 471
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
