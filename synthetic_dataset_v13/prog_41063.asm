; DESCRIPTION: Renders a orange line between points (51, 214) and (195, 112).
; PLAN: r0=51(x1), r1=214(y1), r2=195(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 214
LDI r2, 195
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
