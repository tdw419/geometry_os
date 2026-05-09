; DESCRIPTION: Renders a orange line between points (165, 51) and (32, 112).
; PLAN: r0=165(x1), r1=51(y1), r2=32(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 51
LDI r2, 32
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
