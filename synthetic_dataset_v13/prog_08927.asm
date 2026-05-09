; DESCRIPTION: Renders a orange line between points (270, 76) and (493, 51).
; PLAN: r0=270(x1), r1=76(y1), r2=493(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 76
LDI r2, 493
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
