; DESCRIPTION: Renders a orange line between points (51, 233) and (102, 116).
; PLAN: r0=51(x1), r1=233(y1), r2=102(x2), r3=116(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 233
LDI r2, 102
LDI r3, 116
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
