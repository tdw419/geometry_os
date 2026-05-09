; DESCRIPTION: Renders a orange line between points (318, 51) and (350, 171).
; PLAN: r0=318(x1), r1=51(y1), r2=350(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 51
LDI r2, 350
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
