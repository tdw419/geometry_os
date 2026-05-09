; DESCRIPTION: Renders a orange line between points (134, 194) and (51, 72).
; PLAN: r0=134(x1), r1=194(y1), r2=51(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 194
LDI r2, 51
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
