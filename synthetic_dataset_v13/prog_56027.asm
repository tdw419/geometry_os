; DESCRIPTION: Renders a orange line between points (472, 51) and (31, 43).
; PLAN: r0=472(x1), r1=51(y1), r2=31(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 51
LDI r2, 31
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
