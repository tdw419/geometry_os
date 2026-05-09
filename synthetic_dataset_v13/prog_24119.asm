; DESCRIPTION: Renders a orange line between points (493, 84) and (334, 237).
; PLAN: r0=493(x1), r1=84(y1), r2=334(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 84
LDI r2, 334
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
