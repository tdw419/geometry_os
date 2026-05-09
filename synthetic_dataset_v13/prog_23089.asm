; DESCRIPTION: Draws a orange line from (332, 51) to (496, 109).
; PLAN: r0=332(x1), r1=51(y1), r2=496(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 51
LDI r2, 496
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
