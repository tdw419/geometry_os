; DESCRIPTION: Renders a orange line between points (185, 51) and (2, 234).
; PLAN: r0=185(x1), r1=51(y1), r2=2(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 51
LDI r2, 2
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
