; DESCRIPTION: Renders a orange line between points (0, 112) and (289, 52).
; PLAN: r0=0(x1), r1=112(y1), r2=289(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 112
LDI r2, 289
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
