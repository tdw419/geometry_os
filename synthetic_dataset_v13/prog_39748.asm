; DESCRIPTION: Renders a orange line between points (142, 81) and (497, 130).
; PLAN: r0=142(x1), r1=81(y1), r2=497(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 81
LDI r2, 497
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
