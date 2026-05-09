; DESCRIPTION: Renders a orange line between points (343, 217) and (141, 51).
; PLAN: r0=343(x1), r1=217(y1), r2=141(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 217
LDI r2, 141
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
