; DESCRIPTION: Renders a orange line between points (72, 14) and (496, 51).
; PLAN: r0=72(x1), r1=14(y1), r2=496(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 14
LDI r2, 496
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
